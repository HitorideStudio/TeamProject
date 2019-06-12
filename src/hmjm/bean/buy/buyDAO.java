package hmjm.bean.buy;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import hmjm.bean.buy.buyVO;


public class buyDAO {
	public static buyDAO instance = new buyDAO();
	public static buyDAO getInstance() {
		return instance;
	}
	private buyDAO() {}
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private Connection getConnection() {
		try {
			Context ctx = new InitialContext();
			Context env = (Context)ctx.lookup("java:comp/env");
			DataSource ds =(DataSource)env.lookup("jdbc/xe");
			conn = ds.getConnection();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}

	public void insertBuy(buyVO vo) {
		try {
			conn = getConnection();
			String sql = "insert into buy values (buy_seq.nextval,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getB_email());
			pstmt.setInt(2, vo.getB_productnumber());
			pstmt.setString(3, vo.getB_classname());
			pstmt.setString(4, vo.getB_place());
			pstmt.setString(5, vo.getB_day());
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) {try {pstmt.close();}catch(SQLException s) {}}
			if(conn != null) {try {conn.close();}catch(SQLException s) {}}
		}
	}
	
	public buyVO getBuy(String b_email)
		throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		buyVO vo = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select * from buy where b_email = ?");
			pstmt.setString(1, b_email);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo = new buyVO();
				vo.setB_num(rs.getInt("b_num"));
				vo.setB_email(rs.getString("b_email"));
				vo.setB_productnumber(rs.getInt("b_productnumber"));
				vo.setB_classname(rs.getString("b_classname"));
				vo.setB_place(rs.getString("b_place"));
				vo.setB_day(rs.getString("b_day"));
			}
	}catch(Exception ex) {
		ex.printStackTrace();
	}finally {
		if (rs != null) try { rs.close(); } catch(SQLException ex) {}
		if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
		if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	}
	return vo;
	}
	
	
}
