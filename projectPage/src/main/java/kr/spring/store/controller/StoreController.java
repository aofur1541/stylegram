package kr.spring.store.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.member.domain.MemberVO;
import kr.spring.member.service.MemberService;
import kr.spring.store.domain.StoreVO;
import kr.spring.store.service.StoreService;
import kr.spring.storepurchase.domain.StorePurchaseVO;
import kr.spring.storepurchase.service.StorePurchaseService;
import kr.spring.storereview.domain.StoreReviewVO;
import kr.spring.storereview.service.StoreReviewService;
import kr.spring.util.PagingUtil;

@Controller
public class StoreController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource
	private StoreService storeService;
	
	@Resource
	private StoreReviewService storeReviewService;
	
	@Resource
	private MemberService memberService;
	
	@Resource
	private StorePurchaseService storePurchaseService;
	
	@ModelAttribute
	private StoreVO initCommand() {
		return new StoreVO();
	}
	
	@ModelAttribute
	private StorePurchaseVO initCommand2() {
		return new StorePurchaseVO();
	}
	
	@RequestMapping(value="/store/insertProduct.do",method=RequestMethod.GET)
	public String form() {
		return "insertStore";
	}
		
	@RequestMapping(value="/store/insertProduct.do",method=RequestMethod.POST)
	public String submit(@Valid StoreVO storeVO,BindingResult result,MultipartHttpServletRequest request)throws Exception {
		if(result.hasErrors()) {
			return "insertStore";
		}
		storeService.insert(storeVO);		
		return "redirect:/main/main.do";
	}
	
	//------------------이미지 처리--------------------------//
	@RequestMapping("/store/imageView.do")
	public ModelAndView viewImage(@RequestParam("s_num") int s_num) {
		
		StoreVO store = storeService.selectProduct(s_num);
		
		if(log.isDebugEnabled()) {
			log.debug(store);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("imageView");
		mav.addObject("imageFile",store.getS_photo());
		mav.addObject("filename",store.getFilename());
		
		return mav;
	}
	
	@RequestMapping("/store/imageView2.do")
	public ModelAndView viewImage2(@RequestParam("s_num") int s_num) {
		
		StoreVO store = storeService.selectProduct(s_num);
		
		if(log.isDebugEnabled()) {
			log.debug("상품상세설명 이미지 1 : " + store);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("imageView");
		mav.addObject("imageFile",store.getDs_photo());
		mav.addObject("filename",store.getDfilename());
		
		return mav;
	}
	
	@RequestMapping("/store/imageView3.do")
	public ModelAndView viewImage3(@RequestParam("s_num") int s_num) {
		
		StoreVO store = storeService.selectProduct(s_num);
		
		if(log.isDebugEnabled()) {
			log.debug("상품상세설명 이미지 2 : " + store);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("imageView");
		mav.addObject("imageFile",store.getDs_photo2());
		mav.addObject("filename",store.getDfilename2());
		
		return mav;
	}
	
	@RequestMapping("/store/imageView4.do")
	public ModelAndView viewImage4(@RequestParam("s_num") int s_num) {
		
		StoreVO store = storeService.selectProduct(s_num);
		
		if(log.isDebugEnabled()) {
			log.debug("상품상세설명 이미지 3 : " + store);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("imageView");
		mav.addObject("imageFile",store.getDs_photo3());
		mav.addObject("filename",store.getDfilename3());
		
		return mav;
	}
	//------------------이미지 처리--------------------------//
	
	@RequestMapping("/store/storeDetail.do")
	public ModelAndView process(StoreReviewVO storeReviewVO) {
		
		int count = storeService.selectProductCount();
		
		List<StoreVO> list = null;
		
		list = storeService.selectProductList();
		
		if(log.isDebugEnabled()) {
			log.debug("스토어메인 넘어가는 데이터 : " + list);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("storeDetail");
		mav.addObject("count", count);
		mav.addObject("list", list);

		return mav;
	}
	
	@RequestMapping("/store/productDetail.do")
	public ModelAndView pdProcess(@RequestParam("s_num") int s_num,HttpSession session,HttpServletRequest request,StoreReviewVO storeReviewVO) {
		
		StoreVO detail = storeService.selectProduct(s_num);
		StoreReviewVO review = new StoreReviewVO();
		
		int m_num;
		if(session.getAttribute("m_num") == null) {
			m_num = 0;
		}else {
			m_num = (Integer)session.getAttribute("m_num");
		}
		
		HashMap<String,Integer> purchaseMCount = new HashMap<String,Integer>();
		purchaseMCount.put("s_num", s_num);
		purchaseMCount.put("m_num", m_num);
		
		int count = storePurchaseService.selectPurchaseMCount(purchaseMCount);
		
		if(log.isDebugEnabled()) {
			log.debug(detail);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("productDetail");
		mav.addObject("detail", detail);
		mav.addObject("review",review);
		mav.addObject("count",count);
		
		return mav;
	}
	
	@RequestMapping("/store/productBuy.do")
	public ModelAndView pdPurchase(@RequestParam("s_num") int s_num,@RequestParam("a_num") int a_num,
								   HttpSession session,StoreVO storeVO,MemberVO memberVO) {
		
		storeVO = storeService.selectProduct(s_num);
		storeVO.setA_num(a_num);
		
		int m_num = 0;
		if(session.getAttribute("m_num") == null) {
			return new ModelAndView("redirect:/member/login.do");
		}else {
			m_num = (Integer)session.getAttribute("m_num");
		}
		memberVO = memberService.selectMember(m_num);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("purchaseMain");
		mav.addObject("store", storeVO);
		mav.addObject("member", memberVO);
		
		return mav;
	}

}












