package kr.spring.storepurchase.service;

import java.util.List;

import kr.spring.storepurchase.domain.StorePurchaseVO;

public interface StorePurchaseService {
	public void insert (StorePurchaseVO store);
	public int selectPurchaseCount();
	public List<StorePurchaseVO> selectPurchaseList(Integer num);
	public StorePurchaseVO selectPurchase(Integer num);
}
