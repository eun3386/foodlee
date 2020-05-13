package com.fdl.foodlee.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.fdl.foodlee.model.vo.EventAnswerVO;
import com.fdl.foodlee.model.vo.EventVO;
import com.fdl.foodlee.service.inf.IEventAnswerSVC;
import com.fdl.foodlee.service.inf.IEventFileSVC;
import com.fdl.foodlee.service.inf.IEventSVC;

import com.fdl.foodlee.service.inf.IEventFileSVC;

@Controller
public class EventController {
	@Autowired
	private IEventSVC evSvc;
	@Autowired
	private IEventFileSVC evFileSvc;
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
	@RequestMapping(value = "event_add.fdl", 
			method = RequestMethod.POST)
	public String eventAddProc(String title, 
			String tags, String content,
			List<MultipartFile> upfiles, int memberId, 
			HttpSession ses) {
		System.out.println("eventAddProc()");
		System.out.println("multipart size: " 
						+ upfiles.size());
				
		String realPath =  
			ses.getServletContext()
			.getRealPath(IEventFileSVC.DEF_UPLOAD_DEST)
					 + "/";

		//String filePath  // 다수개 처리
		Map<String, Object> rMap
		 = evFileSvc.writeUploadedMultipleFiles(upfiles, 
			realPath, (String)ses
				.getAttribute("mbLoginName"));
		String filePath = (String)rMap.get("muliFPs");
		
		System.out.println("총 파일 수: " + rMap.get("fileCnt"));
		System.out.println("총 볼륨(MB): "+ rMap.get("totalMB") 
				+"MB");
		
		// public img src... 
		int atRtkey = this.evSvc
				.insertNewEventReturnKey(title, content, 
				filePath, tags, memberId);
		
		// 상세보기 => atId?
		if( atRtkey > 0 ) {
			System.out.println("게시글 등록 성공: " + atRtkey);
			return "redirect:Event_show.my?id="+atRtkey;
		} else {
			System.out.println("게시글 등록 실패: " + title);
			return "Event/event_new_form"; // FW
		}
	}	
//- 이벤트 게시글 상세보기 할 수 있다
//	event_show.fdl (get, proc, dao, param?id)
	@RequestMapping(value = "Event_show.my", 
			method = RequestMethod.GET)
	public String EventShowProc(HttpSession ses, 
			int id, Model model) {
		EventVO ev = 
			this.evSvc.selectOneEvent(id);
		if( ev != null ) {
			System.out.println("게시글 상세조회 성공 "
						+ ev);
			model.addAttribute("Event", ev);
			String atFilePath = ev.getFilePath();
			int fpsCount = -1;
			if( atFilePath != null && !atFilePath.isEmpty() ) {
				String fps[] = null;
				if( atFilePath.indexOf(
						IEventFileSVC.MULTI_SEP)
					 != -1 ) {
					fps = atFilePath.split(
							"\\"+IEventFileSVC.MULTI_SEP);
//					System.out.println("fps => " + fps);
//					System.out.println("fp0 => " + fps[0]);
//					System.out.println("fp1 => " + fps[1]);
//					System.out.println("fp2 => " + fps[2]);
					fpsCount = fps.length;					
				} else {
					fpsCount = 1;
					fps = new String[]{atFilePath};
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
			return "Event/ev_show";
		} else {			
			model.addAttribute("msg", 
				"게시글 상세조회 실패 - " + id);
			return "redirect:Event_list.my";
		}
	}	
	
//- 회원이 이벤트 게시글을 좋아요 할 수 있다
//	event_like.fdl (get, proc, dao, param?atId&mbId..) 
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
