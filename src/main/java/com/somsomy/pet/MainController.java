package com.somsomy.pet;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.somsomy.domain.CatsBean;
import com.somsomy.domain.FindPageBean;
import com.somsomy.service.CatsService;

@Controller
public class MainController {
	
	@Inject
	private CatsService catsService;

	@GetMapping("/")
	public String main(FindPageBean pb, Model model) {
		
		pb.setPageSize(5);
		
		if(pb.getPageNum() == null) {
			pb.setPageNum("1");
		}
		
		pb.setState("protected");
		pb.setCount(catsService.getStateCatCount(pb));

		List<CatsBean> cbList = catsService.getStateCatList(pb);

		model.addAttribute("pb", pb);
		model.addAttribute("cbList", cbList);

		return "main/main";
	}


}
