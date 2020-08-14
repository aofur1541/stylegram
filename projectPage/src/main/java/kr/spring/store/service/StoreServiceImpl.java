package kr.spring.store.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.spring.store.dao.StoreMapper;
import kr.spring.store.domain.StoreVO;

@Service("storeService")
public class StoreServiceImpl implements StoreService{
	
	@Resource
	private StoreMapper storeMapper;

	@Override
	public void insert(StoreVO store) {
		storeMapper.insert(store);
	}

	@Override
	public int selectProductCount() {
		return storeMapper.selectProductCount();
	}
 
	@Override
	public List<StoreVO> selectProductList() {
		return storeMapper.selectProductList();
	}

	@Override
	public StoreVO selectProduct(Integer num) {
		return storeMapper.selectProduct(num);
	}

	@Override
	public StoreVO selectProductDetail(Integer num) {
		return storeMapper.selectProductDetail(num);
	}

	@Override
	public void updateStarAvg(StoreVO store) {
		storeMapper.updateStarAvg(store);
	}

	@Override
	public StoreVO selectPurchaseProduct(Integer num) {
		return storeMapper.selectPurchaseProduct(num);
	}

	@Override
	public List<StoreVO> selectPurchaseList(Integer num) {
		return storeMapper.selectPurchaseList(num);
	}
}
