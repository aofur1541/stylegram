package kr.spring.flea.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.flea.domain.FleaVO;
import kr.spring.flea.service.FleaService;


@Controller
public class FleaController {

	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource
	private FleaService fleaService;
	
	//자바빈(VO) 초기화
	@ModelAttribute
	public FleaVO initCommand() {
		return new FleaVO();
	}

	//목록
	@RequestMapping("/flea/fleaList.do")
	public ModelAndView fleaList(@RequestParam(value="filter",defaultValue="") String filter) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("filter", filter);
		
		List<FleaVO> list = null;
		list = fleaService.selectList(map);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("fleaList");
		mav.addObject("list", list);
		mav.addObject("filter", filter);
		
		return mav;
	}

	//글쓰기
	@RequestMapping(value="/flea/fleaWrite.do",method=RequestMethod.GET)
	public String write() {
		return "fleaWrite";
	}
	
	@RequestMapping(value="/flea/fleaWrite.do",method=RequestMethod.POST)
	public String writeSubmit(@Valid FleaVO fleaVO, BindingResult result, HttpSession session, @RequestParam(value="fb_topcheck",required=false) String fb_topcheck, @RequestParam(value="fb_bottomcheck",required=false) String fb_bottomcheck, @RequestParam(value="fb_hatcheck",required=false) String fb_hatcheck, @RequestParam(value="fb_shoescheck",required=false) String fb_shoescheck) {
		if(log.isDebugEnabled()) {
			log.debug("<<FleaVO>> : " + fleaVO);
		}
		
		if(result.hasErrors()) {
			System.out.println(result);
			return "fleaWrite";
		}
		
		fleaVO.setFb_usernum((Integer)session.getAttribute("m_num"));
		
		if(fb_topcheck != null) {
			fleaVO.setFb_topchecknum(1);
		}else {
			fleaVO.setFb_topchecknum(0);
		}
		if(fb_bottomcheck != null) {
			fleaVO.setFb_bottomchecknum(1);
		}else {
			fleaVO.setFb_bottomchecknum(0);
		}
		if(fb_hatcheck != null) {
			fleaVO.setFb_hatchecknum(1);
		}else {
			fleaVO.setFb_hatchecknum(0);
		}
		if(fb_shoescheck != null){
			fleaVO.setFb_shoeschecknum(1);
		}else {
			fleaVO.setFb_shoeschecknum(0);
		}
		
		fleaService.insert(fleaVO);
		
		System.out.println(fleaVO);
		
		return "redirect:/flea/fleaList.do";
	}
	
	//글 상세
	@RequestMapping(value="/flea/fleaDetail.do")
	public ModelAndView detail(@RequestParam("fb_num") int fb_num) {
		if(log.isDebugEnabled()) {
			log.debug("<<fb_num>> : " + fb_num);
		}
		
		FleaVO flea = fleaService.selectFlea(fb_num);
		
		System.out.println(flea);
		
		return new ModelAndView("fleaDetail", "flea", flea);
	}

	//이미지 처리
	@RequestMapping("flea/imageView.do")
	public ModelAndView viewImage(@RequestParam("fb_num") int fb_num) {
		
		FleaVO flea = fleaService.selectFlea(fb_num);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("imageView");
		mav.addObject("imageFile", flea.getFb_photo());
		mav.addObject("filename", flea.getFb_filename());
		
		return mav;
	}
	
	//글 수정
	@RequestMapping(value="/flea/fleaUpdate.do",method=RequestMethod.GET)
	public String update(@RequestParam("fb_num") int fb_num, Model model) {
		
		FleaVO fleaVO = fleaService.selectFlea(fb_num);
		
		model.addAttribute("fleaVO", fleaVO);
		
		return "fleaUpdate";
	}
	
	@RequestMapping(value="/flea/fleaUpdate.do",method=RequestMethod.POST)
	public String updateSubmit(@Valid FleaVO fleaVO, BindingResult result) {
		
		if(log.isDebugEnabled()) {
			log.debug("<<FleaVO>> : " + fleaVO);
		}
		
		if(result.hasErrors()) {
			return "fleaUpdate";
		}
		
		fleaService.update(fleaVO);
		
		return "redirect:/flea/fleaList.do";
	}
	
	@RequestMapping("/flea/fleaDelete.do")
	public String delete(@RequestParam("fb_num") int fb_num) {
		
		if(log.isDebugEnabled()) {
			log.debug("<<fb_num>> : " + fb_num);
		}
		
		fleaService.deleteinfo(fb_num);
		fleaService.delete(fb_num);
		
		return "redirect:/flea/fleaList.do";
	}
	
}
