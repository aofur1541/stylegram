package kr.spring.storereview.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import kr.spring.store.service.StoreService;
import kr.spring.storereview.domain.StoreReviewVO;
import kr.spring.storereview.service.StoreReviewService;
import kr.spring.util.ReplyPager;

@Controller
public class StoreReviewController {
	
	//로그
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource
	private StoreReviewService storeReviewService;
	@Resource
	private StoreService storeService;
	
	//자바빈 초기화
	@ModelAttribute
	private StoreReviewVO initCommand() {
		return new StoreReviewVO();
	}
	
	@RequestMapping("/store/insertReview.do")
	public String submit(@Valid StoreReviewVO storeReviewVO,StoreVO storeVO,BindingResult result,HttpSession session)throws Exception {
		
		if(result.hasErrors()) {
			return "productDetail";
		}

		storeReviewVO.setM_num((Integer)session.getAttribute("m_num"));
		
		storeReviewService.insert(storeReviewVO);
		storeService.updateStarAvg(storeVO);
		
		return "redirect:/store/storeDetail.do";
	}
	
	@RequestMapping("/store/listReview.do")
	public ModelAndView process(@RequestParam("s_num") int s_num, StoreReviewVO storeReviewVO,@RequestParam(defaultValue="1") int curPage) {
		
		int count = storeReviewService.selectReviewCount(s_num);
		ReplyPager replyPager = new ReplyPager(count, curPage);
		int start = replyPager.getPageBegin();
		int end = replyPager.getPageEnd();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("s_num", s_num);
		map.put("start", start);
		map.put("end", end);
		
		List<StoreReviewVO> list = storeReviewService.selectReviewList(map);
		
		if(log.isDebugEnabled()) {
			log.debug("리뷰데이터 : " + list);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("productReview");
		mav.addObject("count", count);
		mav.addObject("list", list);

		return mav;
	}
	
	@RequestMapping("/store/updateReview.do")
	public String update(@RequestParam("sr_num") int sr_num,HttpServletRequest request) {
		
		StoreReviewVO reviewVO = storeReviewService.selectReview(sr_num);
		if(log.isDebugEnabled()) {
			log.debug("수정 전의 데이터 : "+reviewVO);
		}
		reviewVO.setSr_content(request.getParameter("updateText"));
		
		storeReviewService.updateReview(reviewVO);
		
		int s_num = reviewVO.getS_num();
		
		return "redirect:/store/productDetail.do?s_num="+s_num;
	}
	
	@RequestMapping("/store/deleteReview.do")
	public String delete(@RequestParam("sr_num")int sr_num) {
		
		StoreReviewVO reviewVO = storeReviewService.selectReview(sr_num);
		
		int s_num = reviewVO.getS_num();
		
		storeReviewService.deleteReview(sr_num);
		
		return "redirect:/store/productDetail.do?s_num="+s_num;
	}
	
}



























