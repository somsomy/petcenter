package com.somsomy.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.somsomy.domain.CatsBean;
import com.somsomy.domain.FindPageBean;
import com.somsomy.domain.MemberBean;
import com.somsomy.domain.PageBean;
import com.somsomy.domain.SupporterBean;
import com.somsomy.domain.SupporterCatsBean;
import com.somsomy.service.CatsService;
import com.somsomy.service.MemberService;
import com.somsomy.service.SupportService;

@Controller
public class SupportController {
	
	@Inject
	private SupportService supportService;
	@Inject
	private CatsService catsService;
	@Inject
	private MemberService memberService;

	@GetMapping("/support")
	public String support(HttpServletRequest request, Model model) {
		
		PageBean pb = new PageBean();
		pb.setPageSize(10);
		
		if(request.getParameter("pageNum") == null) {
			pb.setPageNum("1");
		}else {
			pb.setPageNum(request.getParameter("pageNum"));
		}
		
		pb.setCount(catsService.getCatCount());
		
		List<CatsBean> cbList = catsService.getCatList(pb);
		
		model.addAttribute("pb", pb);
		model.addAttribute("cbList", cbList);
		
		return "support/supportList";
	}

	@GetMapping("/support/content")
	public String supportContent(HttpServletRequest request, HttpSession session, Model model) {
		
		int catId = Integer.parseInt(request.getParameter("catId"));
		
		CatsBean cb = catsService.findByCatId(catId);
		
		MemberBean mb = memberService.getMember((String) session.getAttribute("id"));
		
		model.addAttribute("cb", cb);
		model.addAttribute("mb", mb);
		
		return "support/support";
	}

	@PostMapping("/support/content")
	public String supportContent2(HttpServletRequest request, HttpSession session, SupporterBean sb, Model model) {
		
		int catId = Integer.parseInt(request.getParameter("catId"));
		
		CatsBean cb = catsService.findByCatId(catId);
		
		MemberBean mb = memberService.getMember((String) session.getAttribute("id"));
		
		model.addAttribute("cb", cb);
		model.addAttribute("mb", mb);
		model.addAttribute("sb", sb);
		
		return "support/support2";
	}

	@PostMapping("/support/complete")
	public String supportComplete(HttpSession session, SupporterBean sb) {
		sb.setUserid((String) session.getAttribute("id"));

		supportService.insertSupporter(sb);
		
		return "redirect:/support";
	}

	@GetMapping("/mycats")
	public String myCats(HttpServletRequest request, HttpSession session, Model model) {
		String id = (String) session.getAttribute("id");
		
		FindPageBean pb = new FindPageBean();
		pb.setPageSize(3);
		
		if(request.getParameter("pageNum") == null) {
			pb.setPageNum("1");
		} else {
			pb.setPageNum(request.getParameter("pageNum"));
		}
		
		pb.setCount(supportService.getMyCatsCount(id));
		pb.setId(id);
		
		List<SupporterCatsBean> scbList = supportService.getMyCatsList(pb);
		
		model.addAttribute("pb", pb);
		model.addAttribute("scbList", scbList);
		
		return "mycats/myCats";
	}

	@GetMapping("/mycats/content")
	public String myCatsContent(HttpServletRequest request, Model model) {
		int num = Integer.parseInt(request.getParameter("num"));
		
		SupporterCatsBean scb = supportService.getSupporter(num);
		
		model.addAttribute("scb", scb);
		
		return "mycats/myCatsContent";
	}

	@GetMapping("/mycats/update")
	public String myCatsUpdate(HttpServletRequest request, Model model) {
		int num = Integer.parseInt(request.getParameter("num"));
		
		SupporterCatsBean scb = supportService.getSupporter(num);
		
		model.addAttribute("scb", scb);
		
		return "mycats/myCatsUpdate";
	}

	@PostMapping("/mycats/update")
	public String myCatsUpdatePost(SupporterBean sb) {

		supportService.updateSupporter(sb);
		
		return "redirect:/mycats";
	}

	@GetMapping("/mycats/cancel")
	public String myCatsCancel(HttpServletRequest request) {
		int num = Integer.parseInt(request.getParameter("num"));

		supportService.deleteSupporter(num);
		
		return "redirect:/mycats";
	}
}
