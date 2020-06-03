package com.fdl.foodlee.controller;



import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fdl.foodlee.model.vo.EventAnswerVO;
import com.fdl.foodlee.model.vo.MemberVO;
import com.fdl.foodlee.service.inf.IEventAnswerSVC;
import com.fdl.foodlee.service.inf.IMemberSVC;

@Controller
@RequestMapping("/answer")
public class EventAnswerController {
	@Autowired
	private IEventAnswerSVC evAsSvc;
	@Autowired
	private IMemberSVC mbSvc;
	
// - 회원이 대상 게시글에 대해 답글을  추가할 수 있다.
//	answer_new_form.fdl
//	answer/new_form.fdl
//	@RequestMapping(value = "/answer_add.fdl", method = RequestMethod.POST)
//	public String answerNewForm(HttpSession ses, 
//			@RequestParam(value="evId") int evId,
//			@RequestParam(value="id") int mbId,
//			Model model) {
//		int sesMbId = (int) ses.getAttribute("id");
//		if(sesMbId == mbId) {
//			model.addAttribute("evId", evId);
//			MemberVO mb = mbSvc.selectOneMember(mbId);
//			model.addAttribute("member", mb);
////			return "answer/as_new_form";
//			return "add.fdl";
//		} else {
//			System.out.println("댓글 추가 : 회원 id 불일치!");
//			return "redirect:event_show.fdl?id="+evId;
//		}
//	}

//	answer_add.fdl
	@RequestMapping(value="/add.fdl", method = RequestMethod.POST)
	public String answerAddProc(
			@ModelAttribute(value = "as") EventAnswerVO evAs,
			HttpSession ses, Model model
			) {
		System.out.println("command as: " + evAs);
		int ekey = evAsSvc.answerAdd(evAs);
		if(ekey > 0) {
			System.out.println("댓글 등록 성공!");
			
			EventAnswerVO as = evAsSvc.answerSelectOne(ekey);
			System.out.println("as="+as);
			model.addAttribute("as", as);
			return "eventAnswer/as_one";
			//return "redirect:/event_show.fdl?id="+evAs.getEventId();
		} else { // 0
			System.out.println("댓글 등록 실패!");
			MemberVO mb = mbSvc.selectOneMember(evAs.getMemberId());
			model.addAttribute("member", mb);
			return "answer/as_new_form";
		}
	}
	
//	- 댓글 리스트가 게시글 상세보기에 연동 표시될 수 있다.
//	answer_list.fdl
	@RequestMapping(value = "/list.fdl", method = RequestMethod.GET)
	public String answerListProc(
			@RequestParam(value = "evId") int evId, Model model
			) {
		List<EventAnswerVO> asList = evAsSvc.answerListForEvent(evId);
		if(asList != null) {
			model.addAttribute("evId", evId);
			model.addAttribute("asSize", asList.size());
			model.addAttribute("answers", asList);
			return "eventAnswer/as_list";
		} else {
			return "redirect:/event_show_fdl?id="+evId;
		}
	}
	
//	- 회원이 댓글을 갱신할 수 있다.
//	answer_edit_form.fdl
	@RequestMapping(value = "/edit_form.fdl", method = RequestMethod.GET)
	public String answerEditForm(HttpSession ses, @RequestParam("asId") int asId,
			@RequestParam("mbId") int mbId,
			@RequestParam("evId") int evId,
			Model model,
			RedirectAttributes rdattr
			) {
		int sesMbId = (int)ses.getAttribute("id");
		if(sesMbId == mbId) {
			EventAnswerVO evAs = evAsSvc.answerSelectOne(asId);
			if(evAs == null) {
				rdattr.addFlashAttribute("msg", "as 편집 폼 준비 실패 : as 없음");
				return "redirect:/event_show.fdl?id="+evId;
			} else {
				model.addAttribute("as", evAs);
				MemberVO mb = mbSvc.selectOneMember(mbId);
				model.addAttribute("member", mb);
				return "answer/as_edit_form";
			}
		} else {
			rdattr.addFlashAttribute("msg", "as 편집 폼 준비 실패: as 작성자 아님");
			return "redirect:/event_show.fdl?id="+evId;
		}
	}

//	answer_update.fdl
	@RequestMapping(value = "/update.fdl", method = RequestMethod.POST)
	public String answerUpdate(HttpSession ses,
			@ModelAttribute("as") EventAnswerVO evAs,
			RedirectAttributes rdattr,
			Model model
			) {
		int sesMbId = (int)ses.getAttribute("id");
		if(sesMbId == evAs.getMemberId()) {
			if(evAsSvc.answerUpdate(evAs)) {
				rdattr.addFlashAttribute("msg", "댓글 갱신 성공!!");
				return "redirect:/event_show.fdl?id="+evAs.getEventId();
			} else {
				model.addAttribute("msg", "댓글 갱싱 실패: DB sql 실패");
				MemberVO mb = mbSvc.selectOneMember(evAs.getMemberId());
				model.addAttribute("member", mb);
				return "answer/as_edit_form";
			}
		} else {
			rdattr.addFlashAttribute("msg", "댓글 갱신 실패: 회원 불일치!");
			return "redirect:/event_show.fdl?id="+evAs.getEventId();
		}
	}
	
}
