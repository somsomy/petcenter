package com.somsomy.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.somsomy.aws.S3Uploader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.somsomy.domain.CatsBean;
import com.somsomy.domain.NoticeBean;
import com.somsomy.domain.PageBean;
import com.somsomy.service.AdminService;
import com.somsomy.service.CatsService;

@Controller
public class AdminController {

  @Inject
  private AdminService adminService;
  @Inject
  private CatsService catsService;
  @Inject
  private S3Uploader s3Uploader;

  @GetMapping("/notice")
  public String notice(PageBean pb, Model model) {

    pb.setPageSize(10);

    if (pb.getPageNum() == null) {
      pb.setPageNum("1");
    }

    pb.setCount(adminService.getNoticeCount(pb.getSearch()));

    List<NoticeBean> nbList = adminService.getNoticeList(pb);

    model.addAttribute("pb", pb);
    model.addAttribute("nbList", nbList);

    return "petcenter/notice";
  }

  @GetMapping("/notice/write")
  public String noticeWrite() {

    return "petcenter/noticeWrite";
  }

  @PostMapping("/notice/write")
  public String noticeWritePost(NoticeBean nb) {

    adminService.writeNotice(nb);

    return "redirect:/notice";
  }

  @GetMapping("/notice/content")
  public String noticeContent(HttpServletRequest request, Model model) {

    int num = Integer.parseInt(request.getParameter("num"));

    adminService.updateReadcount(num);

    NoticeBean nb = adminService.getNotice(num);

    model.addAttribute("nb", nb);

    return "petcenter/noticeContent";
  }

  @GetMapping("/notice/update")
  public String noticeUpdate(HttpServletRequest request, HttpSession session, Model model) {
    int num = Integer.parseInt(request.getParameter("num"));
    String id = (String) session.getAttribute("id");

    if (id == null || !id.equals("admin")) {
      return "redirect:/";
    }


    NoticeBean nb = adminService.getNotice(num);
    model.addAttribute("nb", nb);
    return "petcenter/noticeUpdate";
  }

  @PostMapping("/notice/update")
  public String noticeUpdatePost(NoticeBean nb, HttpSession session) {
    String id = (String) session.getAttribute("id");

    if (id == null || !id.equals("admin")) {
      return "redirect:/";
    }

    adminService.updateNotice(nb);

    return "redirect:/notice";
  }

  @GetMapping("/notice/delete")
  public String noticeDelete(HttpServletRequest request, HttpSession session) {

    int num = Integer.parseInt(request.getParameter("num"));
    String id = (String) session.getAttribute("id");

    if (id == null || !id.equals("admin")) {
      return "redirect:/";
    }

    adminService.deleteNotice(num);
    return "redirect:/notice";
  }

  @GetMapping("/admin/cats")
  public String cats(PageBean pb, HttpSession session, Model model) {
    String id = (String) session.getAttribute("id");

    if (id == null || !id.equals("admin")) {
      return "redirect:/";
    }

    pb.setPageSize(9);

    if (pb.getPageNum() == null) {
      pb.setPageNum("1");
    } else {
      pb.setPageNum(pb.getPageNum());
    }

    pb.setCount(catsService.getCatCount());

    List<CatsBean> cbList = catsService.getCatList(pb);

    model.addAttribute("pb", pb);
    model.addAttribute("cbList", cbList);
    return "admin/cats";
  }

  @GetMapping("/admin/cats/register")
  public String catsRegister(HttpSession session) {
    String id = (String) session.getAttribute("id");

    if (id == null || !id.equals("admin")) {
      return "redirect:/";
    }

    return "admin/catRegister";
  }

  @PostMapping("/admin/cats/register")
  public String catsRegisterPost(CatsBean cb, HttpSession session, MultipartFile file) throws Exception {
    String id = (String) session.getAttribute("id");

    if (id == null || !id.equals("admin")) {
      return "redirect:/";
    }

    String catImg = s3Uploader.upload(file, "upload");

    cb.setFileRealName(catImg);

    catsService.registerCat(cb);

    return "redirect:/admin/cats";
  }

  @GetMapping("/admin/content")
  public String catsContent(HttpServletRequest request, HttpSession session, Model model) {
    String id = (String) session.getAttribute("id");

    if (id == null || !id.equals("admin")) {
      return "redirect:/";
    }

    int catId = Integer.parseInt(request.getParameter("catId"));
    CatsBean cb = catsService.findByCatId(catId);

    model.addAttribute("cb", cb);

    return "admin/catContent";
  }

  @GetMapping("/admin/cats/update")
  public String catsUpdate(HttpServletRequest request, HttpSession session, Model model) {
    String id = (String) session.getAttribute("id");
    if (id == null || !id.equals("admin")) {
      return "redirect:/";
    }
    int catId = Integer.parseInt(request.getParameter("catId"));
    CatsBean cb = catsService.findByCatId(catId);

    model.addAttribute("cb", cb);
    return "admin/catUpdate";
  }

  @PostMapping("/admin/cats/update")
  public String catsUpdatePost(CatsBean cb, HttpServletRequest request, HttpSession session, MultipartFile file) throws Exception {
    String id = (String) session.getAttribute("id");
    String saveName = null;

    if (id == null || !id.equals("admin")) {
      return "redirect:/";
    }

    if (file.isEmpty()) {
      saveName = request.getParameter("oldfile");
    } else {
      saveName = s3Uploader.upload(file, "upload");

    }

    cb.setFileRealName(saveName);

    catsService.updateCat(cb);

    return "redirect:/admin/cats";
  }

  @GetMapping("/admin/cats/delete")
  public String catsDelete(HttpServletRequest request, HttpSession session) {
    String id = (String) session.getAttribute("id");

    if (id == null || !id.equals("admin")) {
      return "redirect:/";
    }

    int catId = Integer.parseInt(request.getParameter("catId"));
    catsService.deleteCat(catId);

    return "redirect:/admin/cats";
  }
}
