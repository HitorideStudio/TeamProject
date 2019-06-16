package hmjm.bean.classimg;
/* kk */

public class classimgVO {
	private int ci_num;			//고유넘버(순서를 위함)_시퀀스
	private int ci_classnum;	//수업번호(p_num)	
	private String ci_name;		//사용자가 등록한 이미지 이름
	private String ci_realname;		//저장될 이름(중복처리)
	
	public int getCi_num() {
		return ci_num;
	}
	public void setCi_num(int ci_num) {
		this.ci_num = ci_num;
	}
	public int getCi_classnum() {
		return ci_classnum;
	}
	public void setCi_classnum(int ci_classnum) {
		this.ci_classnum = ci_classnum;
	}
	public String getCi_name() {
		return ci_name;
	}
	public void setCi_name(String ci_name) {
		this.ci_name = ci_name;
	}
	public String getCi_realname() {
		return ci_realname;
	}
	public void setCi_realname(String ci_realname) {
		this.ci_realname = ci_realname;
	}
	
	
}
