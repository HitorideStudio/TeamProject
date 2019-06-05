package hmjm.bean.member;

import java.sql.Timestamp;

public class memberVO {
	private int m_num;
	//private String m_nick;	//tutorø° ≥÷¿Ω
	private String m_name;
	private String m_phone;
	private String m_email;
	private int m_usertype;
	private Timestamp m_reg;
	private String m_pw;

	public int getM_num() {
		return m_num;
	}
	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_phone() {
		return m_phone;
	}
	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public int getM_usertype() {
		return m_usertype;
	}
	public void setM_usertype(int m_usertype) {
		this.m_usertype = m_usertype;
	}
	public Timestamp getM_reg() {
		return m_reg;
	}
	public void setM_reg(Timestamp m_reg) {
		this.m_reg = m_reg;
	}
	public String getM_pw() {
		return m_pw;
	}
	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}
	
}
