package kr.spring.store.domain;

import java.io.IOException;
import java.sql.Date;
import java.util.Arrays;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class StoreVO {
	private int s_num;				//상품번호
	@NotEmpty
	private String s_title;			//상품이름
	private int s_usernum;			//작성자번호(관리자)
	private MultipartFile upload;	//업로드를 위한 MultipartFile 변수
	private MultipartFile dupload;	//업로드를 위한 MultipartFile 변수(상품상세이미지)
	private MultipartFile dupload2;	//업로드를 위한 MultipartFile 변수(상품상세이미지)
	private MultipartFile dupload3;	//업로드를 위한 MultipartFile 변수(상품상세이미지)
	private byte[] s_photo;         //사진파일
	private byte[] ds_photo;        //사진파일(상품상세이미지)
	private byte[] ds_photo2;       //사진파일(상품상세이미지)
	private byte[] ds_photo3;       //사진파일(상품상세이미지)
	private String filename;		//파일명
	private String dfilename;		//파일명(상품상세이미지)
	private String dfilename2;		//파일명(상품상세이미지)
	private String dfilename3;		//파일명(상품상세이미지)
	private int s_price;			//상품가격
	private int s_discount;			//할인율
	private String s_content;		//상품상세정보
	private Date s_regdate;			//상품등록일
	private int mdpick;				//MD추천 여부
	private int staravg;			//별점 평균값
	private int s_ship;				//배송비 유무 여부
	private int s_shipcost;			//배송비
	private Date shipdate;			//배송예정일
	private int p_num;				//장바구니 번호
	private int a_num;				//구매 수량
	private int m_num;				//회원 번호
	private String goCheck;			//장바구니 이동 유무
	private String p_nums;
	

	public void setUpload(MultipartFile upload)throws IOException {
		this.upload = upload;
		//byte[]로 변환
		setS_photo(upload.getBytes());
		//파일명 구하기
		setFilename(upload.getOriginalFilename());
	}
	public void setDupload(MultipartFile dupload)throws IOException {
		this.dupload = dupload;
		setDs_photo(dupload.getBytes());
		setDfilename(dupload.getOriginalFilename());
	}
	
	public void setDupload2(MultipartFile dupload2)throws IOException {
		this.dupload2 = dupload2;
		setDs_photo2(dupload2.getBytes());
		setDfilename2(dupload2.getOriginalFilename());
	}
	
	public void setDupload3(MultipartFile dupload3)throws IOException {
		this.dupload3 = dupload3;
		setDs_photo3(dupload3.getBytes());
		setDfilename3(dupload3.getOriginalFilename());
	}
	
	public byte[] getDs_photo2() {
		return ds_photo2;
	}
	public void setDs_photo2(byte[] ds_photo2) {
		this.ds_photo2 = ds_photo2;
	}
	public byte[] getDs_photo3() {
		return ds_photo3;
	}
	public void setDs_photo3(byte[] ds_photo3) {
		this.ds_photo3 = ds_photo3;
	}
	public String getDfilename2() {
		return dfilename2;
	}

	public void setDfilename2(String dfilename2) {
		this.dfilename2 = dfilename2;
	}

	public String getDfilename3() {
		return dfilename3;
	}

	public void setDfilename3(String dfilename3) {
		this.dfilename3 = dfilename3;
	}
	public int getS_discount() {
		return s_discount;
	}
	public void setS_discount(int s_discount) {
		this.s_discount = s_discount;
	}
	public byte[] getDs_photo() {
		return ds_photo;
	}
	public void setDs_photo(byte[] ds_photo) {
		this.ds_photo = ds_photo;
	}
	public String getDfilename() {
		return dfilename;
	}
	public void setDfilename(String dfilename) {
		this.dfilename = dfilename;
	}
	public int getS_num() {
		return s_num;
	}
	public void setS_num(int s_num) {
		this.s_num = s_num;
	}
	public String getS_title() {
		return s_title;
	}
	public void setS_title(String s_title) {
		this.s_title = s_title;
	}
	public int getS_usernum() {
		return s_usernum;
	}
	public void setS_usernum(int s_usernum) {
		this.s_usernum = s_usernum;
	}
	public byte[] getS_photo() {
		return s_photo;
	}
	public void setS_photo(byte[] s_photo) {
		this.s_photo = s_photo;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getS_price() {
		return s_price;
	}
	public void setS_price(int s_price) {
		this.s_price = s_price;
	}
	public String getS_content() {
		return s_content;
	}
	public void setS_content(String s_content) {
		this.s_content = s_content;
	}
	public Date getS_regdate() {
		return s_regdate;
	}
	public void setS_regdate(Date s_regdate) {
		this.s_regdate = s_regdate;
	}
	public int getMdpick() {
		return mdpick;
	}
	public void setMdpick(int mdpick) {
		this.mdpick = mdpick;
	}
	public int getStaravg() {
		return staravg;
	}
	public void setStaravg(int staravg) {
		this.staravg = staravg;
	}
	public Date getShipdate() {
		return shipdate;
	}
	public void setShipdate(Date shipdate) {
		this.shipdate = shipdate;
	}	
	public int getS_ship() {
		return s_ship;
	}
	public void setS_ship(int s_ship) {
		this.s_ship = s_ship;
	}
	public int getS_shipcost() {
		return s_shipcost;
	}
	public void setS_shipcost(int s_shipcost) {
		this.s_shipcost = s_shipcost;
	}
	public int getP_num() {
		return p_num;
	}
	public void setP_num(int p_num) {
		this.p_num = p_num;
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
	public String getGoCheck() {
		return goCheck;
	}
	public void setGoCheck(String goCheck) {
		this.goCheck = goCheck;
	}
	public String getP_nums() {
		return p_nums;
	}
	public void setP_nums(String p_nums) {
		this.p_nums = p_nums;
	}
	
	@Override
	public String toString() {
		return "StoreVO [s_num=" + s_num + ", s_title=" + s_title + ", s_usernum=" + s_usernum + ", upload=" + upload
				+ ", dupload=" + dupload + ", dupload2=" + dupload2 + ", dupload3=" + dupload3 + ", filename="
				+ filename + ", dfilename=" + dfilename + ", dfilename2=" + dfilename2 + ", dfilename3=" + dfilename3
				+ ", s_price=" + s_price + ", s_discount=" + s_discount + ", s_content=" + s_content + ", s_regdate="
				+ s_regdate + ", mdpick=" + mdpick + ", staravg=" + staravg + ", s_ship=" + s_ship + ", s_shipcost="
				+ s_shipcost + ", shipdate=" + shipdate + ", p_num=" + p_num + ", a_num=" + a_num + "]";
	}
}
