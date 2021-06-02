package com.somsomy.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.somsomy.domain.MemberBean;
import com.somsomy.service.MemberService;

@Controller
public class MemberController {
	
	@Inject
	private MemberService memberService;

	@GetMapping("/login")
	public String login() {
		
		return "member/login";
	}

	@PostMapping("/login")
	public String loginPost(MemberBean mb, HttpSession session, Model model) {
		
		MemberBean loginMb = memberService.userCheck(mb);
		
		if(loginMb != null) {
			session.setAttribute("id", mb.getId());
			return "redirect:/main";
		}else {
			model.addAttribute("msg", "가입되지 않은 아이디거나 잘못된 비밀번호입니다.");
			return "member/msg";
		}
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/main";
	}

	@GetMapping("/join")
	public String join() {
		
		return "member/join";
	}

	@PostMapping("/join")
	public String joinPost(MemberBean mb) {
		memberService.join(mb);
		return "redirect:/login";
	}

	@GetMapping("/mypage")
	public String myPage(HttpSession session, Model model) {
		String id = (String) session.getAttribute("id");
		
		MemberBean mb = memberService.getMember(id);
		
		model.addAttribute("mb", mb);
		return "member/myPage";
	}
	

}
