package kr.spring.storebasket.dao;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;

import kr.spring.storebasket.domain.StoreBasketVO;

public interface StoreBasketMapper {
	
	@Insert("INSERT INTO prostorebasket VALUES (#{m_num}, #{s_num})") 
	public void insert(StoreBasketVO basketVO);
	@Delete("")
	public void delete(StoreBasketVO basketVO);

}
