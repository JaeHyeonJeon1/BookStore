package com.ksmart.individual.memberDao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ksmart.individual.memberDto.MemberVo;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private final String nameSpace = "com.ksmart.individual.memberDao.MemberMapper.";
	
	// 로그인 체크
	@Override
	public boolean loginCheck(MemberVo memberVo) {
		System.out.println("MemberDaoImpl-loginCheck");
		
		String name = sqlSessionTemplate.selectOne(nameSpace +"loginCheck", memberVo);
		
		return (name == null)? false : true;
	}

	// 회원 정보
	@Override
	public MemberVo viewMember(MemberVo memberVo) {
		System.out.println("MemberDaoImpl-viewMember");
		
		return sqlSessionTemplate.selectOne(nameSpace +"memberInformation", memberVo);
	}
	
	// 아이디 존재 여부
	@Override
	public boolean memberIdCheck(String memberId) {
		System.out.println("MemberDaoImpl-memberIdCheck");
		
		String memberIdCheck = sqlSessionTemplate.selectOne(nameSpace +"memberIdCheck", memberId);
		
		return (memberIdCheck == null)? false : true;
	}

	// 회원가입
	@Override
	public void memberSignUp(MemberVo memberVo) {
		System.out.println("MemberDaoImpl-memberSignUp");
		
		sqlSessionTemplate.insert(nameSpace+"signUp" ,memberVo);
		
	}

	// 회원가입(세부정보)
	@Override
	public void memberSignUpDetails(MemberVo memberVo) {
		System.out.println("MemberDaoImpl-memberSignUpDetails");
		
		sqlSessionTemplate.insert(nameSpace+"signUpDetails" ,memberVo);
	}
	
}
