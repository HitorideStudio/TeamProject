package hmjm.bean.classtime;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import hmjm.bean.product.*;

public class classtimeDAO {
	public static classtimeDAO instance = new classtimeDAO();
	public static classtimeDAO getInstance() {
		return instance;
	}

	private classtimeDAO() {};

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	private Connection getConnection() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String user="TEAM03", pass="TEAM03";
			String url="jdbc:oracle:thin:@nullmaster.iptime.org:1521:xe";
			conn = DriverManager.getConnection(url,user,pass);	
		}
		catch(Exception e){ e.printStackTrace(); }
		return conn;
	}
	//삽입, 수정, 삭제, 조회 기능 필요
	/*
	private int ct_num;
	private int ct_classnum;
	private String ct_place;
	private String ct_mon;
	private String ct_tue;
	private String ct_wed;
	private String ct_thu;
	private String ct_fri;
	private String ct_sta;
	private String ct_sun;
	private String ct_day;
	 * */


	//삽입

	//작성한 수업 시간  DB에 삽입, -ok
	public void insertClasstime(classtimeVO classtime) {	    

		String sql="";
		try {
			conn = getConnection(); 

			sql = "insert into classtime values(product_seq.nextval,?,?,?,?,?,?,?,?,?,?)"; 
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, classtime.getCt_classnum());
			pstmt.setString(2, classtime.getCt_place());
			pstmt.setString(3, classtime.getCt_mon());
			pstmt.setString(4, classtime.getCt_tue());
			pstmt.setString(5, classtime.getCt_wed());
			pstmt.setString(6, classtime.getCt_thu());
			pstmt.setString(7, classtime.getCt_fri());
			pstmt.setString(8, classtime.getCt_sta());
			pstmt.setString(9, classtime.getCt_sun());
			pstmt.setString(10, classtime.getCt_day());

			pstmt.executeUpdate();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
	}


	//수정, -not yet
	public void updateClasstime(classtimeVO vo) {
		try {
			conn = getConnection();

			pstmt = conn.prepareStatement("update classtime set ct_place=?,ct_mon=?,ct_tue=?,"
					+ "ct_wed=?,ct_thu=?,ct_fri=?,ct_sta=?,ct_sun=?,ct_day=?  where ct_num=?");
			pstmt.setString(1, vo.getCt_place());
			pstmt.setString(2, vo.getCt_mon());
			pstmt.setString(3, vo.getCt_tue());
			pstmt.setString(4, vo.getCt_wed());
			pstmt.setString(5, vo.getCt_thu());
			pstmt.setString(6, vo.getCt_fri());
			pstmt.setString(7, vo.getCt_sta());
			pstmt.setString(8, vo.getCt_sun());
			pstmt.setString(9, vo.getCt_day());
			pstmt.setInt(10, vo.getCt_num());

			pstmt.executeUpdate();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
	}
	
	//삭제
	//조회 우선 제가 작성할게요 by건훈 
	
	public classtimeVO getClasstime(int ct_classnum)
			throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		classtimeVO vo = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from classtime where ct_classnum = ?");
			pstmt.setInt(1, ct_classnum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo = new classtimeVO();
				vo.setCt_num(rs.getInt("ct_num"));
				vo.setCt_classnum(rs.getInt("ct_classnum"));
				vo.setCt_place(rs.getString("ct_place"));
				vo.setCt_mon(rs.getString("ct_mon"));
				vo.setCt_tue(rs.getString("ct_tue"));
				vo.setCt_wed(rs.getString("ct_wed"));
				vo.setCt_thu(rs.getString("ct_thu"));
				vo.setCt_fri(rs.getString("ct_fri"));
				vo.setCt_sta(rs.getString("ct_sta"));
				vo.setCt_sun(rs.getString("ct_sun"));
				vo.setCt_day(rs.getString("ct_day"));

			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return vo;
	}

}
