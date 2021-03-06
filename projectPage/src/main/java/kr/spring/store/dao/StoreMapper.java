package kr.spring.store.dao;

import java.util.HashMap;
import java.util.List;


import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.store.domain.StoreVO;

public interface StoreMapper {
	@Insert("INSERT INTO prostore (s_num,s_title,s_photo,filename,ds_photo,dfilename,ds_photo2,dfilename2,ds_photo3,dfilename3,s_price,s_discount,s_content,mdpick) VALUES (prostore_seq.nextval,#{s_title},#{s_photo},#{filename},#{ds_photo},#{dfilename},#{ds_photo2},#{dfilename2},#{ds_photo3},#{dfilename3},#{s_price},#{s_discount},#{s_content},#{mdpick})")
	public void insert (StoreVO store);
	@Update("UPDATE prostore s SET staravg = (SELECT TRUNC((SUM(sr_star)/COUNT(*))) avg FROM prostorereview r WHERE s.s_num=r.s_num) WHERE s.s_num=#{s_num}")
	public void updateStarAvg (StoreVO store);
	@Update("UPDATE prostore s SET salesrate = salesrate+#{a_num} where s_num=#{s_num}")
	public void updateSalesRate(HashMap<String,Integer> salesRate);
	public int selectProductCount();
	public List<StoreVO> selectProductList();
	@Select("SELECT * FROM prostore WHERE s_num=#{s_num}")
	public StoreVO selectProduct(Integer num);
	public StoreVO selectProductDetail(Integer num);
	@Select("SELECT * FROM prostore s JOIN prostorepurchase p ON s.s_num=p.s_num WHERE p.p_num=#{p_num}")
	public StoreVO selectPurchaseProduct(Integer num);
	@Select("SELECT * FROM prostore s JOIN prostorepurchase p ON s.s_num=p.s_num WHERE m_num=#{m_num} ORDER BY p_num DESC")
	public List<StoreVO> selectPurchaseList(Integer num);
	public void update(StoreVO store); 
	@Select("SELECT MAX(salesrate) FROM prostore")
	public int selectSalesRate();
}
