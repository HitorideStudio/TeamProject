package hmjm.bean.tutor;

import java.sql.*;

public class tutorVO {
	private int t_num;
	private String t_nick;
	private String t_selfimg;
	private String t_school;
	private String t_major;
	private String t_idcard;
	private String t_c;
	private String t_email;
	private Timestamp t_reg;
	
	
	public String getT_email() {
		return t_email;
	}
	public void setT_email(String t_email) {
		this.t_email = t_email;
	}
	public void setT_nick(String t_nick) {
		this.t_nick = t_nick;
	}
	public int getT_num() {
		return t_num;
	}
	public void setT_num(int t_num) {
		this.t_num = t_num;
	}
	public String getT_nick() {
		return t_nick;
	}
	public void setT_num(String t_nick) {
		this.t_nick = t_nick;
	}
	public String getT_selfimg() {
		return t_selfimg;
	}
	public void setT_selfimg(String t_selfimg) {
		this.t_selfimg = t_selfimg;
	}
	public String getT_school() {
		return t_school;
	}
	public void setT_school(String t_school) {
		this.t_school = t_school;
	}
	public String getT_major() {
		return t_major;
	}
	public void setT_major(String t_major) {
		this.t_major = t_major;
	}
	public String getT_idcard() {
		return t_idcard;
	}
	public void setT_idcard(String t_idcard) {
		this.t_idcard = t_idcard;
	}
	public String getT_c() {
		return t_c;
	}
	public void setT_c(String t_c) {
		this.t_c = t_c;
	}
	public Timestamp getT_reg() {
		return t_reg;
	}
	public void setT_reg(Timestamp t_reg) {
		this.t_reg = t_reg;
	}
	
}
