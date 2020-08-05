package kr.spring.storebasket.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.storebasket.domain.StoreBasketVO;
import kr.spring.storebasket.service.StoreBasketService;

@Controller
public class StoreBasketController {
	private Logger log = Logger.getLogger(this.getClass());
	
	
	@Resource
	private StoreBasketService basketService;
	
	//자바빈 초기화
	@ModelAttribute
	public StoreBasketVO storeBasketVO() {
		return new StoreBasketVO();
	}
	
	//장바구니 추가
	@RequestMapping("/basket/basket.do")
	public String insert(@RequestParam("s_num") int s_num, HttpSession session) {
		
		StoreBasketVO basketVO = new StoreBasketVO();
		
		basketVO.setS_num(s_num);
		if(session.getAttribute("m_num") == null) {
			return "redirect:/member/login.do";
		}else if(session.getAttribute("m_num") != null) {
			basketVO.setM_num((Integer) session.getAttribute("m_num"));
		}
		if(log.isDebugEnabled()) {
			log.debug("<<basketVO>>" + basketVO);
		}
		
		basketService.insert(basketVO);
		
		
		return "redirect:/store/productDetail.do?s_num="+s_num;
	}
	

}
