package com.ksmart.individual.memberService;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ksmart.individual.memberDao.MemberDao;
import com.ksmart.individual.memberDto.MemberVo;

@Service
@Transactional
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;

	// 로그인
	@Override
	public boolean loginCheck(MemberVo memberVo, HttpSession session) {
		System.out.println("MemberServiceImpl-loginCheck");
		
		boolean loginCheck = memberDao.loginCheck(memberVo);
		
		if(loginCheck) {
			
			MemberVo memberInformation = viewMember(memberVo);
			
			// 세션 등록
			session.setAttribute("memberId", memberInformation.getMemberId());
			session.setAttribute("memberName", memberInformation.getMemberName() );
			session.setAttribute("memberLevel", memberInformation.getMemberLevel() );
			
		}
		
		return loginCheck;
	}
	
	// 회원정보 
	@Override
	public MemberVo viewMember(MemberVo memberVo) {
		System.out.println("MemberServiceImpl-viewMember");
		
		return memberDao.viewMember(memberVo);
	}

	// 아이디 존재 여부
	@Override
	public boolean memberIdCheck(String memberId) {
		System.out.println("MemberServiceImpl-memberIdCheck");
		
		boolean memberIdCheck = memberDao.memberIdCheck(memberId);
		
		return memberIdCheck;
	}

	// 회원가입
	@Override
	public boolean memberSignUp(MemberVo memberVo) {
		System.out.println("MemberServiceImpl-memberSignUp");
		
		if(memberVo.getMemberId() == null || memberVo.getMemberPassword() == null || memberVo.getMemberName() == null || memberVo.getMemberDateOfBirth() == null 
				|| memberVo.getMemberPhone() == null || memberVo.getMemberEmail() == null) {
			
			
			
		}
		
		memberDao.memberSignUp(memberVo);
		
		memberDao.memberSignUpDetails(memberVo);
		
		return false;
	}
	
}
