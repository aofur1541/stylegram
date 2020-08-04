package kr.spring.qna.domain;

import java.io.IOException;
import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class QnaVO {

	//PROQNABOARD
	private int qb_num;
	private String qb_title;
	private int qb_usernum;
	private MultipartFile upload;
	private byte[] qb_photo;
	private String qb_filename;
	private String qb_content;
	private Date qb_regdate;
	private Date qb_modifydate;
	//PROQNAINFO
	private int qn_num;
	private int qb_topinfo;
	private	int qb_bottominfo;
	private	int qb_hatinfo;
	private	int qb_shoseinfo;
	//PROQNAREPLE
	private int qr_num;
	private	int m_num;
	private String qr_id;
	private	String qr_content;
	private	Date qr_regdate;
	//PROMEMBER
	private String m_id;
	private String m_nickname;
	
	public void setUpload(MultipartFile upload) throws IOException {
		this.upload = upload;
		setQb_photo(upload.getBytes());
		setQb_filename(upload.getOriginalFilename());
	}
	public int getQb_num() {
		return qb_num;
	}
	public void setQb_num(int qb_num) {
		this.qb_num = qb_num;
	}
	public String getQb_title() {
		return qb_title;
	}
	public void setQb_title(String qb_title) {
		this.qb_title = qb_title;
	}
	public int getQb_usernum() {
		return qb_usernum;
	}
	public void setQb_usernum(int qb_usernum) {
		this.qb_usernum = qb_usernum;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	
	public byte[] getQb_photo() {
		return qb_photo;
	}
	public void setQb_photo(byte[] qb_photo) {
		this.qb_photo = qb_photo;
	}
	public String getQb_filename() {
		return qb_filename;
	}
	public void setQb_filename(String qb_filename) {
		this.qb_filename = qb_filename;
	}
	public String getQb_content() {
		return qb_content;
	}
	public void setQb_content(String qb_content) {
		this.qb_content = qb_content;
	}
	public Date getQb_regdate() {
		return qb_regdate;
	}
	public void setQb_regdate(Date qb_regdate) {
		this.qb_regdate = qb_regdate;
	}
	public Date getQb_modifydate() {
		return qb_modifydate;
	}
	public void setQb_modifydate(Date qb_modifydate) {
		this.qb_modifydate = qb_modifydate;
	}
	public int getQn_num() {
		return qn_num;
	}
	public void setQn_num(int qn_num) {
		this.qn_num = qn_num;
	}
	public int getQb_topinfo() {
		return qb_topinfo;
	}
	public void setQb_topinfo(int qb_topinfo) {
		this.qb_topinfo = qb_topinfo;
	}
	public int getQb_bottominfo() {
		return qb_bottominfo;
	}
	public void setQb_bottominfo(int qb_bottominfo) {
		this.qb_bottominfo = qb_bottominfo;
	}
	public int getQb_hatinfo() {
		return qb_hatinfo;
	}
	public void setQb_hatinfo(int qb_hatinfo) {
		this.qb_hatinfo = qb_hatinfo;
	}
	public int getQb_shoseinfo() {
		return qb_shoseinfo;
	}
	public void setQb_shoseinfo(int qb_shoseinfo) {
		this.qb_shoseinfo = qb_shoseinfo;
	}
	public int getQr_num() {
		return qr_num;
	}
	public void setQr_num(int qr_num) {
		this.qr_num = qr_num;
	}
	public int getM_num() {
		return m_num;
	}
	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	public String getQr_id() {
		return qr_id;
	}
	public void setQr_id(String qr_id) {
		this.qr_id = qr_id;
	}
	public String getQr_content() {
		return qr_content;
	}
	public void setQr_content(String qr_content) {
		this.qr_content = qr_content;
	}
	public Date getQr_regdate() {
		return qr_regdate;
	}
	public void setQr_regdate(Date qr_regdate) {
		this.qr_regdate = qr_regdate;
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
		return "QnaVO [qb_num=" + qb_num + ", qb_title=" + qb_title + ", qb_usernum=" + qb_usernum + ", upload="
				+ upload + ", qb_filename=" + qb_filename + ", qb_content=" + qb_content + ", qb_regdate=" + qb_regdate
				+ ", qb_modifydate=" + qb_modifydate + ", qn_num=" + qn_num + ", qb_topinfo=" + qb_topinfo
				+ ", qb_bottominfo=" + qb_bottominfo + ", qb_hatinfo=" + qb_hatinfo + ", qb_shoseinfo=" + qb_shoseinfo
				+ ", qr_num=" + qr_num + ", m_num=" + m_num + ", qr_id=" + qr_id + ", qr_content=" + qr_content
				+ ", qr_regdate=" + qr_regdate + "]";
	}
}	
	