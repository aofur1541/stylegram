package kr.spring.storebasket.service;

import kr.spring.storebasket.domain.StoreBasketVO;

public interface StoreBasketService {
	public void insert(StoreBasketVO basketVO);
	public void delete(StoreBasketVO basketVO);
}
