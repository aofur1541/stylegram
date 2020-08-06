package kr.spring.storereview.service;

import java.util.List;
import java.util.Map;

import kr.spring.storereview.domain.StoreReviewVO;

public interface StoreReviewService {
	public void insert (StoreReviewVO review);
	public int selectReviewCount(int s_num);
	public List<StoreReviewVO> selectReviewList(Map<String,Object> map);
	public StoreReviewVO selectReview (int sr_num);
	public void updateReview (StoreReviewVO reviewVO);
	public void deleteReview (int sr_num);
}
