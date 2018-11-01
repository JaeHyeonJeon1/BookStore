// 2018.10.30
package com.ksmart.individual.memberDto;

public class MemberVo {

	private String memberId;	// 아이디
	private String memberPassword;	// 비밀번호
	private String memberPasswordCheck;	// 비밀번호 확인
	private String memberName;	// 성명
	private String memberLevel;	// 권한
	private String memberPhone;	// 폰번호 
	private String memberDateOfBirth;	// 생년월일
	private String memberAddress;	// 주소
	private String memberEmail;	// 이메일
	
	// 패스워드 확인
	public boolean equalsPasswordCheck() {
		return memberPassword.equals(memberPasswordCheck);
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPassword() {
		return memberPassword;
	}

	public void setMemberPassword(String memberPassword) {
		this.memberPassword = memberPassword;
	}

	public String getMemberPasswordCheck() {
		return memberPasswordCheck;
	}

	public void setMemberPasswordCheck(String memberPasswordCheck) {
		this.memberPasswordCheck = memberPasswordCheck;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberLevel() {
		return memberLevel;
	}

	public void setMemberLevel(String memberLevel) {
		this.memberLevel = memberLevel;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	public String getMemberDateOfBirth() {
		return memberDateOfBirth;
	}

	public void setMemberDateOfBirth(String memberDateOfBirth) {
		this.memberDateOfBirth = memberDateOfBirth;
	}

	public String getMemberAddress() {
		return memberAddress;
	}

	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	@Override
	public String toString() {
		return "MemberVo [memberId=" + memberId + ", memberPassword=" + memberPassword + ", memberPasswordCheck="
				+ memberPasswordCheck + ", memberName=" + memberName + ", memberLevel=" + memberLevel + ", memberPhone="
				+ memberPhone + ", memberDateOfBirth=" + memberDateOfBirth + ", memberAddress=" + memberAddress
				+ ", memberEmail=" + memberEmail + "]";
	}
	
}
