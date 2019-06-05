package hmjm.bean.message;

import java.sql.*;
import javax.sql.*;

import javax.naming.*;
import java.util.*; 
import hmjm.bean.vo.messageVO;

public class messageDAO {
	private static messageDAO instance = new messageDAO();
	public static messageDAO getInstance() { return instance; }
	private messageDAO() {}
	
	private Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/xe");
		return ds.getConnection();
	}
	
	public void insertArticle(messageVO article) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int number=0;
		String sql="";
		try {
			conn = getConnection(); 
			pstmt = conn.prepareStatement("select max(s_num) from message");
			rs = pstmt.executeQuery();
			if (rs.next()) 
				number=rs.getInt(1)+1;	
			else
				number=1; 
			sql = "insert into message(s_num, s_count, s_content, s_reg, s_send, s_receive) "
					+ "values(review_seq.NEXTVAL,?,?,sysdate,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, article.getS_count());
			pstmt.setString(2, article.getS_content());
			pstmt.setString(3, article.getS_send());
			pstmt.setString(4, article.getS_receive());
			pstmt.executeUpdate();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
	}
	
	public int getArticleCount(String receiver) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x=0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from message where s_receive=?");
			pstmt.setString(1, receiver);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				x= rs.getInt(1);
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

	public List getArticles(int start, int end, String receiver) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List articleList=null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("update message set s_count=s_count+1");
			pstmt.executeQuery();
			pstmt = conn.prepareStatement(
					"select s_num,s_count,s_content,s_reg,s_send,s_receive,r "
					+ " from (select s_num,s_count,s_content,s_reg,s_send,s_receive,rownum r "
					+ " from (select * from message where s_receive=? order by s_reg desc) "
					+ " order by s_reg desc) where r>=? and r<=?");
			pstmt.setString(1, receiver);		
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rs = pstmt.executeQuery();
					if (rs.next()) {
						articleList = new ArrayList(); 
						do{ 
							messageVO article= new messageVO();
							article.setS_num(rs.getInt("s_num"));
							article.setS_count(rs.getInt("s_count"));
							article.setS_content(rs.getString("s_content"));
							article.setS_reg(rs.getTimestamp("s_reg"));
							article.setS_send(rs.getString("s_send"));
							article.setS_receive(rs.getString("s_receive"));
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
	
	public messageVO getArticle(int num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		messageVO article=null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from message where s_num = ?"); 
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				article = new messageVO();
				article.setS_num(rs.getInt("s_num"));
				article.setS_count(rs.getInt("s_count"));
				article.setS_content(rs.getString("s_content"));
				article.setS_reg(rs.getTimestamp("s_reg"));
				article.setS_send(rs.getString("s_send"));
				article.setS_receive(rs.getString("s_receive"));
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
	
	public int deleteArticle(int num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		int x=-1;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("delete from message where s_num=?");
			pstmt.setInt(1, num);
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
	
}