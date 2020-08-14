package kr.spring.storebasket.service;

import java.util.List;
import java.util.Map;

import kr.spring.store.domain.StoreVO;
import kr.spring.storebasket.domain.StoreBasketVO;
import kr.spring.storepurchase.domain.StorePurchaseVO;

public interface StoreBasketService {
	public void insert(StoreVO storeVO);
	public void delete(int p_num);
	public List<StoreVO> selectBasketList(Map<String, Object> map);
	public List<StoreVO> selectBasketPurchaseList(Map<String, Object> map);
	public void insertPurchase(StorePurchaseVO storePurchaseVO);
	public StoreVO select(int p_num);
	public int seleceBasketCount(int m_num);

}
