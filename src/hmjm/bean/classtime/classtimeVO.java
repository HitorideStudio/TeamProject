package hmjm.bean.classtime;
/*수업 시간 */

public class classtimeVO {
	private int ct_num;			//수업시간 테이블 번호(순서_시퀀스)
	private int ct_classnum;	//수업번호(고유번호)
	private String ct_place;	//수업 장소
	private String ct_mon;		//월요일: 가능 시간
	private String ct_tue;		//화요일: 가능 시간
	private String ct_wed;		//수요일: 가능 시간
	private String ct_thu;		//목요일: 가능 시간
	private String ct_fri;		//금요일: 가능 시간
	private String ct_sta;		//토요일: 가능 시간
	private String ct_sun;		//일요일: 가능 시간
	private String ct_day;		//가능 날짜
	
	public int getCt_num() {
		return ct_num;
	}
	public void setCt_num(int ct_num) {
		this.ct_num = ct_num;
	}
	public int getCt_classnum() {
		return ct_classnum;
	}
	public void setCt_classnum(int ct_classnum) {
		this.ct_classnum = ct_classnum;
	}
	public String getCt_place() {
		return ct_place;
	}
	public void setCt_place(String ct_place) {
		this.ct_place = ct_place;
	}
	public String getCt_mon() {
		return ct_mon;
	}
	public void setCt_mon(String ct_mon) {
		this.ct_mon = ct_mon;
	}
	public String getCt_tue() {
		return ct_tue;
	}
	public void setCt_tue(String ct_tue) {
		this.ct_tue = ct_tue;
	}
	public String getCt_wed() {
		return ct_wed;
	}
	public void setCt_wed(String ct_wed) {
		this.ct_wed = ct_wed;
	}
	public String getCt_thu() {
		return ct_thu;
	}
	public void setCt_thu(String ct_thu) {
		this.ct_thu = ct_thu;
	}
	public String getCt_fri() {
		return ct_fri;
	}
	public void setCt_fri(String ct_fri) {
		this.ct_fri = ct_fri;
	}
	public String getCt_sta() {
		return ct_sta;
	}
	public void setCt_sta(String ct_sta) {
		this.ct_sta = ct_sta;
	}
	public String getCt_sun() {
		return ct_sun;
	}
	public void setCt_sun(String ct_sun) {
		this.ct_sun = ct_sun;
	}
	public String getCt_day() {
		return ct_day;
	}
	public void setCt_day(String ct_day) {
		this.ct_day = ct_day;
	}
	
	
}
