package hmjm.bean.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import hmjm.bean.member.memberVO;

public class memberDAO {
	private static memberDAO instance = new memberDAO();
	public static memberDAO getInstance() {
		return instance;
	}
	private memberDAO() {}
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

	public void insertMember(memberVO vo) {
		try {
			conn = getConnection();
			String sql = "insert into member values(member_seq.nextval,?,?,?,1,sysdate,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getM_name());
			pstmt.setString(2, vo.getM_phone());
			pstmt.setString(3, vo.getM_email());
			//pstmt.setInt(4, vo.getM_usertype());
			//pstmt.setTimestamp(5, vo.getM_reg());
			pstmt.setString(4, vo.getM_pw());
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) {try {pstmt.close();}catch(SQLException s) {}}
			if(conn != null) {try {conn.close();}catch(SQLException s) {}}
		}
	}

	public boolean loginCheck(String m_email, String m_pw) {
		boolean result = false;
		try {
			conn = getConnection();
			String sql = "select * from member where m_email=? and m_pw=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_email);
			pstmt.setString(2, m_pw);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) {try {rs.close();}catch(SQLException e) {}}
			if(pstmt != null) {try {pstmt.close();}catch(SQLException e) {}}
			if(conn != null) {try {conn.close();}catch(SQLException e) {}}
		}
		return result;
	}

	public int confirmId(String m_email)
			throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpw="";
		int x=-1;

		try {
			conn = getConnection();

			pstmt = conn.prepareStatement(
					"select m_email from member where m_email = ?");
			pstmt.setString(1,m_email);
			rs= pstmt.executeQuery();

			if(rs.next())
				x= 1; //해당 아이디 있음
			else
				x= -1;//해당 아이디 없음		
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return x;
	}

	public memberVO getMember(String m_email)
			throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		memberVO vo = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select * from member where m_email = ?");
			pstmt.setString(1, m_email);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				vo = new memberVO();
				vo.setM_num(rs.getInt("m_num"));
				vo.setM_email(rs.getString("m_email"));
				vo.setM_pw(rs.getString("m_pw"));
				vo.setM_name(rs.getString("m_name"));
				vo.setM_phone(rs.getString("m_phone"));
				vo.setM_reg(rs.getTimestamp("m_reg"));
				vo.setM_usertype(rs.getInt("m_usertype"));
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

	public void updateMember(memberVO vo)// 회원정보수정 05.28create
			throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"update member set m_name=?,m_phone=?,m_pw=? "+
					"where m_email=?");
			pstmt.setString(1, vo.getM_name());
			pstmt.setString(2, vo.getM_phone());
			pstmt.setString(3, vo.getM_pw());
			pstmt.setString(4, vo.getM_email());
			pstmt.executeUpdate();

		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {

			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
	}

	/*	public ArrayList<memberVO> getAllMember(){
		ArrayList<memberVO> list = null;
		try {
			conn = getConnection();
			String sql = "select * from member";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			list = new ArrayList<memberVO>();
			while(rs.next()) {
				memberVO vo = new memberVO();
				vo.setM_email(rs.getString("m_email"));
				vo.setM_pw(rs.getString("m_pw"));
				vo.setM_name(rs.getString("m_name"));
				vo.setM_reg(rs.getTimestamp("m_reg"));
				vo.setM_usertype(rs.getInt("m_usertype"));
				list.add(vo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) {try {rs.close();}catch(SQLException e) {}}
			if(pstmt != null) {try {pstmt.close();}catch(SQLException e) {}}
			if(conn != null) {try {conn.close();}catch(SQLException e) {}}
		}
		return list;
	}

	public void updateMember(memberVO member) //일반회원에서 튜터로: 유저타입 1->2
    throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = getConnection();

            pstmt = conn.prepareStatement(
              "update member set m_usertype=2 where m_email=?");

            pstmt.setString(1, member.getM_email());

            pstmt.executeUpdate();
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
            if (conn != null) try { conn.close(); } catch(SQLException e) {}
        }
    }


    public int deleteMember(String m_email, String m_pw) //회원탈퇴1 (계정삭제)
    throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs= null;
        String dbpasswd="";
        int x=-1;
        try {
			conn = getConnection();

            pstmt = conn.prepareStatement("select m_pw from member where m_email=?");
            pstmt.setString(1, m_email);
            rs = pstmt.executeQuery();

			if(rs.next()){
				dbpasswd= rs.getString("pw"); 
				if(dbpasswd.equals(pw)){
					pstmt = conn.prepareStatement(
            	      "delete from member where m_email=?");
                    pstmt.setString(1, m_email);
                    pstmt.executeUpdate();
					x= 1; //회원탈퇴 성공
				}else
					x= 0; //비밀번호 틀림
			}
        } catch(Exception e) {
            x.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException e) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
            if (conn != null) try { conn.close(); } catch(SQLException e) {}
        }
		return x;
    }


	public void updateMember0(memberVO member) //회원탈퇴2 (유저타입 0)
    throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = getConnection();

            pstmt = conn.prepareStatement(
              "update member set m_usertype=0 where m_email=?");

            pstmt.setString(1, member.getM_email());

            pstmt.executeUpdate();
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
            if (conn != null) try { conn.close(); } catch(SQLException e) {}
        }
    }

	 */



}




