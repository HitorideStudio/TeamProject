package hmjm.bean.classimg;

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

import hmjm.bean.classimg.classimgVO;
import hmjm.bean.product.productVO;

public class classimgDAO {	/*성민 작성*/
	
	private static classimgDAO instance = new classimgDAO();
	
	public static classimgDAO getInstance() {
		return instance;
	
	}
	private classimgDAO() {}
	
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
	
	/*(상품 등록 내에서)이미지 등록하기_ing
	public void insertClassimg(classimgVO classimg) {	      

	      String sql="";  
	      try {
	         conn = getConnection(); 
	        
	         sql = "insert into classimg values(classimg_seq.NEXTVAL,?,?)";
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, classimg.getCi_classnum());//수업번호를 가져와서 적용시키기.
	         pstmt.setString(2, classimg.getCi_img());
	         
	         pstmt.executeUpdate();
	      } catch(Exception ex) {
	         ex.printStackTrace();
	      } finally {
	         if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	         if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	         if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	      }
	   }
	*/
	
	//(상품 등록 내에서)이미지 등록하기_ok(version1)
	public void insertClassimg1(int classnum, String filename, String filerealname) {	      

			String sql="";  
			try {
			      conn = getConnection(); 
			        
			      sql = "insert into classimg values(classimg_seq.NEXTVAL,?,?,?)";
			      pstmt = conn.prepareStatement(sql);
			      pstmt.setInt(1, classnum);
			      pstmt.setString(2, filename);
			      pstmt.setString(3, filerealname);
			         
			      pstmt.executeUpdate();
			   } catch(Exception ex) {
			       ex.printStackTrace();
			   } finally {
			       if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			       if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			       if (conn != null) try { conn.close(); } catch(SQLException ex) {}
			     }
			  }
	
	//저장된 전체  사진의 수를 얻어냄
		public int getClassimgCount(int ci_classnum) throws Exception {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			int x=0;
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement("select count(*) from classimg where ci_classnum = ?");
				pstmt.setInt(1, ci_classnum);
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
	
	
	//(해당 상품번호의) 이미지 정보(상품번호,이미지경로) 꺼내기_미완성
	public List getClassimg(int cnum, int start, int end) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List classimgList=null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select ci_num,ci_classnum,ci_name,ci_realname,r"
					+" from (select ci_num,ci_classnum,ci_name,ci_realname,rownum r "
					+" from (select * from classimg where ci_classnum=? order by ci_num)"
					+" order by ci_num) where r>=? and r<=?");
			pstmt.setInt(1, cnum);
			pstmt.setInt(2, start); 
			pstmt.setInt(3, end);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				classimgList = new ArrayList(end); 
				do{ 
					classimgVO vo= new classimgVO();
					vo.setCi_num(rs.getInt("ci_num"));
					vo.setCi_classnum(rs.getInt("ci_classnum"));
					vo.setCi_name(rs.getString("ci_name"));
					vo.setCi_realname(rs.getString("ci_realname"));
					classimgList.add(vo);
				}while(rs.next());
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}

		return classimgList;
	}

	//이미지 불러오기
	public classimgVO getImg(int ci_classnum)
		throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		classimgVO vo = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select * from classimg where ci_classnum = ?");
			pstmt.setInt(1, ci_classnum);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo = new classimgVO();
				vo.setCi_name(rs.getString("ci_name"));
				vo.setCi_realname(rs.getString("ci_realname"));
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
	//이미지 삭제
	
	//이미지 수정


