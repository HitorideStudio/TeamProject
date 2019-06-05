package hmjm.bean.review;

import java.sql.*;
import javax.sql.*;
import javax.naming.*;
import java.util.*; 
import hmjm.bean.vo.reviewVO;

public class reviewDAO {
	private static reviewDAO instance = new reviewDAO();
	public static reviewDAO getInstance() { return instance; }
	private reviewDAO() {}
	
	private Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/xe");
		return ds.getConnection();
	}
	
public void insertArticle(reviewVO article) throws Exception {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int number=0;
		String sql="";
		try {
			conn = getConnection(); 
			pstmt = conn.prepareStatement("select max(r_num) from review");
			rs = pstmt.executeQuery();
			if (rs.next()) 
				number=rs.getInt(1)+1;	
			else
				number=1; 
			sql = "insert into review(r_num, r_name, r_s_curr, r_s_pre, r_s_tk, r_s_deli, r_s_kind, r_re, r_reg) "
					+ "values(review_seq.NEXTVAL,?,?,?,?,?,?,?,sysdate)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, article.getR_name());
			pstmt.setInt(2, article.getR_s_curr());
			pstmt.setInt(3, article.getR_s_pre());
			pstmt.setInt(4, article.getR_s_tk());
			pstmt.setInt(5, article.getR_s_deli());
			pstmt.setInt(6, article.getR_s_kind());
			pstmt.setString(7, article.getR_re());

			pstmt.executeUpdate();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
	}
	
	
	public int getArticleCount() throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x=0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from review");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				x= rs.getInt(1); //첫번째 컬럼 값
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
	

	public List getArticles(int start, int end) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List articleList=null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					" select r_num,r_name,r_s_curr,r_s_pre,r_s_tk,r_s_deli,r_s_kind,r_re,r_reg, r "+
					" from (select r_num,r_name,r_s_curr,r_s_pre,r_s_tk,r_s_deli,r_s_kind,r_re,r_reg,rownum r " +
					" from (select r_num,r_name,r_s_curr,r_s_pre,r_s_tk,r_s_deli,r_s_kind,r_re,r_reg " +
					" from review order by r_reg desc) order by r_reg desc) where r >= ? and r <= ? ");
		
					pstmt.setInt(1, start); 
					pstmt.setInt(2, end); 

					rs = pstmt.executeQuery();
					if (rs.next()) {
						articleList = new ArrayList(end); 
						do{ 
							reviewVO article= new reviewVO();
							article.setR_num(rs.getInt("r_num"));
							article.setR_name(rs.getString("r_name"));
							article.setR_s_curr(rs.getInt("r_s_curr"));
							article.setR_s_pre(rs.getInt("r_s_pre"));
							article.setR_s_tk(rs.getInt("r_s_tk"));
							article.setR_s_deli(rs.getInt("r_s_deli"));
							article.setR_s_kind(rs.getInt("r_s_kind"));
							article.setR_re(rs.getString("r_re"));
							article.setR_reg(rs.getTimestamp("r_reg"));
							
							articleList.add(article); 
						}while(rs.next());
					}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}

		
		return articleList;
	}
	
	public reviewVO getArticle(int num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		reviewVO article=null;
		try {
			conn = getConnection();
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			pstmt = conn.prepareStatement("select * from review where r_num = ?"); 
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				article = new reviewVO();
				article.setR_num(rs.getInt("r_num"));
				article.setR_name(rs.getString("r_name"));
				article.setR_s_curr(rs.getInt("r_s_curr"));
				article.setR_s_pre(rs.getInt("r_s_pre"));
				article.setR_s_tk(rs.getInt("r_s_tk"));
				article.setR_s_deli(rs.getInt("r_s_deli"));
				article.setR_s_kind(rs.getInt("r_s_kind"));
				article.setR_re(rs.getString("r_re"));
				article.setR_reg(rs.getTimestamp("r_reg"));
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		
		return article;
	}
	
	
	public reviewVO updateGetArticle(int num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		reviewVO article=null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
			"select * from review where r_num = ?"); 
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				article = new reviewVO();
				article.setR_num(rs.getInt("r_num"));
				article.setR_name(rs.getString("r_name"));
				article.setR_s_curr(rs.getInt("r_s_curr"));
				article.setR_s_pre(rs.getInt("r_s_pre"));
				article.setR_s_tk(rs.getInt("r_s_tk"));
				article.setR_s_deli(rs.getInt("r_s_deli"));
				article.setR_s_kind(rs.getInt("r_s_kind"));
				article.setR_re(rs.getString("r_re"));
				article.setR_reg(rs.getTimestamp("r_reg"));
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}

		return article;
	}
	

	public int updateArticle(reviewVO article) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		String sql="";
		int x=-1;
		try {
			conn = getConnection();
			sql="update review set r_re=?, r_s_curr=?, r_s_pre=?, r_s_tk=?, r_s_deli=?, r_s_kind=? where r_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, article.getR_re());
			pstmt.setInt(2, article.getR_s_curr());
			pstmt.setInt(3, article.getR_s_pre());
			pstmt.setInt(4, article.getR_s_tk());
			pstmt.setInt(5, article.getR_s_deli());
			pstmt.setInt(6, article.getR_s_kind());
			pstmt.setInt(7, article.getR_num());
			pstmt.executeUpdate();
			x= 1;
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return x;
	}
	

	public int deleteArticle(int num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		//String dbpasswd="";
		int x=-1;
		try {
			conn = getConnection();
			//pstmt = conn.prepareStatement("select passwd from review where num = ?");
			//pstmt.setInt(1, num);
			//rs = pstmt.executeQuery();
			//if(rs.next()){
			//	dbpasswd= rs.getString("passwd");
			//	if(dbpasswd.equals(passwd) || (passwd == null)){
			//rs.next();
					pstmt = conn.prepareStatement("delete from review where r_num=?");
					pstmt.setInt(1, num);
					pstmt.executeUpdate();
					x= 1; 
				//}else
				//	x= 0; 
			//}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return x;
	}

	
	
}