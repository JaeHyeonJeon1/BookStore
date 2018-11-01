// 2018.10.30
package com.ksmart.individual.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ksmart.individual.memberDto.MemberVo;
import com.ksmart.individual.memberService.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService; 
	
	// 연결
	@RequestMapping(value= {"/", "/individual"}, method = RequestMethod.GET)
	public String HomPage() {
		System.out.println("memberController-HomPage");
		
		return "home";
	}
	
	// 로그인화면
	@RequestMapping(value="/member/login", method = RequestMethod.GET)
	public String loginForm() {
		System.out.println("memberController-loginForm");
		
		return "member/login";
	}
	
	// 로그인
	@RequestMapping(value="/member/loginCheck", method = RequestMethod.POST)
	public ModelAndView loginCheck(@ModelAttribute MemberVo memberVo, HttpSession session) {
		System.out.println("memberController-loginCheck");
		
		System.out.println("id : " +memberVo.getMemberId() +" & password : " +memberVo.getMemberPassword());
		
		boolean result = memberService.loginCheck(memberVo, session);
		
		ModelAndView modelAndView = new ModelAndView();
		
		// 로그인 성공
		if(result == true) {
			System.out.println("MemberController-result(true)");
			
			modelAndView.setViewName("home");
			modelAndView.addObject("modelAndView", "success");
		
		// 로그인 실패
		} else {
			System.out.println("MemberController-result(false)");
			
			modelAndView.setViewName("member/login");
			modelAndView.addObject("modelAndView", "failure");
			
		}
		
		return modelAndView;
	}
	
	// 로그아웃
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logout(HttpSession session, RedirectAttributes redirect) {
		System.out.println("memberController-logout");
		
		session.invalidate();
		
		redirect.addFlashAttribute("logout", "로그아웃");
		
		return "redirect:/individual";
	}
	
	// 회원가입페이지
	@RequestMapping(value="/member/signUp", method = RequestMethod.GET)
	public ModelAndView signUp() {
		System.out.println("memberController-signUp");
		
		ModelAndView mv = new ModelAndView("member/signUp");
		mv.addObject("memberVo", new MemberVo());
		
		return mv;
	}
	
	// 아이디 존재 여부
	@RequestMapping(value="/member/memberIdCheck", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> memberIdCheck(@RequestParam String memberId) {
		System.out.println("memberController-memberIdCheck");
		System.out.println("id : " +memberId);
		
		boolean memberIdCheck = memberService.memberIdCheck(memberId);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("memberIdCheck", memberIdCheck);
		
		return map;
		
	}
	
	// 회원가입
		@RequestMapping(value="/member/signUpAction", method = RequestMethod.POST)
		public String signUpAction(MemberVo memberVo) {
			System.out.println("memberController-signUp");
			System.out.println("memberVo : " +memberVo);
			
			boolean signUpCheck = memberService.memberSignUp(memberVo);
			
			
			
			return "/individual";
		}
		
}
