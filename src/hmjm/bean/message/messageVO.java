package hmjm.bean.message;
import java.sql.Timestamp;
public class messageVO {
	private int s_num;
	private int s_count;
	private String s_content;
	private Timestamp s_reg;
	private String s_send;
	private String s_receive;
	
	public int getS_num() {
		return s_num;
	}
	public void setS_num(int s_num) {
		this.s_num = s_num;
	}
	public int getS_count() {
		return s_count;
	}
	public void setS_count(int s_count) {
		this.s_count = s_count;
	}
	public String getS_content() {
		return s_content;
	}
	public void setS_content(String s_content) {
		this.s_content = s_content;
	}
	public Timestamp getS_reg() {
		return s_reg;
	}
	public void setS_reg(Timestamp s_reg) {
		this.s_reg = s_reg;
	}
	public String getS_send() {
		return s_send;
	}
	public void setS_send(String s_send) {
		this.s_send = s_send;
	}
	public String getS_receive() {
		return s_receive;
	}
	public void setS_receive(String s_receive) {
		this.s_receive = s_receive;
	}
	
	
}
