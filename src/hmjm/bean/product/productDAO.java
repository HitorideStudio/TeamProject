package hmjm.bean.product;
/* 건훈수정 */
import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


import hmjm.bean.product.*;



public class productDAO {
	public static productDAO instance = new productDAO();
	public static productDAO getInstance() {
		return instance;
	}

	private productDAO() {};

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	private Connection getConnection() {
		try {
			Context ctx = new InitialContext(); //context.xml. 정보 획득
			Context env = (Context)ctx.lookup("java:comp/env"); //ctx에서 java의 환경설정요소만 획득
			DataSource ds = (DataSource)env.lookup("jdbc/xe"); //커넥션 객체
			conn = ds.getConnection();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	/*
	private int p_num;			//수업 고유번호(순서)
	private String p_email;		//튜터의 이메일	-가져올것
	private String p_category;	//등록 상품(수업)의 카테고리
	private String p_classname;	//등록 상품(수업)의 이름
	private String p_self;		//튜터의 자기 소개
	private String p_class1;	//소개_튜터소개
	private String p_class2;	//소개_튜터소개
	private String p_class3;	//소개_튜터소개
	private String p_class4;	//소개_튜터소개
	private String p_time;		//수업 소요 시간
	private int p_cost;		//가격
	private int p_count_min;	//인원 최소 인원
	private int p_count_max;	//인원 최대 인원
	private String p_memo;		//덧 붙이는 말
	private String imgsrc;		//이미지파일을 가져오기위한 변수 추가 작성
	 */

	//작성한 수업 등록 글 DB에 삽입
	public void insertProduct(productVO product) {	    
		try {
			conn = getConnection(); 
			//pstmt = conn.prepareStatement("select max(num) from board");
			//rs = pstmt.executeQuery();

			String sql = "insert into product values(product_seq.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?)"; 
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, product.getP_email());
			pstmt.setString(2, product.getP_category());
			pstmt.setString(3, product.getP_classname());
			pstmt.setString(4, product.getP_self());
			pstmt.setInt(5, product.getP_time());
			pstmt.setInt(6, product.getP_cost());
			pstmt.setString(7, product.getP_memo());
			pstmt.setInt(8, product.getP_count_min());
			pstmt.setInt(9, product.getP_count_max());
			pstmt.setString(10, product.getP_class1());
			pstmt.setString(11, product.getP_class1());
			pstmt.setString(12, product.getP_class3());
			pstmt.setString(13, product.getP_class4());
			pstmt.executeUpdate();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			//if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
	}
	public productVO getProducts(String p_email)
			throws Exception{
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				productVO vo = null;
				try {
					conn = getConnection();
					pstmt = conn.prepareStatement(
					"select * from product where p_email = ?");
					pstmt.setString(1, p_email);
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						vo = new productVO();
						vo.setP_num(rs.getInt("p_num"));
						vo.setP_email(rs.getString("p_email"));
						vo.setP_category(rs.getString("p_category"));
						vo.setP_classname(rs.getString("p_classname"));
						vo.setP_self(rs.getString("p_self"));
						vo.setP_time(rs.getInt("p_time"));
						vo.setP_cost(rs.getInt("p_cost"));
						vo.setP_memo(rs.getString("p_memo"));
						vo.setP_count_min(rs.getInt("p_count_min"));
						vo.setP_count_max(rs.getInt("p_count_max"));
						vo.setP_class1(rs.getString("p_class1"));
						vo.setP_class2(rs.getString("p_class2"));
						vo.setP_class3(rs.getString("p_class3"));
						vo.setP_class4(rs.getString("p_class4"));
						
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

public productVO getProduct(int p_num)
		throws Exception{
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			productVO vo = null;
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(
				"select * from product where p_num = ?");
				pstmt.setInt(1, p_num);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					vo = new productVO();
					vo.setP_num(rs.getInt("p_num"));
					vo.setP_email(rs.getString("p_email"));
					vo.setP_category(rs.getString("p_category"));
					vo.setP_classname(rs.getString("p_classname"));
					vo.setP_self(rs.getString("p_self"));
					vo.setP_time(rs.getInt("p_time"));
					vo.setP_cost(rs.getInt("p_cost"));
					vo.setP_memo(rs.getString("p_memo"));
					vo.setP_count_min(rs.getInt("p_count_min"));
					vo.setP_count_max(rs.getInt("p_count_max"));
					vo.setP_class1(rs.getString("p_class1"));
					vo.setP_class2(rs.getString("p_class2"));
					vo.setP_class3(rs.getString("p_class3"));
					vo.setP_class4(rs.getString("p_class4"));
					
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
//해당 번호의 수업 정보를 가져온다. _현재  파라미터 이메일로 함, 추후 p_num으로 변경할 것 -..?
		//e_mail로 정보 꺼내고 있는 중
	public productVO getProduct2(String p_email)
			throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		productVO vo = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select * from product where p_email = ?");
			pstmt.setString(1, p_email);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				vo = new productVO();
				vo.setP_num(rs.getInt("p_num"));
				vo.setP_email(rs.getString("p_email"));
				vo.setP_category(rs.getString("p_category"));
				vo.setP_classname(rs.getString("p_classname"));
				vo.setP_self(rs.getString("p_self"));
				vo.setP_time(rs.getInt("p_time"));
				vo.setP_cost(rs.getInt("p_cost"));
				vo.setP_memo(rs.getString("p_memo"));
				vo.setP_count_min(rs.getInt("p_count_min"));
				vo.setP_count_max(rs.getInt("p_count_max"));
				vo.setP_class1(rs.getString("p_class1"));
				vo.setP_class2(rs.getString("p_class2"));
				vo.setP_class3(rs.getString("p_class3"));
				vo.setP_class4(rs.getString("p_class4"));

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

//저장된 전체 글의 수를 얻어냄
	public int getProductCount() throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x=0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from product");
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
	
	//최종 시퀀스 값 검색하기_ok
		public int getProductNum() {
			int x = 0;

			try {
				conn = getConnection();

				String sql ="select last_number from user_sequences where sequence_name=upper('product_seq')";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();

				if(rs.next()) {
					x = rs.getInt(1);	//첫번째 컬럼 값 꺼내기(1부터 시작하기때문)
				}
			} catch(Exception ex) {
				ex.printStackTrace();
			} finally {
				if (rs != null) try { rs.close(); } catch(SQLException ex) {}
				if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
				if (conn != null) try { conn.close(); } catch(SQLException ex) {}
			}
			return x-1;	//최종 시퀀스 값은 +1된 값이 나오기 때문에 1을 빼줌
		}
	
	
	
	
	
	
public List getProduct(int start, int end) throws Exception {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	List productList=null;
	try {
		conn = getConnection();
		pstmt = conn.prepareStatement(
				"select * from product order by p_num desc,?,?");
		pstmt.setInt(1, start); 
		pstmt.setInt(2, end);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					productList = new ArrayList(end); 
					do{ 
						productVO vo= new productVO();
						vo.setP_num(rs.getInt("p_num"));
						vo.setP_email(rs.getString("p_email"));
						vo.setP_category(rs.getString("p_category"));
						vo.setP_classname(rs.getString("p_classname"));
						vo.setP_self(rs.getString("p_self"));
						vo.setP_time(rs.getInt("p_time"));
						vo.setP_cost(rs.getInt("p_cost"));
						vo.setP_memo(rs.getString("p_memo"));
						vo.setP_count_min(rs.getInt("p_count_min"));
						vo.setP_count_max(rs.getInt("p_count_max"));
						vo.setP_class1(rs.getString("p_class1"));
						vo.setP_class2(rs.getString("p_class2"));
						vo.setP_class3(rs.getString("p_class3"));
						vo.setP_class4(rs.getString("p_class4"));
						productList.add(vo);
					}while(rs.next());
				}
	} catch(Exception ex) {
		ex.printStackTrace();
	} finally {
		if (rs != null) try { rs.close(); } catch(SQLException ex) {}
		if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
		if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	}

	
	return productList;
	}
}