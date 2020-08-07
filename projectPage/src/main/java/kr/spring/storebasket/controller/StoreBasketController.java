package kr.spring.storebasket.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.member.domain.MemberVO;
import kr.spring.store.domain.StoreVO;
import kr.spring.store.service.StoreService;
import kr.spring.storebasket.domain.StoreBasketVO;
import kr.spring.storebasket.service.StoreBasketService;

@Controller
public class StoreBasketController {
	private Logger log = Logger.getLogger(this.getClass());
	
	
	@Resource
	private StoreBasketService basketService;
	
	@Resource
	private StoreService storeService;
	
	//자바빈 초기화
	@ModelAttribute
	public StoreBasketVO storeBasketVO() {
		return new StoreBasketVO();
	}
	
	//장바구니 상품 추가
	@RequestMapping("/basket/basket.do")
	public String insert(StoreVO storeVO, HttpSession session) {
		
		if(log.isDebugEnabled()) {
			log.debug("<<basketVO>>" + storeVO);
		}
        if(session.getAttribute("m_num") != null) {
        	storeVO.setM_num((Integer)session.getAttribute("m_num"));
        }else {
        	return "redirect:/member/login.do";
        }
		basketService.insert(storeVO);
		
		return "redirect:/store/productDetail.do?s_num="+storeVO.getS_num();
	}
	
	//장바구니 이동
	@RequestMapping("/basket/storeBasket.do")
	public ModelAndView openBasket(HttpSession session) {
		
		int m_num = 0;
		
		if(session.getAttribute("m_num") == null) {
			return new ModelAndView("redirect:/member/login.do");
		}else {
			m_num = (Integer)session.getAttribute("m_num");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("m_num", m_num);
		
		List<StoreVO> basketList = basketService.selectBasketList(map);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("storeBasket");
		mav.addObject("basket",basketList);
		
		return mav;
	}
	
	//장바구니 상품 사진
	@RequestMapping("/basket/imageView.do")
	public ModelAndView viewImage(@RequestParam("s_num") int num, HttpSession session) {
		
		int m_num = (Integer)session.getAttribute("m_num");
		
		StoreVO store = storeService.selectProduct(num);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("imageView");
		mav.addObject("imageFile", store.getS_photo());
		mav.addObject("filename", store.getFilename());
		
		return mav;
	}
	
	//장바구니 상품 삭제
	@RequestMapping("/basket/deleteBasket.do")
	public String deleteBasket(@RequestParam("p_num") int p_num) {
		
		if(log.isDebugEnabled()) {
			log.debug("<<p_num>> : " + p_num);
		}
		
		basketService.delete(p_num);
		
		return "redirect:/basket/storeBasket.do";
	}
	
}
