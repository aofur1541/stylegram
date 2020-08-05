package kr.spring.storebasket.domain;

public class StoreBasketVO {
	private int m_num;
	private int s_num;
	
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
	@Override
	public String toString() {
		return "StoreBasketVO [m_num=" + m_num + ", s_num=" + s_num + "]";
	}
	
	
	
	
}
