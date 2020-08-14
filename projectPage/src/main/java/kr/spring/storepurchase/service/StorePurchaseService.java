package kr.spring.storepurchase.service;

import java.sql.Date;
import java.util.List;

import kr.spring.storepurchase.domain.StorePurchaseVO;

public interface StorePurchaseService {
	public void insert (StorePurchaseVO store);
	public int selectPurchaseCount(Integer num);
	public List<StorePurchaseVO> selectPurchaseList(Integer num);
	public StorePurchaseVO selectPurchase(Integer num);
	public Date selectToday();
}
 