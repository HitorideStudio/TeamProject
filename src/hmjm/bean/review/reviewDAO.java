/* 판매글에 남기는 리뷰게시판 DAO */
package hmjm.bean.review;

import java.sql.*;
import javax.sql.*;
import javax.naming.*;
import java.util.*; 
import hmjm.bean.review.reviewVO;

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
	
	//리뷰 작성
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
			sql = "insert into review(r_num, r_name, r_s_curr, r_s_pre, r_s_tk, r_s_deli, r_s_kind, r_re, r_reg, pr_num) "
					+ "values(review_seq.NEXTVAL,?,?,?,?,?,?,?,sysdate,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, article.getR_name());
			pstmt.setInt(2, article.getR_s_curr());
			pstmt.setInt(3, article.getR_s_pre());
			pstmt.setInt(4, article.getR_s_tk());
			pstmt.setInt(5, article.getR_s_deli());
			pstmt.setInt(6, article.getR_s_kind());
			pstmt.setString(7, article.getR_re());
			pstmt.setInt(8, article.getPr_num());
			pstmt.executeUpdate();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
	}
	
	//해단 판매글의 리뷰 갯수 카운트
	public int getArticleCount(int num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x=0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from review where pr_num=?");
			pstmt.setInt(1, num);
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
	
	//판매글의 리뷰목록 불러오기
	public List getArticles(int prnum, int start, int end) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List articleList=null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					" select r_num,r_name,r_s_curr,r_s_pre,r_s_tk,r_s_deli,r_s_kind,r_re,r_reg,pr_num,r "
					+ " from (select r_num,r_name,r_s_curr,r_s_pre,r_s_tk,r_s_deli,r_s_kind,r_re,r_reg,pr_num,rownum r "
					+ " from (select * from review where pr_num=? order by r_reg desc)"
					+ " order by r_reg desc) where r>=? and r<=? ");
			pstmt.setInt(1, prnum);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
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
						article.setPr_num(rs.getInt("pr_num"));
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
	
	//리뷰 내용 불러오기
	public reviewVO getArticle(int num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		reviewVO article=null;
		try {
			conn = getConnection();
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
				article.setPr_num(rs.getInt("pr_num"));
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
	
	//리뷰글 불러오기
	public reviewVO updateGetArticle(int num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		reviewVO article=null;
		try {
			conn = getConnection();
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
				article.setPr_num(rs.getInt("pr_num"));
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

	//리뷰 수정하기
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
	
	//리뷰 삭제하기
	public int deleteArticle(int num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		int x=-1;
		try {
			conn = getConnection();
					pstmt = conn.prepareStatement("delete from review where r_num=?");
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
	
	//판매글에 현재 계정이 리뷰를 작성했는지 확인
	public int checkArticle(int prnum, String id) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int check = -1;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					" select count (*) from (select * from review where pr_num=?) "
					+ " where r_name=? "); 
			pstmt.setInt(1, prnum);
			pstmt.setString(2, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				check = rs.getInt(1);
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return check;
	}
	
	//판매글에 현재 계정이 구매자인지 확인 - buy 테이블 이용
	public int buyCheck(int prnum, String id) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int bcheck = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					" select count (*) from (select * from buy where b_productnumber=?) "
					+ " where b_email=? "); 
			pstmt.setInt(1, prnum);
			pstmt.setString(2, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bcheck = rs.getInt(1);
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return bcheck;
	}
	
	//판매글의 리뷰 갯수 확인 (페이지설정용)
	public int reviewCount(int num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int rcount = -1;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count (*) from review where pr_num=?"); 
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				rcount = rs.getInt(1);
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return rcount;
	}
	
	//리뷰 별점 평균, 소수점 1자리
	public double avgScore(int num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		double avg = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					" select round(avg(avg),1) from (select pr_num, "
					+ " (r_s_curr+r_s_pre+r_s_tk++r_s_deli+r_s_kind)/5 as avg from review where pr_num=?)");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				avg = rs.getDouble(1); //첫번째 컬럼 값
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return avg; 
	}
	
}