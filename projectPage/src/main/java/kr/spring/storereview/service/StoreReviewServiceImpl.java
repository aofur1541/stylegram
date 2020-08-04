package kr.spring.storereview.service;

import java.util.List;

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
	public int selectReviewCount() {
		return storeReviewMapper.selectReviewCount();
	}

	@Override
	public List<StoreReviewVO> selectReviewList() {
		return storeReviewMapper.selectReviewList();
	}

}
