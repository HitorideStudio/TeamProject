/* 판매글에 남기는 리뷰게시판 VO */
package hmjm.bean.review;

import java.sql.Timestamp;

public class reviewVO {
	private int r_num; //리뷰글의 고유번호
	private String r_name; //리뷰 작성자 이름
	private int r_s_curr; //별점: 커리큘럼
	private int r_s_pre; //별점: 준비성
	private int r_s_tk; //별점: 시간준수
	private int r_s_deli; //별점: 전달력
	private int r_s_kind; //별점: 친절함
	private String r_re; //리뷰 본문
	private Timestamp r_reg; //리뷰작성시간
	private int pr_num; //상품 판매글의 시퀀스 번호를 저장
	
	public int getR_num() {
		return r_num;
	}
	public void setR_num(int r_num) {
		this.r_num = r_num;
	}
	public String getR_name() {
		return r_name;
	}
	public void setR_name(String r_name) {
		this.r_name = r_name;
	}
	public int getR_s_curr() {
		return r_s_curr;
	}
	public void setR_s_curr(int r_s_curr) {
		this.r_s_curr = r_s_curr;
	}
	public int getR_s_pre() {
		return r_s_pre;
	}
	public void setR_s_pre(int r_s_pre) {
		this.r_s_pre = r_s_pre;
	}
	public int getR_s_tk() {
		return r_s_tk;
	}
	public void setR_s_tk(int r_s_tk) {
		this.r_s_tk = r_s_tk;
	}
	public int getR_s_deli() {
		return r_s_deli;
	}
	public void setR_s_deli(int r_s_deli) {
		this.r_s_deli = r_s_deli;
	}
	public int getR_s_kind() {
		return r_s_kind;
	}
	public void setR_s_kind(int r_s_kind) {
		this.r_s_kind = r_s_kind;
	}
	public String getR_re() {
		return r_re;
	}
	public void setR_re(String r_re) {
		this.r_re = r_re;
	}
	public Timestamp getR_reg() {
		return r_reg;
	}
	public void setR_reg(Timestamp r_reg) {
		this.r_reg = r_reg;
	}
	public int getPr_num() {
		return pr_num;
	}
	public void setPr_num(int pr_num) {
		this.pr_num = pr_num;
	}
	
	
}
