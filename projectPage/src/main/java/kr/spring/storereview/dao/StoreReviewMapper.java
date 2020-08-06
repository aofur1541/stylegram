package kr.spring.storereview.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.storereview.domain.StoreReviewVO;

public interface StoreReviewMapper {
	@Insert("INSERT INTO prostorereview (sr_num,m_num,sr_content,s_num,sr_star) VALUES (prostorereview_seq.nextval,#{m_num},#{sr_content},#{s_num},#{sr_star})")
	public void insert (StoreReviewVO review);
	public int selectReviewCount(int s_num);
	public List<StoreReviewVO> selectReviewList(Map<String,Object> map);
	@Select("SELECT * FROM prostorereview r JOIN PROMEMBER m on r.m_num=m.m_num WHERE sr_num=#{sr_num}")
	public StoreReviewVO selectReview (int sr_num);
	@Update("UPDATE prostorereview set sr_content = #{sr_content} WHERE sr_num=#{sr_num}")
	public void updateReview (StoreReviewVO reviewVO);
	@Delete("DELETE FROM prostorereview WHERE sr_num=#{sr_num}")
	public void deleteReview (int sr_num);
}
