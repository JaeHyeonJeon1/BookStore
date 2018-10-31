// 2018.10.30
package com.ksmart.individual.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	// 회원가입
	@RequestMapping(value="/member/signUp", method = RequestMethod.GET)
	public String signUp() {
		System.out.println("memberController-signUp");
		
		return "member/signUp";
	}
	
	// 아이디 확인
	@RequestMapping(value="/member/memberIdCheck", method = RequestMethod.POST)
	public boolean memberIdCheck(MemberVo memberVo) {
		System.out.println("memberController-memberIdCheck");
		System.out.println("id : " +memberVo.getMemberId());
		
		boolean memberIdCheck = memberService.memberIdCheck(memberVo);
		
		if(memberIdCheck == false) {
			
			System.out.println("memberIdCheck : 없음");
			
			return true;
			
		} else {
			
			System.out.println("memberIdCheck : 사용중");
			
			return false;
			
		}
		
	}
}
