package com.javalec.ex;

import java.sql.Timestamp;

public class MemberDto { // 데이터객체

	private String id;//회원의 아이디 패스워드 이름이메일 가입시기 주소
	private String pw;
	private String name;
	private String eMail;
	private Timestamp rDate;
	private String address;
	
//	public MemberDto(String id, String pw, String name, String eMail, Timestamp rDate, String address) {
//		this.id = id;
//		this.pw = pw;
//		this.name = name;
//		this.eMail = eMail;
//		this.rDate = rDate;
//		this.address = address;
//	}
//게터세터 아래
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String geteMail() {
		return eMail;
	}

	public void seteMail(String eMail) {
		this.eMail = eMail;
	}

	public Timestamp getrDate() {
		return rDate;
	}

	public void setrDate(Timestamp rDate) {
		this.rDate = rDate;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
}
