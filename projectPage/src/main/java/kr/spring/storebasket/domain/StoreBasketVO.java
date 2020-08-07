package kr.spring.storebasket.domain;

public class StoreBasketVO {
	private int p_num;
	private int m_num;
	private int s_num;
	private int a_num;
	
	public int getP_num() {
		return p_num;
	}
	public void setP_num(int p_num) {
		this.p_num = p_num;
	}
	public int getM_num() {
		return m_num;
	}
	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	public int getS_num() {
		return s_num;
	}
	public void setS_num(int s_num) {
		this.s_num = s_num;
	}
	public int getA_num() {
		return a_num;
	}
	public void setA_num(int a_num) {
		this.a_num = a_num;
	}
	
	@Override
	public String toString() {
		return "StoreBasketVO [m_num=" + m_num + ", s_num=" + s_num + "]";
	}
	
	
	
	
}
