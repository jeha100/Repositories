package com.newlecture.web.entity;

import java.util.Date;

public class Notice {
private int id;
private String title;/* title이 모델이된다.*/
private String writerId; 
private Date regdate;
private String hit;
private String files; 
private String content;




//2기본생성자 
public Notice() {
	// TODO Auto-generated constructor stub
}


//1오버로드생성자
public Notice(int id, String title,  String writerId,Date regdate, String hit, String files, String content) {
	
	this.id = id;
	this.title = title;
	this.writerId = writerId;
	this.regdate = regdate;
	this.hit = hit;
	this.files = files;
	this.content = content;
}//오버로드와 값의순서가 꼭 같아야한다. 세터를안쓸경우 특히 구별!

//게터세터
public int getId() {
	return id;
}


public void setId(int id) {
	this.id = id;
}


public String getTitle() {
	return title;
}


public void setTitle(String title) {
	this.title = title;
}


public Date getRegdate() {
	return regdate;
}


public void setRegdate(Date regdate) {
	this.regdate = regdate;
}


public String getWriterId() {
	return writerId;
}


public void setWriterId(String writerId) {
	this.writerId = writerId;
}


public String getHit() {
	return hit;
}


public void setHit(String hit) {
	this.hit = hit;
}


public String getFiles() {
	return files;
}


public void setFiles(String files) {
	this.files = files;
}


public String getContent() {
	return content;
}


public void setContent(String content) {
	this.content = content;
}

//5번 출력해주는 tostring
@Override
public String toString() {
	return "Notice [id=" + id + ", title=" + title + ", regdate=" + regdate + ", writerId=" + writerId + ", hit=" + hit
			+ ", files=" + files + ", content=" + content + "]";
}


//이로서 notice라는 entity객체를만들었다.
}
