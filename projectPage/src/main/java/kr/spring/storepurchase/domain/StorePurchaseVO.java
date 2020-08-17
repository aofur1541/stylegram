package kr.spring.storepurchase.domain;

import java.io.IOException;
import java.sql.Date;
import java.util.Arrays;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class StorePurchaseVO {
	private int p_num;				//구매이력 번호
	private int s_num;				//상품번호
	private Date p_regdate;			//구매한 상품 구매일
	private int a_num;				//구매 수량
	private int m_num;				//구매한 회원 번호
	@NotEmpty
	private String p_name;			//상품 받는 사람
	private int p_post;				//받는사람 우편번호
	@NotEmpty
	private String p_address;		//받는사람 주소
	private String p_detailaddress; //받는사람 상세주소
	private String p_phone;			//받는사람 연락처
	private Date p_shipdate;		//상품배송예정일
	private int p_shipcost;			//배송비
	
	public int getP_num() {
		return p_num;
	}
	public void setP_num(int p_num) {
		this.p_num = p_num;
	}
	public int getS_num() {
		return s_num;
	}
	public void setS_num(int s_num) {
		this.s_num = s_num;
	}
	public Date getP_regdate() {
		return p_regdate;
	}
	public void setP_regdate(Date p_regdate) {
		this.p_regdate = p_regdate;
	}
	public int getA_num() {
		return a_num;
	}
	public void setA_num(int a_num) {
		this.a_num = a_num;
	}
	public int getM_num() {
		return m_num;
	}
	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getP_post() {
		return p_post;
	}
	public void setP_post(int p_post) {
		this.p_post = p_post;
	}
	public String getP_address() {
		return p_address;
	}
	public void setP_address(String p_address) {
		this.p_address = p_address;
	}
	public String getP_detailaddress() {
		return p_detailaddress;
	}
	public void setP_detailaddress(String p_detailaddress) {
		this.p_detailaddress = p_detailaddress;
	}
	public String getP_phone() {
		return p_phone;
	}
	public void setP_phone(String p_phone) {
		this.p_phone = p_phone;
	}
	public Date getP_shipdate() {
		return p_shipdate;
	}
	public void setP_shipdate(Date p_shipdate) {
		this.p_shipdate = p_shipdate;
	}
	public int getP_shipcost() {
		return p_shipcost;
	}
	public void setP_shipcost(int p_shipcost) {
		this.p_shipcost = p_shipcost;
	}
	
	@Override
	public String toString() {
		return "StorePurchaseVO [p_num=" + p_num + ", s_num=" + s_num + ", p_regdate=" + p_regdate + ", a_num=" + a_num
				+ ", m_num=" + m_num + ", p_name=" + p_name + ", p_post=" + p_post + ", p_address=" + p_address
				+ ", p_detailaddress=" + p_detailaddress + ", p_phone=" + p_phone + ", p_shipdate=" + p_shipdate
				+ ", p_shipcost=" + p_shipcost + "]";
	}
	
}
