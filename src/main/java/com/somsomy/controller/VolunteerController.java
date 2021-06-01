package com.somsomy.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@RequestMapping(value = "/volunteer", method = RequestMethod.GET)
	public String volunteer(HttpServletRequest request, Model model) {
		
		PageBean pb = new PageBean();
		pb.setPageSize(15);
		
		if(request.getParameter("pageNum") == null) {
			pb.setPageNum("1");
		}else {
			pb.setPageNum(request.getParameter("pageNum"));
		}
		
		pb.setCount(volunteerService.getVolunteerCount());
		
		List<VolunteerBean> vbList = volunteerService.getVolunteerList(pb);
		
		model.addAttribute("pb", pb);
		model.addAttribute("vbList", vbList);
		
		return "volunteer/volunteer";
	}
	
	@RequestMapping(value = "/volunteer/write", method = RequestMethod.GET)
	public String volunteerWrite() {
		
		return "volunteer/volunteerWrite";
	}
	
	@RequestMapping(value = "/volunteer/write", method = RequestMethod.POST)
	public String volunteerWritePost(HttpServletRequest request, MultipartFile file) throws Exception {
		UUID uid = UUID.randomUUID();
		String saveName = null;
		
		VolunteerBean vb = new VolunteerBean();
		vb.setState(request.getParameter("state"));
		vb.setName(request.getParameter("name"));
		vb.setSubject(request.getParameter("subject"));
		vb.setContent(request.getParameter("content"));
		
		if(!file.getOriginalFilename().isEmpty()) {
			saveName = uid.toString() + "_" + file.getOriginalFilename();
			File target = new File(uploadPath,saveName);
			FileCopyUtils.copy(file.getBytes(), target);
			vb.setFile(saveName);
		}
		
		volunteerService.writeVolunteer(vb);
		
		return "redirect:/volunteer";
	}
	
	@RequestMapping(value = "/volunteer/content", method = RequestMethod.GET)
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
	
	@RequestMapping(value = "/volunteer/update", method = RequestMethod.GET)
	public String volunteerUpdate(HttpServletRequest request, Model model) {
		
		int num = Integer.parseInt(request.getParameter("num"));

		VolunteerBean vb = volunteerService.getVolunteer(num);
		
		model.addAttribute("vb", vb);
		
		return "volunteer/volunteerUpdate";
	}
	
	@RequestMapping(value = "/volunteer/update", method = RequestMethod.POST)
	public String volunteerUpdatePost(HttpServletRequest request, MultipartFile file) throws Exception{
		String saveName = null;
		
		if(!file.isEmpty()) {
			UUID uid=UUID.randomUUID();
			saveName=uid.toString()+"_"+file.getOriginalFilename();
			
			File target=new File( uploadPath,saveName);
			FileCopyUtils.copy(file.getBytes(), target);			
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
	
	@RequestMapping(value = "/volunteer/delete", method = RequestMethod.GET)
	public String volunteerDelete(HttpServletRequest request) {
		int num = Integer.parseInt(request.getParameter("num"));
		String file = uploadPath + request.getParameter("file");
		
		File f = new File(file);
		
		if(f.exists()) {
			f.delete();
		}

		volunteerService.deleteVolunteer(num);
		
		return "redirect:/volunteer";
	}
	

}
