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

import kr.spring.store.domain.StoreVO;
import kr.spring.store.service.StoreService;
import kr.spring.storereview.service.StoreReviewService;
import kr.spring.util.PagingUtil;

@Controller
public class StoreController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource
	private StoreService storeService;
	
	@ModelAttribute
	private StoreVO initCommand() {
		return new StoreVO();
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
	
	//이미지 처리
	@RequestMapping("/store/imageView.do")
	public ModelAndView viewImage(@RequestParam("s_num") int s_num) {
		
		StoreVO store = storeService.selectProduct(s_num);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("imageView");
		mav.addObject("imageFile",store.getS_photo());
		mav.addObject("filename",store.getFilename());
		
		return mav;
	}
	
	@RequestMapping("/store/storeDetail.do")
	public ModelAndView process() {
		
		int count = storeService.selectProductCount();
		
		List<StoreVO> list = null;
		
		list = storeService.selectProductList();
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("storeDetail");
		mav.addObject("count", count);
		mav.addObject("list", list);

		return mav;
	}
	
	@RequestMapping("/store/productDetail.do")
	public ModelAndView pdProcess(@RequestParam("s_num") int s_num) {
		
		StoreVO detail = storeService.selectProduct(s_num);
		
		if(log.isDebugEnabled()) {
			log.debug(detail);
		}
		
		return new ModelAndView("productDetail","detail",detail);
	}
	
}











