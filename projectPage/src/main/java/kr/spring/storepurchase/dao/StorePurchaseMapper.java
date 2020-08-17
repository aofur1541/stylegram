package kr.spring.storepurchase.dao;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;

import kr.spring.storepurchase.domain.StorePurchaseVO;

public interface StorePurchaseMapper {
	@Insert("INSERT INTO prostorepurchase (p_num,s_num,m_num,a_num,p_name,p_post,p_address,p_detailaddress,p_phone,p_shipdate,p_shipcost) VALUES (prostorepurchase_seq.nextval,#{s_num},#{m_num},#{a_num},#{p_name},#{p_post},#{p_address},#{p_detailaddress},#{p_phone},sysdate+2,#{p_shipcost})")
	@SelectKey(statement="select prostorepurchase_seq.nextval from dual", keyProperty="p_num", before=true, resultType=int.class)
	public void insert (StorePurchaseVO store);
	@Select("SELECT COUNT(*) FROM prostorepurchase WHERE m_num=#{m_num}")
	public int selectPurchaseCount(Integer num);
	@Select("SELECT * FROM prostorepurchase p JOIN prostore s ON p.s_num=s.s_num WHERE m_num=#{m_num} ORDER BY p_num DESC")
	public List<StorePurchaseVO> selectPurchaseList(Integer num);
	@Select("SELECT * FROM prostorepurchase p JOIN prostore s ON p.s_num = s.s_num WHERE p_num=#{p_num}")
	public StorePurchaseVO selectPurchase(Integer num);
	@Select("SELECT sysdate From dual")
	public Date selectToday();
	@Select("SELECT COUNT(*) FROM prostorepurchase WHERE s_num=#{s_num} AND m_num=#{m_num}")
	public int selectPurchaseMCount(HashMap<String,Integer> purchaseMCount);
}
 