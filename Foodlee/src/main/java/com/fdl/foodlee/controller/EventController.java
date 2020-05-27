package com.fdl.foodlee.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fdl.foodlee.model.vo.EventAnswerVO;
import com.fdl.foodlee.model.vo.EventVO;
import com.fdl.foodlee.service.inf.IEventAnswerSVC;
import com.fdl.foodlee.service.inf.IEventFileSVC;
import com.fdl.foodlee.service.inf.IEventSVC;


@Controller
public class EventController {
	@Autowired
	private IEventSVC evSvc;
	@Autowired
	private IEventAnswerSVC asSvc;
//- 관리자가 신규 이벤트 게시글을 등록할 수 있다.(+파일업로드..)
//	event_new_form.fdl (get)
	@RequestMapping(value = "event_new_form.fdl", 
			method = RequestMethod.GET)
	public String eventNewForm() {
		System.out.println("eventNewForm() ... ");
		// 
		return "event/ev_new_form";
	}
//	event_add.fdl (post, proc, dao, param..vo)
	@RequestMapping("smartEditor/sample/photo_uploader/event_add.fdl")
	public void multiplePhotoUpload(HttpServletRequest request, HttpServletResponse response) {
		try {
			// 파일정보
			String sFileInfo = "";
			String fileName = request.getHeader("file-name");			
			//String dftFilePath = request.getServletContext().getRealPath(request.getContextPath()+"/");
			String dftFilePath = request.getServletContext().getRealPath("/");
			String filePath = dftFilePath + "resources/photo_upload";
			File file = new File(filePath);
			if(!file.exists()) {
				file.mkdirs();
			}
			String realFileNm = "";
			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
			String today = formatter.format(new java.util.Date());
			realFileNm = today+UUID.randomUUID().toString() + fileName.substring(fileName.lastIndexOf("."));
			String rlFileNm = filePath +"/"+realFileNm;
			
			InputStream is = request.getInputStream();
			OutputStream os = new FileOutputStream(rlFileNm);
			int numRead;
			byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
			while((numRead = is.read(b,0,b.length))!=-1) {
				os.write(b,0,numRead);
			}
			if(is != null) {
				is.close();
			}
			os.flush();
			os.close();
			
			sFileInfo += "&bNewLine=true";
			sFileInfo += "&sFileName=" +fileName;
			sFileInfo += "&sFileURL="+request.getContextPath()+"/resources/photo_upload/"+realFileNm;
			PrintWriter print = response.getWriter();
			print.print(sFileInfo);
			print.flush();
			print.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
//- 이벤트 게시글 상세보기 할 수 있다
//	event_show.fdl (get, proc, dao, param?id)
	@RequestMapping(value = "event_show.fdl", 
			method = RequestMethod.GET)
	public String eventShowProc(HttpSession ses, 
			int id, Model model) {
		EventVO ev = 
			this.evSvc.selectOneEvent(id);
		if( ev != null ) {
			System.out.println("게시글 상세조회 성공 "
						+ ev);
			model.addAttribute("event", ev);
			String evFilePath = ev.getFilePath();
			int fpsCount = -1;
			if( evFilePath != null && !evFilePath.isEmpty() ) {
				String fps[] = null;
				if( evFilePath.indexOf(
						IEventFileSVC.MULTI_SEP)
					 != -1 ) {
					fps = evFilePath.split(
							"\\"+IEventFileSVC.MULTI_SEP);
//					System.out.println("fps => " + fps);
//					System.out.println("fp0 => " + fps[0]);
//					System.out.println("fp1 => " + fps[1]);
//					System.out.println("fp2 => " + fps[2]);
					fpsCount = fps.length;					
				} else {
					fpsCount = 1;
					fps = new String[]{evFilePath};
				}
				model.addAttribute("fps", fps);
			} else {
				// 첨부파일 없는 정상 게시글 상세보기
				fpsCount = 0;
			}
			model.addAttribute("fpsCount", fpsCount);
			
			// 댓글 리스트
			List<EventAnswerVO> evAsList 
				= asSvc.answerListForEvent(ev.getEventId());
			if( evAsList != null ) {
				model.addAttribute("asSize", evAsList.size());
				model.addAttribute("answers", evAsList );
			} else {
				model.addAttribute("msg", "댓글리스트 조회 실패");
			}			
			return "event/ev_show";
		} else {			
			model.addAttribute("msg", 
				"게시글 상세조회 실패 - " + id);
			return "redirect:main.fdl";
		}
	}	
	
//- 회원이 이벤트 게시글을 좋아요 할 수 있다
//	event_like.fdl (get, proc, dao, param?evId&mbId..) 
//- 관리자가 자신의 게시글을 편집 갱신 할 수 있다
//	event_edit_form.fdl (get, proc, dao, param?id)
//	event_update.fdl (post, proc, dao, param...vo)
//- 관리자가 자신의 게시글을 삭제 할 수 있다
//	event_remove.fdl (get, proc, dao, param?id)
//- 이벤트 게시글 리스트를 조회할 수 있다. (페이지네이션, 정렬, 태그)
//	event_list.fdl (get, proc, dao)
//	event_list.fdl (get, proc, dao, param?pn&order)
//- 이벤트 게시글 리스트를 검색할 수 있다. (페이지네이션, 정렬)
//	event_form.fdl (get, form) 
//	event_search.fdl (post, proc, dao, param?pn&order&keyword&날짜 범위..)
}
