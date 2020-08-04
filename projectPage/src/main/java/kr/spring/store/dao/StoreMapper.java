package kr.spring.store.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.spring.store.domain.StoreVO;

public interface StoreMapper {
	@Insert("INSERT INTO prostore (s_num,s_title,s_photo,filename,ds_photo,dfilename,ds_photo2,dfilename2,ds_photo3,dfilename3,s_price,s_discount,s_content,mdpick) VALUES (prostore_seq.nextval,#{s_title},#{s_photo},#{filename},#{ds_photo},#{dfilename},#{ds_photo2},#{dfilename2},#{ds_photo3},#{dfilename3},#{s_price},#{s_discount},#{s_content},#{mdpick})")
	public void insert (StoreVO store);
	public int selectProductCount();
	public List<StoreVO> selectProductList();
	@Select("SELECT * FROM prostore WHERE s_num=#{s_num}")
	public StoreVO selectProduct(Integer num);
	public StoreVO selectProductDetail(Integer num);
}
