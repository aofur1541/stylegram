package kr.spring.storebasket.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.member.domain.MemberVO;
import kr.spring.member.service.MemberService;
import kr.spring.store.domain.StoreVO;
import kr.spring.store.service.StoreService;
import kr.spring.storebasket.domain.StoreBasketVO;
import kr.spring.storebasket.service.StoreBasketService;
import kr.spring.storepurchase.domain.StorePurchaseVO;

@Controller
public class StoreBasketController {
	private Logger log = Logger.getLogger(this.getClass());
	
	
	@Resource
	private StoreBasketService basketService;
	
	@Resource
	private StoreService storeService;
	
	@Resource
	private MemberService memberService;
	
	//자바빈 초기화
	@ModelAttribute
	public StoreBasketVO initCommand() {
		return new StoreBasketVO();
	}
	
	@ModelAttribute
	public StorePurchaseVO initCommand2() {
		return new StorePurchaseVO();
	}
	
	//장바구니 상품 추가
	@RequestMapping("/store/basket.do")
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
		
		String goCheck = storeVO.getGoCheck();
		System.out.println("goCheck = " + goCheck);
		
		if(goCheck.equals("true")) {
			return "redirect:/basket/storeBasket.do";
		}else {
			return "redirect:/store/productDetail.do?s_num=" + storeVO.getS_num();
		}
	}
	
	//장바구니 이동
	@RequestMapping("/basket/storeBasket.do")
	public ModelAndView openBasket(StoreVO storeVO, HttpSession session) {
		
		int m_num = 0;
		
		if(session.getAttribute("m_num") == null) {
			return new ModelAndView("redirect:/member/login.do");
		}else {
			m_num = (Integer)session.getAttribute("m_num");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("m_num", m_num);
		
		List<StoreVO> basketList = basketService.selectBasketList(map);
		
		int count = basketService.seleceBasketCount(m_num);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("storeBasket");
		mav.addObject("basket",basketList);
		
		mav.addObject("count", count);
		
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
	
	//장바구니 물품 구매
	@RequestMapping("/basket/basketBuy.do")
	public ModelAndView basketPurchase(HttpSession session,
									   StoreVO storeVO,
									   MemberVO memberVO,
									   @RequestParam("pa_price") int pa_price,
									   @RequestParam("pa_ship") int pa_ship,
									   @RequestParam("total_price") int total_price) {
		
		int m_num = 0;
		
		if(session.getAttribute("m_num") == null) {
			return new ModelAndView("redirect:/member/login.do");
		}else {
			m_num = (Integer)session.getAttribute("m_num");
		}
		memberVO = memberService.selectMember(m_num);
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<StoreVO> basketPurchaseList = null;
		
		String[] p_num = storeVO.getP_nums().split(",");
		map.put("p_num", p_num);
		
		basketPurchaseList = basketService.selectBasketPurchaseList(map);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("basketPurchaseMain");
		mav.addObject("purchaseList", basketPurchaseList);
		mav.addObject("pa_price", pa_price);
		mav.addObject("pa_ship", pa_ship);
		mav.addObject("total_price", total_price);
		mav.addObject("member", memberVO);
		
		return mav;
	}
	
	//장바구니 물품 결제
	@RequestMapping("/basket/insertBasketPurchase.do")
	public String basketPurchaseSubmit(@RequestParam("p_nums") String p_nums, @Valid StorePurchaseVO storePurchaseVO, BindingResult result, HttpSession session) {
		if(log.isDebugEnabled()) {
			log.debug("<<storePurchaseVO>>" + storePurchaseVO);
		}
        if(session.getAttribute("m_num") != null) {
        	storePurchaseVO.setM_num((Integer)session.getAttribute("m_num"));
        }else {
        	return "redirect:/member/login.do";
        }
        
        if(result.hasErrors()) {
			return "redirect:/basket/storeBasket.do";
		}
        String[] p_num = p_nums.split(",");
        StoreVO store = new StoreVO();
        for(int i=0;i<p_num.length;i++) {
        	store = basketService.select(Integer.parseInt(p_num[i]));
        	storePurchaseVO.setA_num(store.getA_num());
        	storePurchaseVO.setS_num(store.getS_num());
        	basketService.insertPurchase(storePurchaseVO);
        	basketService.delete(Integer.parseInt(p_num[i]));
        }
        
        return "basketPurchaseSuccess";
	}
	
}
