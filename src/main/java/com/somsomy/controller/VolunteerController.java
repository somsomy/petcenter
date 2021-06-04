package com.somsomy.controller;

import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.somsomy.aws.S3Uploader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.somsomy.domain.FindPageBean;
import com.somsomy.domain.MemberBean;
import com.somsomy.domain.PageBean;
import com.somsomy.domain.VolunteerBean;
import com.somsomy.domain.VolunteerReplyBean;
import com.somsomy.service.MemberService;
import com.somsomy.service.VolunteerService;

@Controller
public class VolunteerController {
	@Inject
	private VolunteerService volunteerService;
	@Inject
	private MemberService memberService;
	@Inject
	private S3Uploader s3Uploader;

	@GetMapping("/volunteer")
	public String volunteer(PageBean pb, Model model) {
		
		pb.setPageSize(15);
		
		if(pb.getPageNum() == null) {
			pb.setPageNum("1");
		}
		
		pb.setCount(volunteerService.getVolunteerCount(pb.getSearch()));
		
		List<VolunteerBean> vbList = volunteerService.getVolunteerList(pb);
		
		model.addAttribute("pb", pb);
		model.addAttribute("vbList", vbList);
		
		return "volunteer/volunteer";
	}

	@GetMapping("/volunteer/write")
	public String volunteerWrite() {
		
		return "volunteer/volunteerWrite";
	}

	@PostMapping("/volunteer/write")
	public String volunteerWritePost(HttpServletRequest request, MultipartFile file) throws Exception {
		UUID uid = UUID.randomUUID();
		String saveName = null;
		
		VolunteerBean vb = new VolunteerBean();
		vb.setState(request.getParameter("state"));
		vb.setName(request.getParameter("name"));
		vb.setSubject(request.getParameter("subject"));
		vb.setContent(request.getParameter("content"));
		
		if(!file.getOriginalFilename().isEmpty()) {
			saveName = s3Uploader.upload(file, "upload");
			vb.setFile(saveName);
		}
		
		volunteerService.writeVolunteer(vb);
		
		return "redirect:/volunteer";
	}

	@GetMapping("/volunteer/content")
	public String volunteerContent(HttpServletRequest request, HttpSession session, Model model) {
		int num = Integer.parseInt(request.getParameter("num"));
		String id = (String) session.getAttribute("id");
		
		volunteerService.updateReadcount(num);
		
		FindPageBean pb = new FindPageBean();
		pb.setPageSize(15);
		
		if(request.getParameter("pageNum") == null) {
			pb.setPageNum("1");
		}else {
			pb.setPageNum(request.getParameter("pageNum"));
		}
		
		pb.setCount(volunteerService.getVolunteerReplyCount(num));
		pb.setNum(num);
		
		List<VolunteerReplyBean> vrbList = volunteerService.getVolunteerReplyList(pb);
		
		MemberBean mb = memberService.getMember(id);

		model.addAttribute("pb", pb);
		model.addAttribute("vrbList", vrbList);
		model.addAttribute("mb", mb);
		
		return "volunteer/volunteerContent";
	}

	@GetMapping("/volunteer/update")
	public String volunteerUpdate(HttpServletRequest request, Model model) {
		
		int num = Integer.parseInt(request.getParameter("num"));

		VolunteerBean vb = volunteerService.getVolunteer(num);
		
		model.addAttribute("vb", vb);
		
		return "volunteer/volunteerUpdate";
	}

	@PostMapping("/volunteer/update")
	public String volunteerUpdatePost(HttpServletRequest request, MultipartFile file) throws Exception{
		String saveName = null;
		
		if(!file.isEmpty()) {
			saveName = s3Uploader.upload(file, "upload");
		}else {
			saveName=request.getParameter("oldfile");
		}
		
		VolunteerBean vb = new VolunteerBean();
		vb.setNum(Integer.parseInt(request.getParameter("num")));
		vb.setState(request.getParameter("state"));
		vb.setSubject(request.getParameter("subject"));
		vb.setContent(request.getParameter("content"));
		vb.setFile(saveName);
		
		volunteerService.updateVolunteer(vb);
		
		return "redirect:/volunteer";
	}

	@GetMapping("/volunteer/delete")
	public String volunteerDelete(HttpServletRequest request) {
		int num = Integer.parseInt(request.getParameter("num"));

		volunteerService.deleteVolunteer(num);
		
		return "redirect:/volunteer";
	}
	

}
