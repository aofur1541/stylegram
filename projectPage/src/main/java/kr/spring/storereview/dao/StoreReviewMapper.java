package kr.spring.storereview.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.spring.storereview.domain.StoreReviewVO;

public interface StoreReviewMapper {
	@Insert("INSERT INTO prostorereview (sr_num,m_num,sr_content,s_num,sr_star) VALUES (prostorereview_seq.nextval,#{m_num},#{sr_content},#{s_num},#{sr_star})")
	public void insert (StoreReviewVO review);
	public int selectReviewCount();
	public List<StoreReviewVO> selectReviewList();
	public List<StoreReviewVO> selectStarAvarage();
}
