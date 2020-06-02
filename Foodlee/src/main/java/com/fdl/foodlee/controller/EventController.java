package com.fdl.foodlee.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fdl.foodlee.model.vo.EventVO;
import com.fdl.foodlee.model.vo.virtual.EventRowVO;
import com.fdl.foodlee.service.inf.IEventAnswerSVC;
import com.fdl.foodlee.service.inf.IEventSVC;



@Controller
public class EventController {
	@Autowired
	private IEventSVC evSvc;
	@Autowired
	private IEventAnswerSVC asSvc;
	
	
	public String filePath = null;
	String realFileNm = "";
//- 관리자가 신규 이벤트 게시글을 등록할 수 있다.(+파일업로드..)
//	event_new_form.fdl (get)
	@RequestMapping(value = "event_new_form.fdl", 
			method = RequestMethod.GET)
	public String eventNewForm() {
		System.out.println("eventNewForm() ... ");
		// 
		return "event/ev_new_form";
	}
	
//	photouploader.fdl
	@RequestMapping(value = "/smartEditor/sample/photo_uploader/photouploader.fdl", method = RequestMethod.POST)
	public void multiplePhotoUpload(HttpServletRequest request, HttpServletResponse response) {
		try {
			// 파일정보
			String sFileInfo = "";
			String fileName = request.getHeader("file-name");			
			//String dftFilePath = request.getServletContext().getRealPath(request.getContextPath()+"/");
			String dftFilePath = request.getServletContext().getRealPath("/");
			//String filePath = dftFilePath + "resources/photo_upload";
			filePath = dftFilePath + "resources/photo_upload";
			File file = new File(filePath);
			if(!file.exists()) {
				file.mkdirs();
			}
			
			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
			String today = formatter.format(new java.util.Date());
			realFileNm = today+UUID.randomUUID().toString() + fileName.substring(fileName.lastIndexOf("."));
//			String rlFileNm = filePath +"/"+realFileNm;
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
	
	//event_add.fdl
	@RequestMapping(value = "event_add.fdl", method = RequestMethod.POST)
	public String eventShowProc(String title, 
			@RequestParam(value = "tags", required = false, defaultValue = "")String tags, String content, String std, @RequestParam(value = "edd", required = false, defaultValue = "1970-01-01")String edd, int onGoing) {
		System.out.println("eventNewForm() ... ");
		// 
		// public img src... 
			int evRtkey = this.evSvc
					//.insertNewEventReturnKey(title, content, std, edd, onGoing, filePath);
					.insertNewEventReturnKey(title, content, std, edd, onGoing, realFileNm);
			
			// 상세보기 => evId?
			if( evRtkey > 0 ) {
				//System.out.println("게시글 등록 성공: " + title);
				System.out.println("게시글 등록 성공: " + evRtkey);
				return "redirect:event_show.fdl?id="+evRtkey;
				//return "redirect:article_list.my"; // RD
			} else {
				System.out.println("게시글 등록 실패: " + title);
				return "event/ev_new_form"; // FW
			}
	}
	
//	//article_add.my (post, proc, dao, param..vo)
//	@RequestMapping(value = "article_add.my", 
//			method = RequestMethod.POST)
//	public String articleAddProc(String title, 
//			String tags, String content,
//			List<MultipartFile> upfiles, int memberId, 
//			HttpSession ses) {
//		System.out.println("articleAddProc()");
////		System.out.println("multipart: " + upfile.getName());
//		System.out.println("multipart size: " 
//						+ upfiles.size());
//				
//		String realPath =  
//			ses.getServletContext()
//			.getRealPath(IArticleFileSVC.DEF_UPLOAD_DEST)
//					 + "/";
//		
////		String filePath 
////			= atFileSvc.writeUploadedFile(upfile, 
////				realPath, (String)ses
////					.getAttribute("mbLoginName"));
//		
//		//String filePath  // 다수개 처리
//		Map<String, Object> rMap
//		 = atFileSvc.writeUploadedMultipleFiles(upfiles, 
//			realPath, (String)ses
//				.getAttribute("mbLoginName"));
//		String filePath = (String)rMap.get("muliFPs");
//		
//		System.out.println("총 파일 수: " + rMap.get("fileCnt"));
//		System.out.println("총 볼륨(MB): "+ rMap.get("totalMB") 
//				+"MB");
//		
//		// public img src... 
//		int atRtkey = this.atSvc
//				.insertNewArticleReturnKey(title, content, 
//				filePath, tags, memberId);
//		
//		// 상세보기 => atId?
//		if( atRtkey > 0 ) {
//			//System.out.println("게시글 등록 성공: " + title);
//			System.out.println("게시글 등록 성공: " + atRtkey);
//			return "redirect:article_show.my?id="+atRtkey;
//			//return "redirect:article_list.my"; // RD
//		} else {
//			System.out.println("게시글 등록 실패: " + title);
//			return "article/at_new_form"; // FW
//		}
//	}		
//	
	
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
//			String evFilePath = ev.getFilePath();
//			int fpsCount = -1;
//			if( evFilePath != null && !evFilePath.isEmpty() ) {
//				String fps[] = null;
//				if( evFilePath.indexOf(
//						IEventFileSVC.MULTI_SEP)
//					 != -1 ) {
//					fps = evFilePath.split(
//							"\\"+IEventFileSVC.MULTI_SEP);
////					System.out.println("fps => " + fps);
////					System.out.println("fp0 => " + fps[0]);
////					System.out.println("fp1 => " + fps[1]);
////					System.out.println("fp2 => " + fps[2]);
//					fpsCount = fps.length;					
//				} else {
//					fpsCount = 1;
//					fps = new String[]{evFilePath};
//				}
//				model.addAttribute("fps", fps);
//			} else {
//				// 첨부파일 없는 정상 게시글 상세보기
//				fpsCount = 0;
//			}
//			model.addAttribute("fpsCount", fpsCount);
			
//				 댓글 리스트
//			List<EventAnswerVO> evAsList 
//				= asSvc.answerListForEvent(ev.getEventId());
//			if( evAsList != null ) {
//				model.addAttribute("asSize", evAsList.size());
//				model.addAttribute("answers", evAsList );
//			} else {
//				model.addAttribute("msg", "댓글리스트 조회 실패");
//			}	
			return "event/ev_show";
		} else {			
			model.addAttribute("msg", 
				"게시글 상세조회 실패 - " + id);
			return "redirect:main.fdl";
		}
	}	
	
//- 회원이 이벤트 게시글을 좋아요 할 수 있다
//	event_like.fdl (get, proc, dao, param?evId&mbId..) 
//	@RequestMapping(value = "event_like.fdl", method = RequestMethod.GET)
//	@ResponseBody
//	public ResponseEntity<Map<String, Object>> foodTruckLike(@RequestParam(value = "tgSr") int tgSr,
//			@RequestParam(value = "sesMb") int sesMb, HttpSession ses) {
//		ResponseEntity<Map<String, Object>> re = null;
//		Map<String, Object> map = new HashMap<>();
//		int sesMbId = (int)ses.getAttribute("id"); // (int) ses.getAttribute("mbId");
//		if (sesMbId == sesMb) {
//			Map<String, Object> lkMap = mltSvc.processMemberLike(tgSr, sesMb);
//			int cntLikes = (int) lkMap.get("cntLikes");
//			String typeLike = (String) lkMap.get("typeLike");
//			if (cntLikes >= 0) {
//				map.put("code", 1); // OK
//				map.put("type", typeLike);
//				map.put("msg", "좋아요 " + (typeLike.equals("add") ? "추가" : "취소") + " 완료");
//				map.put("cntLikes", cntLikes);
//				re = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
//			} else {
//				map.put("code", 2); // OK. DAO/SVC error
//				map.put("type", typeLike);
//				map.put("msg", "좋아요 " + (typeLike.equals("add") ? "추가" : "취소") + " DAO/SVC error");
//				re = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
//			}
//		} else {
//			// 세션 불일치..
//			map.put("code", 3); // ERROR 3
//			map.put("msg", "세션 불일치..");
//			re = new ResponseEntity<Map<String, Object>>(map, HttpStatus.FORBIDDEN);
//		}
//		return re;
//	}
//- 관리자가 자신의 게시글을 편집 갱신 할 수 있다
//	event_edit_form.fdl (get, proc, dao, param?id)
//	event_edit_form.fdl (get, proc, dao, param?id)
	@RequestMapping(value = "event_edit_form.fdl", 
			method = RequestMethod.GET)
	public String eventEditForm(HttpSession ses,
			Model model, 
			@RequestParam(value = "evId", 
			 defaultValue = "0") int id) {
		if( id == 0 ) {
			return "redirect:/#event-list";
		} 
		EventVO ev = evSvc.selectOneEvent(id);
		if( ev != null ) {
			model.addAttribute("event", ev);
			return "event/ev_edit_form";
		} else {
			model.addAttribute("msg", 
					"게시글편집폼 준비 실패: 게시글 없음");
//			return "redirect:event_show.fdl?id="+id;
			return "redirect:/#event-list";
		}
	}	
//	article_update.my (post, proc, dao, param...vo)
	@RequestMapping(value = "event_update.fdl", 
			method = RequestMethod.POST)
	public String eventUpdateProc(
			//Model model,
			HttpSession ses, 
			@ModelAttribute(value = "event") EventVO ev // vo를 command객체로 사용하자.
//			@RequestParam(value="id",
//			 required = true)int id,
//			@RequestParam(value="title",
//			 required = true) String title, 
//			@RequestParam(value="content",
//			 required = true)String content,
//			@RequestParam(value="tags",
//			 required = true)String tags,
//			@RequestParam(value="memberId",
//			 required = true)int memberId
			) {
		System.out.println("event update: "+
			ev);
		
		if(ev.getEventEndDate() == null || ev.getEventEndDate().isEmpty()) ev.setEventEndDate("1970-01-01"); 
		//	at.getTitle());
		// memberId와 ses.mbId가 사실 일치해야 함...
		
		//boolean b = atSvc.updateArticle(
		// id, title, content, tags);
		boolean b = evSvc.updateEvent(ev);
		if( b ) {
			return "redirect:event_show.fdl?id="
					+ev.getEventId();
		} else {
			//model.addAttribute("article", at);
			return "event/ev_edit_form";
		}
	}
//- 관리자가 자신의 게시글을 삭제 할 수 있다
//	event_remove.fdl (get, proc, dao, param?id)
//- 이벤트 게시글 리스트를 조회할 수 있다. (페이지네이션, 정렬, 태그)
//	event_list.fdl (get, proc, dao)
//	event_list.fdl (get, proc, dao, param?pn&order)
//	@RequestMapping(value = "main.fdl", 
	@RequestMapping(value = "event_list.fdl", 
			method = RequestMethod.GET)
	public ModelAndView eventListProc(
				@RequestParam(value = "pn",
				required = false, 
				defaultValue = "1")
				int pageNumber) {
				//int pn) {
		System.out.println("eventListProc(PN)..");
		int maxPG = evSvc.checkMaxPageNumber();
		if( pageNumber > maxPG || pageNumber <= 0 ) {
			System.out.println("잘못된 페이지 번호: " + pageNumber);
			return new ModelAndView(
				"redirect:event_list.fdl?pn=1");
		}
		
		List<EventVO> evList =
				evSvc.showAllEvents(pageNumber);
		
		ModelAndView mav = 
			new ModelAndView("event/_ev_list");
		if( evList != null ) {
			mav.addObject("evSize", evList.size());
			mav.addObject("events", evList);
			mav.addObject("maxPn", maxPG);
			mav.addObject("pn", pageNumber); // 활성페이지			
			
			System.out.println("게시글리스트 pg 조회 성공: "
					+ evList.size());
		} else {
			mav.addObject("msg", "게시글리스트 pg 조회 실패!");
		}
		
		//return "article/at_list";
		return mav;
	}
//- 이벤트 게시글 리스트를 검색할 수 있다. (페이지네이션, 정렬)
//	event_form.fdl (get, form) 
//	event_search.fdl (post, proc, dao, param?pn&order&keyword&날짜 범위..)
}
