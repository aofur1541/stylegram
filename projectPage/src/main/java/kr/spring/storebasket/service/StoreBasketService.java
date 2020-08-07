package kr.spring.storebasket.service;

import java.util.List;
import java.util.Map;

import kr.spring.store.domain.StoreVO;
import kr.spring.storebasket.domain.StoreBasketVO;

public interface StoreBasketService {
	public void insert(StoreBasketVO basketVO);
	public void delete(int p_num);
	public List<StoreVO> selectBasketList(Map<String, Object> map);

}
