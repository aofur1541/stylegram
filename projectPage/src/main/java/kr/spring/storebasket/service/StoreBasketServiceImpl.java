package kr.spring.storebasket.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.spring.store.domain.StoreVO;
import kr.spring.storebasket.dao.StoreBasketMapper;
import kr.spring.storebasket.domain.StoreBasketVO;
import kr.spring.storepurchase.domain.StorePurchaseVO;

@Service("storeBasketService")
public class StoreBasketServiceImpl implements StoreBasketService{
	
	@Resource
	private StoreBasketMapper basketMapper;
	
	@Override
	public void insert(StoreVO storeVO) {
		// TODO Auto-generated method stub
		basketMapper.insert(storeVO);
	}

	@Override
	public void delete(int p_num) {
		// TODO Auto-generated method stub
		basketMapper.delete(p_num);
	}

	@Override
	public List<StoreVO> selectBasketList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return basketMapper.selectBasketList(map);
	}

	@Override
	public List<StoreVO> selectBasketPurchaseList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return basketMapper.selectBasketPurchaseList(map);
	}

	@Override
	public void insertPurchase(StorePurchaseVO storePurchaseVO) {
		// TODO Auto-generated method stub
		basketMapper.insertPurchase(storePurchaseVO);
	}

	@Override
	public StoreVO select(int p_num) {
		// TODO Auto-generated method stub
		return basketMapper.select(p_num);
	}

	@Override
	public int seleceBasketCount(int m_num) {
		// TODO Auto-generated method stub
		return basketMapper.seleceBasketCount(m_num);
	}
	

}
