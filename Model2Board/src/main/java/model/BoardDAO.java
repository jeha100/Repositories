package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;

	
	public void getCon() {
	    try {
//	    	Context initctx = new InitialContext();
//	    	Context envctx = (Context) initctx.lookup("java:comp/env");
//	    	DataSource ds = (DataSource) envctx.lookup("jdbc/pool");
//	    	con = ds.getConnection();//커넥션연결메소드
	    	
	    	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	    	String uid = "system";
	    	String upw = "oracle";
	    	Class.forName("oracle.jdbc.driver.OracleDriver");
	    	con = DriverManager.getConnection(url, uid, upw);
	   
	    
	    } catch (Exception e) {
	    		e.printStackTrace();
	    }
	}

	//전체 게시글의 갯수를 리턴하는 메소드 
	public int getAllCount(){
		
		int count = 0;
		getCon();
		
		try {
			//쿼리 준비 
			String sql ="select count(*) from board";
			pstmt =con.prepareStatement(sql);
			//쿼리 실행후 결과를 리턴 
			rs = pstmt.executeQuery();
			//단일행 함수라 while안돈다
			if(rs.next()){//데이터가 있다면
				count = rs.getInt(1);//검색결과값을 count에 넣는다.
			}
			
			con.close();//자원닫아주기
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		
		return count;
		
	}

	
	//모든 화면에 보여질 데이터 10개씩 추출해서 리턴하는 매소드
	public Vector<BoardBean> getAllBoard(int startRow , int endRow){
		Vector<BoardBean> v = new Vector<>();
		getCon();
		try {
			//쿼리 준비 
			String sql = "select * from (select A.* ,Rownum Rnum from (select *from board order by ref desc ,re_step asc)A)"
					+ "where Rnum >= ? and Rnum <= ?";
			
			//쿼리실행 객체 
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,startRow);
			pstmt.setInt(2,endRow);
			
			//쿼리를 실행후 결과를 저장
			rs = pstmt.executeQuery();	
			
			//데이터 개수가 몇개인지 모르기에 반복문을 이용하여 데이터를 추출 
			while(rs.next()){
				 //데이터를 패키징(가방 = Boardbean클래스를 이용)해줌
				 BoardBean bean = new BoardBean();
				 bean.setNum(rs.getInt(1));
				 bean.setWriter(rs.getString(2));
				 bean.setEmail(rs.getString(3));
				 bean.setSubject(rs.getString(4));
				 bean.setPasword(rs.getString(5));
				 bean.setReg_date(rs.getDate(6).toString());
				 bean.setRef(rs.getInt(7));
				 bean.setRe_step(rs.getInt(8));
				 bean.setRe_level(rs.getInt(9));
				 bean.setReadcount(rs.getInt(10));
				 bean.setContent(rs.getString(11));
				 //패키징한 데이터를 벡터에 저장 
				 v.add(bean);
			 }
			con.close();
			
			}catch(Exception e) {
				e.printStackTrace();	
			}	
			return v;
	}

	public void insertBoard(BoardBean bean) {
		getCon();
		//빈 클래스에 넘어오지 않았던 데이터들을 초기화 해주어야 합니다.
		int ref = 0;// 글 그룹을 의미 = 쿼리를 실행시켜 가장큰 ref 값을 가져온후 +1을 더해주면 된다 
		int re_step = 1;//새글이기에 = 부모 글이기에
		int re_level = 1;
		try {
			//가장큰 ref값을 읽어오는 쿼리 준비 
			String refsql = "SELECT max(ref) FROM BOARD";
			//쿼리실행 객체 
			pstmt = con.prepareStatement(refsql);
			//쿼리를 실행후 결과를 리턴
			 rs = pstmt.executeQuery();	
			if(rs.next()){//결과 값이 있다면
				ref = rs.getInt(1)+1;//최대 값에 +1을 더해서 글 그룹을 설정	
			}
			//실제로 게시글 전체값을 테이블에 저장 
			String sql = "INSERT INTO BOARD VALUES(board_seq.NEXTVAL,?,?,?,?,sysdate,?,?,?,0,?)";
			pstmt = con.prepareStatement(sql);
			//?의 값을 맵핑
			pstmt.setString(1, bean.getWriter());
			pstmt.setString(2, bean.getEmail());
			pstmt.setString(3, bean.getSubject());
			pstmt.setString(4, bean.getPasword());
			pstmt.setInt(5, ref);
			pstmt.setInt(6, re_step);
			pstmt.setInt(7, re_level);
			pstmt.setString(8, bean.getContent());		
			//쿼리를 실행하시오
			pstmt.executeUpdate();	
			//자원 반납
			con.close();
			}catch(Exception e) {
				e.printStackTrace();	
			}	
	}
	
	
	//BoardInfo 하나의 게시글 리턴하는 메소드 -조회수 1씩증가(readcount) 도 올라가는메소드 작성
	public BoardBean getOneBoard(int num){	
		//리턴 타입 선언
		BoardBean bean = null;
		getCon();
		try {
			//하나의 게시글을 읽었다는 조회수 증가 쿼리 
			String readsql = "update board set readcount = readcount+1 where num=?";
			pstmt = con.prepareStatement(readsql);
			pstmt.setInt(1,num);
			pstmt.executeUpdate();	
				
			//한게시글에대한 정보를 리턴해주는 쿼리작성
			String sql = "select * from board where num=?";
			//쿼리실행 객체 
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,num);
			//쿼리 실행후 결과를 리턴
			rs= pstmt.executeQuery();
				
			if(rs.next()) {
				bean = new BoardBean();
				bean.setNum(rs.getInt(1));
				bean.setWriter(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setSubject(rs.getString(4));
				bean.setPasword(rs.getString(5));
				bean.setReg_date(rs.getDate(6).toString());
				bean.setRef(rs.getInt(7));
				bean.setRe_step(rs.getInt(8));
				bean.setRe_level(rs.getInt(9));
				bean.setReadcount(rs.getInt(10));
				bean.setContent(rs.getString(11));
				}
				
				con.close();
			}catch(Exception e) {
				e.printStackTrace();
				
			}
			return bean;
		}
	
	//답변글이 저장되는 메소드 
	public void reWriteBoard(BoardBean bean){
		//부모글 그룹과 글레벨 글 스템을 읽어드림 
		int ref =bean.getRef();
		int re_step = bean.getRe_step();
		int re_level = bean.getRe_level();
		
		getCon();
		
		try {
			/////////////////////핵심 코드 //////////////////////// 
				//부모글 보다 큰 re_level의 값을 전부 1씩 증가시켜줌 
				String  levelsql = "update board set re_level=re_level+1 where ref=? and re_level > ?";
				//쿼리 삽입 객체 선언 
				pstmt = con.prepareStatement(levelsql);
				pstmt.setInt(1 , ref);
				pstmt.setInt(2 , re_level);
				//쿼리 실행 
				pstmt.executeUpdate();
				//답변글 데이터를 저장
				String sql ="insert into board values(board_seq.NEXTVAL,?,?,?,?,sysdate,?,?,?,0,?)";
				pstmt = con.prepareStatement(sql);
				//?에 값을 대입
				pstmt.setString(1, bean.getWriter());
				pstmt.setString(2, bean.getEmail());
				pstmt.setString(3, bean.getSubject());
				pstmt.setString(4, bean.getPasword());
				pstmt.setInt(5, ref);//부모의 ref 값을 넣어줌 
				pstmt.setInt(6, re_step+1);//답글이기에 부모글 re_step에 1을 넣어줌 
				pstmt.setInt(7, re_level + 1);
				pstmt.setString(8, bean.getContent());
				
				//쿼리를 실행하시오
				pstmt.executeUpdate();	
				con.close();
				
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	//조회수를 증가하지 않는 하나의 게시글을 리턴하는 메소드
	//Boardupdate용 Delete시 하나의 게시글을 리턴
	public BoardBean getOneUpdateBoard(int num){	
		//리턴 타입 선언
		BoardBean bean = new BoardBean();
		getCon();
		try {
			//쿼리준비
			String sql = "select * from board where num=?";
			//쿼리실행객체 
			//쿼리실행 객체 
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,num);
			//쿼리 실행후 결과를 리턴
			rs= pstmt.executeQuery();
			
			if(rs.next()) {
				 bean.setNum(rs.getInt(1));
				 bean.setWriter(rs.getString(2));
				 bean.setEmail(rs.getString(3));
				 bean.setSubject(rs.getString(4));
				 bean.setPasword(rs.getString(5));
				 bean.setReg_date(rs.getDate(6).toString());
				 bean.setRef(rs.getInt(7));
				 bean.setRe_step(rs.getInt(8));
				 bean.setRe_level(rs.getInt(9));
				 bean.setReadcount(rs.getInt(10));
				 bean.setContent(rs.getString(11));
			}
			
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		return bean;
	}
	
	
	//하나의 게시글을 수정하는 메소드
	public void updateBoard(int num ,String subject , String content){
		getCon();
			
		try {		
			//쿼리 준비 
			String sql = "update board set subject=? , content= ? where num = ?";
				
			//쿼리 실행할 객체 선언
			pstmt = con.prepareStatement(sql);
			
			//?에 값을 대입 하기
			pstmt.setString(1,subject);
			pstmt.setString(2,content);
			pstmt.setInt(3,num);
			
			//쿼리 실행후 결과를 리턴
			pstmt.executeUpdate();
				
			//자원 반납
			con.close();
					
		}catch(Exception e) {
			e.printStackTrace();
		}
	}  
	
	
	//하나의 게시글을 삭제하는 매소드
		public void deleteBoard(int num){
			getCon();
			
			try {		
				//쿼리 준비 
				String sql = "delete from board where num=?";
				
				//쿼리 실행할 객체 선언
				pstmt = con.prepareStatement(sql);
				//?
				pstmt.setInt(1,num);
				
				//쿼리 실행
				pstmt.executeUpdate();
				
				//자원 반납
				con.close();
					
			}catch(Exception e) {
				e.printStackTrace();
				
			}
		}
	   
}
