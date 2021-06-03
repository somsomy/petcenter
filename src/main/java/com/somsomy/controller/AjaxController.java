package com.somsomy.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.somsomy.service.MemberService;
import com.somsomy.service.ReplyService;
import com.somsomy.service.VolunteerService;
import com.somsomy.domain.FindPageBean;
import com.somsomy.domain.MemberBean;
import com.somsomy.domain.ReplyBean;


@RestController
public class AjaxController {
	@Inject
	private MemberService memberService;
	@Inject
	private ReplyService replyService;
	@Inject
	private VolunteerService volunteerService;
	
	@PostMapping("/member/idcheck")
	public ResponseEntity<String> idcheck(HttpServletRequest request) {
		ResponseEntity<String> entity = null;
		String result = "";
		String id = request.getParameter("id");
		int check = memberService.idCheck(id);
		MemberBean mb = memberService.getMember(id);
		
		try {
			if(mb != null) {
				result = "iddup";
			}else {
				result = check >= 2? "idok" : "wrong";
			}
			entity = new ResponseEntity<String>(result, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@PostMapping("/nickcheck")
	public ResponseEntity<String> nickcheck(MemberBean mb) {
		ResponseEntity<String> entity = null;
		String result = "";
		String nick = mb.getNick();
		int check = memberService.nickCheck(nick);
		MemberBean dupNick = memberService.findByNick(mb);
		
		try {
			if(dupNick != null) {
				result = "nickdup";
			}else {
				result = check >= 1? "nickok" : "wrong";
			}
			entity = new ResponseEntity<String>(result, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@PostMapping("/member/update")
	public void memberUpdate(MemberBean mb) {
		memberService.memberUpdate(mb);
	}
	
	@PostMapping("/volunteer/reply/update")
	public void updateReply(ReplyBean rb) {
		replyService.updateReply(rb);
	}
	
	@PostMapping("/volunteer/content/reply")
	public ResponseEntity<List<ReplyBean>> replyList(HttpServletRequest request) {
		ResponseEntity<List<ReplyBean>> entity = null;
		int num = Integer.parseInt(request.getParameter("boardNum"));
		
		FindPageBean pb = new FindPageBean();
		pb.setPageSize(15);
		
		if(request.getParameter("pageNum") == null) {
			pb.setPageNum("1");
		}else {
			pb.setPageNum(request.getParameter("pageNum"));
		}
		
		pb.setCount(volunteerService.getVolunteerReplyCount(num));
		pb.setNum(num);
		
		List<ReplyBean> rbList = replyService.getReplyList(pb);

		try {
			entity = new ResponseEntity<List<ReplyBean>>(rbList, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<ReplyBean>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@PostMapping("/volunteer/reply/write")
	public void replyWrite(HttpSession session, ReplyBean rb) {
		MemberBean mb = memberService.getMember((String) session.getAttribute("id"));
		rb.setName(mb.getNick());
		replyService.writeReply(rb);
	}
	
	@PostMapping("/volunteer/reply/delete")
	public void replyDelete(ReplyBean rb) {
		
		replyService.deleteReply(rb);

	}
	
	@PostMapping("/volunteer/reply/rewrite")
	public void replyReWrite(HttpSession session, ReplyBean rb) {
		MemberBean mb = memberService.getMember((String) session.getAttribute("id"));
		rb.setName(mb.getNick());
		replyService.rewriteReply(rb);
	}

}
