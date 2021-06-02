package com.somsomy.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.inject.Named;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.somsomy.domain.AdoptBean;
import com.somsomy.domain.CatsBean;
import com.somsomy.domain.FindPageBean;
import com.somsomy.domain.MemberBean;
import com.somsomy.domain.PageBean;
import com.somsomy.domain.ReviewBean;
import com.somsomy.domain.VolunteerBean;
import com.somsomy.service.AdoptService;
import com.somsomy.service.CatsService;
import com.somsomy.service.MemberService;
import com.somsomy.service.ReviewService;

@Controller
public class BoardController {
	
	@Inject
	private AdoptService adoptService;
	@Inject
	private MemberService memberService;
	@Inject
	private CatsService catsService;
	@Inject
	private ReviewService reviewService;
	
	@Resource(name = "uploadPath")
	private String uploadPath;

	@GetMapping("/welcome")
	public String welcome() {
		
		return "petcenter/welcome";
	}
	
	@GetMapping("/map")
	public String map() {
		
		return "petcenter/map";
	}
	
	@GetMapping("/adopt/info")
	public String adoptInfo() {
		
		return "adopt/adoptInfo";
	}

	@GetMapping("/adopt")
	public String adopt(HttpServletRequest request, Model model) {
		
		PageBean pb = new PageBean();
		pb.setPageSize(10);
		
		if(request.getParameter("pageNum") == null) {
			pb.setPageNum("1");
		}else {
			pb.setPageNum(request.getParameter("pageNum"));
		}
		
		pb.setCount(adoptService.getMaxNum());
		
		List<AdoptBean> abList = adoptService.getBoardList(pb);
		
		model.addAttribute("pb", pb);
		model.addAttribute("abList", abList);

		return "adopt/adopt";
	}

	@GetMapping("/adopt/write")
	public String adoptWrite(HttpSession session, Model model) {
		MemberBean mb = memberService.getMember((String) session.getAttribute("id"));
		PageBean pb = new PageBean();
		pb.setPageNum("1");
		pb.setPageSize(catsService.getCatCount());

		List<CatsBean> cbList = catsService.getCatList(pb);
		
		model.addAttribute("mb", mb);
		model.addAttribute("cbList", cbList);
		
		return "adopt/adoptWrite";
	}

	@PostMapping("/adopt/write")
	public String adoptWritePost(AdoptBean ab) {
		
		adoptService.writeAdopt(ab);
		
		return "redirect:/adopt";
	}
	
	@GetMapping("/adopt/content")
	public String adoptContent(HttpServletRequest request, HttpSession session, Model model) {
		int num = Integer.parseInt(request.getParameter("num"));
		
		adoptService.updateReadcount(num);
		AdoptBean ab = adoptService.getAdopt(num);
		MemberBean mb = memberService.getMember((String) session.getAttribute("id"));
		
		model.addAttribute("ab", ab);
		model.addAttribute("mb", mb);

		return "adopt/adoptContent";
	}

	@GetMapping("/adopt/update")
	public String adoptUpdate(HttpServletRequest request, Model model) {
		int num = Integer.parseInt(request.getParameter("num"));
		AdoptBean ab = adoptService.getAdopt(num);
		PageBean pb = new PageBean();
		pb.setPageNum("1");
		pb.setPageSize(catsService.getCatCount());

		List<CatsBean> cbList = catsService.getCatList(pb);
		
		model.addAttribute("ab", ab);
		model.addAttribute("cbList", cbList);

		return "adopt/adoptUpdate";
	}

	@PostMapping("/adopt/update")
	public String adoptUpdatePost(AdoptBean ab) {
		
		adoptService.updateAdopt(ab);
		
		return "redirect:/adopt";
	}

	@GetMapping("/adopt/delete")
	public String adoptDelete(HttpServletRequest request) {
		int num = Integer.parseInt(request.getParameter("num"));

		adoptService.deleteAdopt(num);
		
		return "redirect:/adopt";
	}
	
	@GetMapping("/adopt/review")
	public String adoptReview(HttpServletRequest request, Model model) {
		
		PageBean pb = new PageBean();
		pb.setPageSize(10);
		
		if(request.getParameter("pageNum") == null) {
			pb.setPageNum("1");
		}else {
			pb.setPageNum(request.getParameter("pageNum"));
		}
		
		pb.setCount(reviewService.getReviewMaxNum());
		
		List<ReviewBean> rbList = reviewService.getReviewList(pb);
		
		model.addAttribute("pb", pb);
		model.addAttribute("rbList", rbList);
		
		return "adopt/review";
	}

	@GetMapping("/adopt/review/write")
	public String adoptReviewWrite(HttpSession session, Model model) {
		
		MemberBean mb = memberService.getMember((String) session.getAttribute("id"));
		
		model.addAttribute("mb", mb);
		return "adopt/reviewWrite";
	}

	@PostMapping("/adopt/review/write")
	public String adoptReviewWritePost(HttpServletRequest request, MultipartFile file) throws Exception{
		UUID uid = UUID.randomUUID();
		String saveName = null;
		
		ReviewBean rb = new ReviewBean();
		rb.setName(request.getParameter("name"));
		rb.setSubject(request.getParameter("subject"));
		rb.setContent(request.getParameter("content"));
		
		if(!file.getOriginalFilename().isEmpty()) {
			saveName = uid.toString() + "_" + file.getOriginalFilename();
			File target = new File(uploadPath,saveName);
			FileCopyUtils.copy(file.getBytes(), target);
			rb.setFileRealName(saveName);
		}
		
		reviewService.writeReview(rb);
		
		return "redirect:/adopt/review";
	}

	@GetMapping("/adopt/review/content")
	public String adoptReviewContent(HttpServletRequest request, HttpSession session, Model model) {
		int num = Integer.parseInt(request.getParameter("num"));
		
		ReviewBean rb = reviewService.getReview(num);
		MemberBean mb = memberService.getMember((String) session.getAttribute("id"));
		
		model.addAttribute("mb", mb);
		model.addAttribute("rb", rb);
		
		return "adopt/reviewContent";
	}

	@GetMapping("/adopt/review/update")
	public String adoptReviewUpdate(HttpServletRequest request, HttpSession session, Model model) {
		int num = Integer.parseInt(request.getParameter("num"));
		
		ReviewBean rb = reviewService.getReview(num);
		
		model.addAttribute("rb", rb);
		return "adopt/reviewUpdate";
	}

	@PostMapping("/adopt/review/update")
	public String adoptReviewUpdatePost(HttpServletRequest request, MultipartFile file) throws Exception{
		String saveName = null;
		
		if(file.isEmpty()) {
			saveName=request.getParameter("oldfile");
		}else {
			UUID uid=UUID.randomUUID();
			saveName=uid.toString()+"_"+file.getOriginalFilename();
			
			File target=new File( uploadPath,saveName);
			FileCopyUtils.copy(file.getBytes(), target);
		}
		
		ReviewBean rb = new ReviewBean();
		rb.setNum(Integer.parseInt(request.getParameter("num")));
		rb.setSubject(request.getParameter("subject"));
		rb.setContent(request.getParameter("content"));
		rb.setFileRealName(saveName);
		
		reviewService.updateReview(rb);
		
		return "redirect:/adopt/review";
	}

	@GetMapping("/adopt/review/delete")
	public String adoptReviewDelete(HttpServletRequest request) {
		int num = Integer.parseInt(request.getParameter("num"));

		reviewService.deleteReview(num);
		
		return "redirect:/adopt/review";
	}

	@GetMapping("/cats")
	public String protectedCats(HttpServletRequest request, Model model) {
		
		String state = request.getParameter("state");
		
		FindPageBean pb = new FindPageBean();
		pb.setPageSize(9);
		
		if(request.getParameter("pageNum") == null) {
			pb.setPageNum("1");
		}else {
			pb.setPageNum(request.getParameter("pageNum"));
		}
		
		pb.setCount(catsService.getStateCatCount(state));
		pb.setState(state);
		
		List<CatsBean> cbList = catsService.getStateCatList(pb);
		
		model.addAttribute("pb", pb);
		model.addAttribute("cbList", cbList);
		
		return "adopt/cats";
	}

	@GetMapping("/cats/content")
	public String catsContent(HttpServletRequest request, HttpSession session, Model model) {
		int catId = Integer.parseInt(request.getParameter("catId"));
		
		catsService.updateReadcount(catId);
		CatsBean cb = catsService.findByCatId(catId);
		
		model.addAttribute("cb", cb);
		
		return "adopt/catsContent";
	}
	
}
