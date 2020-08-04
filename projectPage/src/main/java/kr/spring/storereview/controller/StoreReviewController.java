package kr.spring.storereview.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.store.domain.StoreVO;
import kr.spring.storereview.domain.StoreReviewVO;
import kr.spring.storereview.service.StoreReviewService;

@Controller
public class StoreReviewController {
	
	//로그
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource
	private StoreReviewService storeReviewService;
	
	//자바빈 초기화
	@ModelAttribute
	private StoreReviewVO initCommand() {
		return new StoreReviewVO();
	}
	
	@RequestMapping("/store/insertReview.do")
	public String submit(@Valid StoreReviewVO storeReviewVO,BindingResult result,HttpSession session)throws Exception {
		
		if(result.hasErrors()) {
			return "productDetail";
		}
		
		storeReviewVO.setM_num((Integer)session.getAttribute("m_num"));

		storeReviewService.insert(storeReviewVO);		
		return "redirect:/store/productDetail.do";
	}
}



























