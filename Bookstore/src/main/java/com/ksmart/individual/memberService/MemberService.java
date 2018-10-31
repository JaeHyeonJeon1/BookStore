package com.ksmart.individual.memberService;

import javax.servlet.http.HttpSession;

import com.ksmart.individual.memberDto.MemberVo;

public interface MemberService {
	
	// 로그인
	public boolean loginCheck(MemberVo memberVo, HttpSession session);

	// 회원 정보
	public MemberVo viewMember(MemberVo memberVo);
	
	// 아이디확인
	public boolean memberIdCheck(MemberVo memberVo);
	
}
