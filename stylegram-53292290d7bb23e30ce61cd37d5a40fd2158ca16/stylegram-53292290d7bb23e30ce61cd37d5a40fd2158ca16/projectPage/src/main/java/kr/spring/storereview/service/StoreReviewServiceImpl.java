package kr.spring.storereview.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.spring.storereview.dao.StoreReviewMapper;
import kr.spring.storereview.domain.StoreReviewVO;

@Service("storeReviewService")
public class StoreReviewServiceImpl implements StoreReviewService {

	@Resource
	private StoreReviewMapper storeReviewMapper;
	
	@Override
	public void insert(StoreReviewVO review) {
		storeReviewMapper.insert(review);
	}

	@Override
	public int selectReviewCount(int s_num) {
		// TODO Auto-generated method stub
		return storeReviewMapper.selectReviewCount(s_num);
	}

	@Override
	public List<StoreReviewVO> selectReviewList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return storeReviewMapper.selectReviewList(map);
	}

	@Override
	public StoreReviewVO selectReview(int sr_num) {
		return storeReviewMapper.selectReview(sr_num);
	}

	@Override
	public void updateReview(StoreReviewVO reviewVO) {
		// TODO Auto-generated method stub
		storeReviewMapper.updateReview(reviewVO);
	}

	@Override
	public void deleteReview(int sr_num) {
		// TODO Auto-generated method stub
		storeReviewMapper.deleteReview(sr_num);
	}


}
