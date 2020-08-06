package kr.spring.storereview.domain;

import java.sql.Date;

public class StoreReviewVO {
	private int sr_num;				//리뷰 관리용 고유번호
	private int m_num;				//회원번호
	private String sr_content;		//리뷰 내용
	private Date sr_regdate;		//리뷰 등록일
	private int s_num;				//상품번호
	private int sr_star;			//별점
	
	private String m_id;
	private String m_nickname;

	public int getSr_star() {
		return sr_star;
	}
	public void setSr_star(int sr_star) {
		this.sr_star = sr_star;
	}
	public int getSr_num() {
		return sr_num;
	}
	public void setSr_num(int sr_num) {
		this.sr_num = sr_num;
	}
	public int getS_num() {
		return s_num;
	}
	public void setS_num(int s_num) {
		this.s_num = s_num;
	}
	public int getM_num() {
		return m_num;
	}
	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	public String getSr_content() {
		return sr_content;
	}
	public void setSr_content(String sr_content) {
		this.sr_content = sr_content;
	}
	public Date getSr_regdate() {
		return sr_regdate;
	}
	public void setSr_regdate(Date sr_regdate) {
		this.sr_regdate = sr_regdate;
	}
	
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_nickname() {
		return m_nickname;
	}
	public void setM_nickname(String m_nickname) {
		this.m_nickname = m_nickname;
	}
	@Override
	public String toString() {
		return "StoreReviewVO [sr_num=" + sr_num + ", s_num=" + s_num + ", m_num=" + m_num + ", sr_content="
				+ sr_content + ", sr_regdate=" + sr_regdate + ", getSr_num()=" + getSr_num() + ", getS_num()="
				+ getS_num() + ", getM_num()=" + getM_num() + ", getSr_content()=" + getSr_content()
				+ ", getSr_regdate()=" + getSr_regdate() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}

}
