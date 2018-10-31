package com.ksmart.individual.memberDao;

import com.ksmart.individual.memberDto.MemberVo;

public interface MemberDao {

	// 로그인
	public boolean loginCheck(MemberVo memberVo);
	
	// 회원 정보
	public MemberVo viewMember(MemberVo memberVo);
	
	// 아이디 체크
	public boolean memberIdCheck(MemberVo memberVo);
	
}
