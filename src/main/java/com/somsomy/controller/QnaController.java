package com.somsomy.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

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

  @GetMapping("/qna")
  public String qna(PageBean pb, Model model) {
    pb.setPageSize(15);

    if (pb.getPageNum() == null) {
      pb.setPageNum("1");
    }

    pb.setCount(qnaService.getQnaCount(pb.getSearch()));

    List<QnaBean> qbList = qnaService.getQnaList(pb);

    model.addAttribute("pb", pb);
    model.addAttribute("qbList", qbList);

    return "qna/qna";
  }

  @GetMapping("/qna/write")
  public String qnaWrite(HttpSession session, Model model) {
    String id = (String) session.getAttribute("id");

    if (id == null) {
      return "member/login";
    } else {
      MemberBean mb = memberService.getMember(id);
      model.addAttribute("nick", mb.getNick());
      return "qna/qnaWrite";
    }
  }

  @PostMapping("/qna/write")
  public String qnaWritePost(QnaBean qb, Model model) {

    qnaService.writeQna(qb);

    return "redirect:/qna";
  }

  @GetMapping("/qna/content")
  public String qnaContent(HttpServletRequest request, HttpSession session, Model model) {

    int num = Integer.parseInt(request.getParameter("num"));
    String id = (String) session.getAttribute("id");

    qnaService.updateReadcount(num);

    QnaBean qb = qnaService.getQna(num);
    model.addAttribute("qb", qb);

    if (id != null) {
      MemberBean mb = memberService.getMember(id);
      model.addAttribute("nick", mb.getNick());
    }

    return "qna/qnaContent";
  }

  @PostMapping("/qna/update")
  public String qnaUpdatePost(QnaBean qb) {

    qnaService.updateQna(qb);

    return "redirect:/qna";
  }

  @GetMapping("/qna/update")
  public String qnaUpdate(HttpServletRequest request, Model model) {
    int num = Integer.parseInt(request.getParameter("num"));

    QnaBean qb = qnaService.getQna(num);
    model.addAttribute("qb", qb);

    return "qna/qnaUpdate";
  }

  @GetMapping("/qna/delete")
  public String qnaDelete(HttpServletRequest request) {
    int num = Integer.parseInt(request.getParameter("num"));

    qnaService.deleteQna(num);

    return "redirect:/qna";
  }

  @GetMapping("/qna/reply")
  public String qnaReply(HttpServletRequest request, Model model) {
    int num = Integer.parseInt(request.getParameter("num"));

    QnaBean qb = qnaService.getQna(num);
    model.addAttribute("qb", qb);
    return "qna/qnaReply";
  }

  @PostMapping("/qna/reply")
  public String qnaReplyPost(QnaBean qb) {

    qnaService.reWriteQna(qb);

    return "redirect:/qna";
  }


}
