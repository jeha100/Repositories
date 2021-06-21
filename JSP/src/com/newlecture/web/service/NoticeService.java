package com.newlecture.web.service;

import java.util.List;

import com.newlecture.web.entity.Notice;
//자바호출스택내용보기 오버로드 함수 보다 클래스안에있으니 메서드
public class NoticeService {

	public List<Notice>getNoticeList(){//반환타입 함수
		return getNoticeList("title","",1);
	}
	public List<Notice>getNoticeList(int page){//반환타입 함수
		return getNoticeList("title","",page);
	}
	public List<Notice>getNoticeList(String field,String query,int page){//반환타입 함수
		return null;
	}
	public int getNoticeCount() {
		return getNoticeCount("title","");
	}
		public int getNoticeCount(String field,String query) {
			return 0;
		}
		public Notice getNotice(int id) {
//			String sql=""
			return null;
		}
		public Notice getNextNotice(int id) {
			return null;
		}
		public Notice getPrevNotice(int id) {
			return null;
		}

}

