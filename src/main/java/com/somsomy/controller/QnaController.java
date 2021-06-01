package com.somsomy.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.somsomy.domain.MemberBean;
import com.somsomy.domain.PageBean;
import com.somsomy.domain.QnaBean;
import com.somsomy.service.MemberService;
import com.somsomy.service.QnaService;

@Controller
public class QnaController {
	
	@Inject
	private QnaService qnaService;
	@Inject
	private MemberService memberService;
	
	@RequestMapping(value = "/qna", method = RequestMethod.GET)
	public String qna(HttpServletRequest request, Model model) {
		PageBean pb = new PageBean();
		pb.setPageSize(15);
		
		if(request.getParameter("pageNum") == null) {
			pb.setPageNum("1");
		}else {
			pb.setPageNum(request.getParameter("pageNum"));
		}
		
		pb.setCount(qnaService.getQnaCount());
		
		List<QnaBean> qbList = qnaService.getQnaList(pb);
		
		model.addAttribute("pb", pb);
		model.addAttribute("qbList", qbList);
		
		return "qna/qna";
	}
	
	@RequestMapping(value = "/qna/write", method = RequestMethod.GET)
	public String qnaWrite(HttpSession session, Model model) {
		String id = (String) session.getAttribute("id");
		
		if(id == null) {
			return "member/login";
		} else {
			MemberBean mb = memberService.getMember(id);
			model.addAttribute("nick", mb.getNick());		
			return "qna/qnaWrite";
		}
	}
	
	@RequestMapping(value = "/qna/write", method = RequestMethod.POST)
	public String qnaWritePost(QnaBean qb, Model model) {

		qnaService.writeQna(qb);
		
		return "redirect:/qna";
	}
	
	@RequestMapping(value = "/qna/content", method = RequestMethod.GET)
	public String qnaContent(HttpServletRequest request, HttpSession session, Model model) {
		
		int num = Integer.parseInt(request.getParameter("num"));
		String id = (String) session.getAttribute("id");
		
		qnaService.updateReadcount(num);	
		
		QnaBean qb = qnaService.getQna(num);
		model.addAttribute("qb", qb);
		
		if(id != null) {
			MemberBean mb = memberService.getMember(id);
			model.addAttribute("nick", mb.getNick());					
		}

		return "qna/qnaContent";
	}
	
	@RequestMapping(value = "/qna/update", method = RequestMethod.POST)
	public String qnaUpdatePost(QnaBean qb) {
		
		qnaService.updateQna(qb);
		
		return "redirect:/qna";
	}
	
	@RequestMapping(value = "/qna/update", method = RequestMethod.GET)
	public String qnaUpdate(HttpServletRequest request, Model model) {
		int num = Integer.parseInt(request.getParameter("num"));

		QnaBean qb = qnaService.getQna(num);
		model.addAttribute("qb", qb);
		
		return "qna/qnaUpdate";
	}
	
	@RequestMapping(value = "/qna/delete", method = RequestMethod.GET)
	public String qnaDelete(HttpServletRequest request) {
		int num = Integer.parseInt(request.getParameter("num"));

		qnaService.deleteQna(num);
		
		return "redirect:/qna";
	}
	
	@RequestMapping(value = "/qna/reply", method = RequestMethod.GET)
	public String qnaReply(HttpServletRequest request, Model model) {
		int num = Integer.parseInt(request.getParameter("num"));

		QnaBean qb = qnaService.getQna(num);
		model.addAttribute("qb", qb);
		return "qna/qnaReply";
	}
	
	@RequestMapping(value = "/qna/reply", method = RequestMethod.POST)
	public String qnaReplyPost(QnaBean qb) {
		
		qnaService.reWriteQna(qb);
		
		return "redirect:/qna";
	}
	
	
}
