package com.javalec.ex;

public class Student {
	//속성
	private String name;
	private int age;
	private int grade;
	private int studentNum;
	
public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public int getStudentNum() {
		return studentNum;
	}

	public void setStudentNum(int studentNum) {
		this.studentNum = studentNum;
	}
//--위 모든속성의 setter와 getter자동으로 만듦
	
public Student() {
	// TODO Auto-generated constructor stub

//기본디폴트생성자
}
}
