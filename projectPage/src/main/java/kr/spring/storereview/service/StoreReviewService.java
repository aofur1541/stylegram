package kr.spring.storereview.service;

import java.util.List;

import kr.spring.storereview.domain.StoreReviewVO;

public interface StoreReviewService {
	public void insert (StoreReviewVO review);
	public int selectReviewCount();
	public List<StoreReviewVO> selectReviewList();
	public List<StoreReviewVO> selectStarAvarage();
}
