package com.somsomy.pet;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.somsomy.domain.CatsBean;
import com.somsomy.domain.FindPageBean;
import com.somsomy.service.CatsService;

@Controller
public class MainController {
	
	@Inject
	private CatsService catsService;
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(HttpServletRequest request, Model model) {
		
		FindPageBean pb = new FindPageBean();
		pb.setPageSize(5);
		
		if(request.getParameter("pageNum") == null) {
			pb.setPageNum("1");
		}else {
			pb.setPageNum(request.getParameter("pageNum"));
		}
		
		pb.setState("protected");
		pb.setCount(catsService.getStateCatCount(pb.getState()));

		List<CatsBean> cbList = catsService.getStateCatList(pb);
		
		model.addAttribute("pb", pb);
		model.addAttribute("cbList", cbList);

		return "main/main";
	}


}
