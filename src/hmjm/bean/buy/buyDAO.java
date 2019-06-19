package hmjm.bean.buy;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
////저장된 구매 수 얻어냄//kunhoon
	public int buyCount() throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x=0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from buy");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				x= rs.getInt(1); //0번아니고 1번부터 시작
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return x; 
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
	//구매리스트 위해 kunhoon
		public List getBuyList(String email, int start, int end)throws Exception{
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List productbuyList= null;
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(
					"select b_num,b_email,b_productnumber,b_classname,b_place,b_day,r"
					+ " from(select b_num,b_email,b_productnumber,b_classname,b_place,b_day,rownum r"
					+ " from(select * from buy where b_email =? order by b_num)"
					+ " order by b_num) where r>=? and r<=? ");
				pstmt.setString(1, email);
				pstmt.setInt(2, start);
				pstmt.setInt(3, end);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					productbuyList = new ArrayList(end);
					do {
						buyVO vo = new buyVO();
						vo.setB_num(rs.getInt("b_num"));
						vo.setB_email(rs.getString("b_email"));
						vo.setB_productnumber(rs.getInt("b_productnumber"));
						vo.setB_classname(rs.getString("b_classname"));
						vo.setB_place(rs.getString("b_place"));
						vo.setB_day(rs.getString("b_day"));
						productbuyList.add(vo);
					}while(rs.next());
				}
			}catch(Exception ex) {
				ex.printStackTrace();
			}finally {
				if (rs != null) try { rs.close(); } catch(SQLException ex) {}
				if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
				if (conn != null) try { conn.close(); } catch(SQLException ex) {}
			}
						
			return productbuyList;		
						
			}
		}
	

