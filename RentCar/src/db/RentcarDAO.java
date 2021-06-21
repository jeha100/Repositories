package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class RentcarDAO {

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	////Ŀ�ؼ� Ǯ�� �̿��� ������ ���̽� ����
	
	public void getCon() {
		try {
			Context initctx = new InitialContext();
			Context envctx = (Context) initctx.lookup("java:comp/env");
			DataSource ds = (DataSource) envctx.lookup("jdbc/pool");
			con = ds.getConnection();
			
		} catch (Exception e) {
			e.printStackTrace();
		
	}
}

    //�ֽż����� 3���� �ڵ����� �����ϴ� �޼ҵ� 
    public Vector<CarListBean> getSelectCar(){
		//���� Ÿ���� ���� 
		Vector<CarListBean> v = new Vector<>();
		getCon();//Ŀ�ؼ��� ����Ǿ�� ������ ���డ�� 
		
    	try {
    		String sql = "select * from rentcar order by no desc";
    		pstmt = con.prepareStatement(sql);
    		//���� ������ ����� Result Ÿ������ ���� 
    		rs = pstmt.executeQuery();
    		int count= 0;//���α׷��������� 
    		
    		while(rs.next()){
    			CarListBean bean = new CarListBean();
    			bean.setNo(rs.getInt(1));
    			bean.setName(rs.getString(2));
    			bean.setCategory(rs.getInt(3));
    			bean.setPrice(rs.getInt(4));
    			bean.setUsepeople(rs.getInt(5));
    			bean.setCompany(rs.getString(6));
    			bean.setImg(rs.getString(7));
    			bean.setInfo(rs.getString(8));
    			//���Ϳ� �� Ŭ������ ����
    			v.add(bean);
    			count++;
    			if(count >= 3)break;//�ݺ����� ���������ÿ� 
    			//3���� ���Ϳ� ����
    		}
    		con.close();
    	}catch (Exception e) {
    		e.printStackTrace();
    	}
    	return v;
    }
	
    //ī�װ��� �ڵ��� ����Ʈ�� �����ϴ� �޼ҵ� ���� ���� ����
    public Vector<CarListBean> getCategoryCar(int cate) {
    	//���� Ÿ���� ���� 
		Vector<CarListBean> v = new Vector<>();
		//����Ŭ���� �����͸� ������ �� Ŭ���� ���� -���Ϲ����鼭 ��ӻ����ϱ��
		CarListBean bean = null;
		
		getCon();//Ŀ�ؼ��� ����Ǿ�� ������ ���డ�� 
		
    	try {
    		String sql = "select * from rentcar where category = ?";
    		pstmt = con.prepareStatement(sql);
    		//?�� ���ֱ�
    		pstmt.setInt(1,cate);
    		
    		// ����� ����
    		rs = pstmt.executeQuery();
    		
    		//�ݺ����� ���鼭 �����͸� ����
    		while(rs.next()){
    			//�����͸� ������ ��Ŭ���� ����
    			bean = new CarListBean();
    			bean.setNo(rs.getInt(1));
    			bean.setName(rs.getString(2));
    			bean.setCategory(rs.getInt(3));
    			bean.setPrice(rs.getInt(4));
    			bean.setUsepeople(rs.getInt(5));
    			bean.setCompany(rs.getString(6));
    			bean.setImg(rs.getString(7));
    			bean.setInfo(rs.getString(8));
    			//���Ϳ� �� Ŭ������ ����
    			v.add(bean);
    		}
    		con.close();
    	}catch (Exception e) {
    		e.printStackTrace();
    	}
    	return v;
    }

    //��� ������ �˻��ϴ� �żҵ�
    public Vector<CarListBean> getAllCar(){
    	//���� Ÿ���� ���� 
		Vector<CarListBean> v = new Vector<>();
		//�����͸� ������ �� Ŭ���� ���� 
		CarListBean bean = null;
		
		getCon();//Ŀ�ؼ��� ����Ǿ�� ������ ���డ�� 
		
    	try {
    		String sql = "select * from rentcar";
    		pstmt = con.prepareStatement(sql);
    		
    		// ����� ����
    		rs = pstmt.executeQuery();
    		
    		//�ݺ����� ���鼭 �����͸� ����
    		while(rs.next()){
    			//�����͸� ������ ��Ŭ���� ����
    			bean = new CarListBean();
    			bean.setNo(rs.getInt(1));
    			bean.setName(rs.getString(2));
    			bean.setCategory(rs.getInt(3));
    			bean.setPrice(rs.getInt(4));
    			bean.setUsepeople(rs.getInt(5));
    			bean.setCompany(rs.getString(6));
    			bean.setImg(rs.getString(7));
    			bean.setInfo(rs.getString(8));
    			//���Ϳ� �� Ŭ������ ����
    			v.add(bean);
    		}
    		con.close();
    	}catch (Exception e) {
    		e.printStackTrace();
    	}
    	return v;
    }

//�ϳ��� �ڵ��� ������ �����ϴ� �żҵ�
public CarListBean getOneCar(int no){
	//���� Ÿ�� ���� 
	CarListBean bean = new CarListBean();
		getCon();
		
 	try {
 		String sql = "select * from rentcar where no = ?";
 		pstmt = con.prepareStatement(sql);
 		pstmt.setInt(1, no);
 		
 		// ����� ����
 		rs = pstmt.executeQuery();
 		
 		//�ݺ����� ���鼭 �����͸� ����
 		while(rs.next()){
 			bean = new CarListBean();
 			bean.setNo(rs.getInt(1));
 			bean.setName(rs.getString(2));
 			bean.setCategory(rs.getInt(3));
 			bean.setPrice(rs.getInt(4));
 			bean.setUsepeople(rs.getInt(5));
 			bean.setCompany(rs.getString(6));
 			bean.setImg(rs.getString(7));
 			bean.setInfo(rs.getString(8));
 		}
 		con.close();
 	}catch (Exception e){
 		e.printStackTrace();
 	}
 	return bean;
}

//ȸ�� ������ �ִ����� �� database�� member ���̺� ��Ȱ��
public int getMember(String id,String pass) {
	
	int result=0;//0�̸� ȸ�� ����
	getCon();
 	try {
 		String sql="select count(*) from member where id =? and pass =?";
 		pstmt = con.prepareStatement(sql);
 		pstmt.setString(1, id);
 		pstmt.setString(2, pass);
 		//��� ����
 		rs = pstmt.executeQuery();
 		
 		if(rs.next()){
 			result = rs.getInt(1);//0�Ǵ� 1���� �����
 		}
 		con.close();
 	}catch (Exception e){
 		e.printStackTrace();
 	} 	
	return result;		
}

//�ϳ��� ���� ������ �����ϴ� �żҵ� 
//reserve_seq ��忡 ������ ������
public void setReserveCar(CarReserveBean bean){
	getCon();
 	try {
 		String sql="insert into CARRESERVE values(RESERVE_SEQ.NEXTVAL,?,?,?,?,?,?,?,?,?)";
 		pstmt = con.prepareStatement(sql);
 		//? ���� ����     		
 		pstmt.setInt(1, bean.getNo());
 		pstmt.setString(2, bean.getId());
 		pstmt.setInt(3, bean.getQty());
 		pstmt.setInt(4, bean.getDday());
 		pstmt.setString(5, bean.getRday());
 		pstmt.setInt(6, bean.getUsein());
 		pstmt.setInt(7, bean.getUsewifi());
 		pstmt.setInt(8, bean.getUsenavi());
 		pstmt.setInt(9, bean.getUseseat());
 		
 		//��� ����
 		pstmt.executeUpdate();
 		con.close();
 		
 	}catch (Exception e){
 		e.printStackTrace();
 	} 		
}
//ȸ���� ���� ������ �����ϴ� �żҵ� 
public Vector<CarReserveBean> getAllReserve(String id){
   	//���� Ÿ���� ���� 
		Vector<CarReserveBean> v = new Vector<>();
		//�����͸� ������ �� Ŭ���� ���� 
		CarViewBean bean = null;
		
		getCon();//Ŀ�ؼ��� ����Ǿ�� ������ ���డ�� 
		
    	try {
    		//natural join������
    		String sql = "select * from rentcar natural join carreserve "
    				+ "where sysdate < to_date(rday,'YYYY-MM-DD') and id =?";
    		pstmt = con.prepareStatement(sql);
    		
    		//?
    		pstmt.setNString(1,id);
    		
    		// ����� ����
    		rs = pstmt.executeQuery();
    		
    		//���? �ѻ���� ������ ���డ���ϱ⿡ while�� ����. �ݺ����� ���鼭 �����͸� ����
    		while(rs.next()){
    			//�����͸� ������ ��Ŭ���� ����
    			bean = new CarViewBean();
    			bean.setName(rs.getString(2));
    			bean.setPrice(rs.getInt(4));
    			bean.setImg(rs.getString(7));
    			bean.setQty(rs.getInt(11));
    			bean.setDday(rs.getInt(12));
    			bean.setRday(rs.getString(13));
    			bean.setUserin(rs.getInt(14));
    			bean.setUsewifi(rs.getInt(15));
    			bean.setUsenavi(rs.getInt(16));
    			bean.setUseseat(rs.getInt(17));
    			//���Ϳ� �� Ŭ������ ����
    			v.add(bean);
    		}
    		con.close();
    	}catch (Exception e) {
    		e.printStackTrace();
    	}
    	return v;
}
//�ϳ��� ���� ����
public void carRemoveReserve(String id, String rday) {
	//���� Ÿ�� ���� 
	CarListBean bean = new CarListBean();
		getCon();
		
 	try {
 		String sql = "delete from carreserve where id=? and rday=?";
 		pstmt = con.prepareStatement(sql);
 		
 		//?
 		pstmt.setString(1, id);
 		pstmt.setString(2, rday);
 		
 		//���� ����
 		pstmt.executeUpdate();
 		con.close();
 	}catch (Exception e){
 		e.printStackTrace();
 	}
}
}
