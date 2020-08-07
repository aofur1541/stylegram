package kr.spring.storebasket.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.spring.store.domain.StoreVO;
import kr.spring.storebasket.domain.StoreBasketVO;

public interface StoreBasketMapper {
	
	@Insert("INSERT INTO prostorebasket VALUES (prostorebasket_seq.nextval,#{m_num}, #{s_num},#{a_num})") 
	public void insert(StoreVO storeVO);
	@Delete("DELETE FROM prostorebasket WHERE p_num=#{p_num}")
	public void delete(int p_num);
	@Select("SELECT * FROM (SELECT * FROM prostorebasket b JOIN prostore s on b.s_num = s.s_num) WHERE m_num=#{m_num}")
	public List<StoreVO> selectBasketList(Map<String, Object> map);

}
