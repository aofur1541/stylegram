package kr.spring.storepurchase.controller;

import java.sql.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.spring.store.domain.StoreVO;
import kr.spring.store.service.StoreService;
import kr.spring.storepurchase.domain.StorePurchaseVO;
import kr.spring.storepurchase.service.StorePurchaseService;
import kr.spring.storereview.domain.StoreReviewVO;
import kr.spring.util.EgovDoubleSubmitHelper;

@Controller
public class StorePurchaseController {

	private Logger log = Logger.getLogger(this.getClass());

	@Resource
	private StorePurchaseService storePurchaseService;
	
	@Resource
	private StoreService storeService;

	@ModelAttribute
	public StorePurchaseVO initCommand() {
		return new StorePurchaseVO();
	} 

	@RequestMapping("/store/insertPurchase.do")
	public String submit(@RequestParam("s_num") int s_num,@Valid StorePurchaseVO storePurchaseVO,BindingResult result,HttpServletRequest request,RedirectAttributes redirect)throws Exception {

		if(log.isDebugEnabled()) {
			log.debug("<<storePurchaseVO>>" + storePurchaseVO);
		}

		if(result.hasErrors()) {
			return "redirect:/store/storeDetail.do?s_num="+s_num;
		}
		
		int p_num = 0;
		
		if (EgovDoubleSubmitHelper.checkAndSaveToken()) {  
			storePurchaseService.insert(storePurchaseVO);
			
			p_num = storePurchaseVO.getP_num();
	    }
		
		storeService.updateSalesRate(s_num);
		
		return "redirect:/store/purchaseDetail.do?p_num="+(p_num+1);
	}

	@RequestMapping("/store/purchaseDetail.do")
	public ModelAndView pdPurchase(@RequestParam("p_num") int p_num,StorePurchaseVO sv,HttpSession session,HttpServletRequest request) {

		sv = storePurchaseService.selectPurchase(p_num);
		StoreVO store = new StoreVO();
		store = storeService.selectPurchaseProduct(p_num);
		
		
		if(log.isDebugEnabled()) {
			log.debug("<<구매한 물품>>" + sv);
		}
		if(log.isDebugEnabled()) {
			log.debug(sv);
		}

		ModelAndView mav = new ModelAndView();
		mav.setViewName("purchaseSuccess");
		mav.addObject("sv", sv);
		mav.addObject("store",store);

		return mav;
	}

	@RequestMapping("/store/purchaseList.do")
	public ModelAndView process(StoreReviewVO storeReviewVO,HttpSession session) {

		List<StorePurchaseVO> plist = null;
		List<StoreVO> slist = null;
		
		int m_num = 0;
		if(session.getAttribute("m_num") == null) {
			return new ModelAndView("redirect:/member/login.do");
		}else {
			m_num = (Integer)session.getAttribute("m_num");
		}
		
		Date today = storePurchaseService.selectToday();
		int count = storePurchaseService.selectPurchaseCount(m_num);
		plist = storePurchaseService.selectPurchaseList(m_num);
		slist = storeService.selectPurchaseList(m_num);
		
		if(log.isDebugEnabled()) {
			log.debug("구매내역 : " + plist);
		}
		if(log.isDebugEnabled()) {
			log.debug("구매내역 : " + slist);
		}

		ModelAndView mav = new ModelAndView();
		mav.setViewName("purchaseList");
		mav.addObject("count", count);
		mav.addObject("plist", plist);
		mav.addObject("slist", slist);
		mav.addObject("today", today);

		return mav;
	}

}
