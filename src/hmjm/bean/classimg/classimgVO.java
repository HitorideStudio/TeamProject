package hmjm.bean.classimg;
/* 성민 */

public class classimgVO {
	private int ci_num;			//고유넘버(순서를 위함)_시퀀스
	private int ci_classnum;	//수업번호(p_num)	
	private String ci_img;		//이미지 경로
	
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
	public String getCi_img() {
		return ci_img;
	}
	public void setCi_img(String ci_img) {
		this.ci_img = ci_img;
	}
	
	
}
