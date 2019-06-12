package hmjm.bean.classimg;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import hmjm.bean.classimg.classimgVO;

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
	
	//(상품 등록 내에서)이미지 등록하기_ing
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
	
	//(해당 상품번호의) 이미지 정보(상품번호,이미지경로) 꺼내기_미완성
	
	
	//이미지 삭제
	
	//이미지 수정

}
