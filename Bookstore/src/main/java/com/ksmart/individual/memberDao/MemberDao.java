package com.ksmart.individual.memberDao;

import com.ksmart.individual.memberDto.MemberVo;

public interface MemberDao {

	// 로그인
	public boolean loginCheck(MemberVo memberVo);
	
	// 회원 정보
	public MemberVo viewMember(MemberVo memberVo);
	
	// 아이디 존재 여부
	public boolean memberIdCheck(String memberId);
	
	// 회원가입
	public void memberSignUp(MemberVo memberVo);
	
	// 회원가입(세부정보)
	public void memberSignUpDetails(MemberVo memberVo);
	
}
