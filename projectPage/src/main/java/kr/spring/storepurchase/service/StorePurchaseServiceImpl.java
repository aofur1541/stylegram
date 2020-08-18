package kr.spring.storepurchase.service;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.spring.storepurchase.dao.StorePurchaseMapper;
import kr.spring.storepurchase.domain.StorePurchaseVO;

@Service("storePurchaseService")
public class StorePurchaseServiceImpl implements StorePurchaseService{
	
	@Resource
	private StorePurchaseMapper storePurchaseMapper;
	
	@Override
	public void insert(StorePurchaseVO store) {
		storePurchaseMapper.insert(store);
	}

	@Override
	public List<StorePurchaseVO> selectPurchaseList(Integer num) {
		return storePurchaseMapper.selectPurchaseList(num);
	}
	
	@Override
	public StorePurchaseVO selectPurchase(Integer num) {
		return storePurchaseMapper.selectPurchase(num);
	}

	@Override
	public int selectPurchaseCount(Integer num) {
		return storePurchaseMapper.selectPurchaseCount(num);
	}

	@Override
	public Date selectToday() {
		return storePurchaseMapper.selectToday();
	}

	@Override
	public int selectPurchaseMCount(HashMap<String, Integer> purchaseMCount) {
		return storePurchaseMapper.selectPurchaseMCount(purchaseMCount);
	}

	@Override
	public int selectPurchaseAmount() {
		return storePurchaseMapper.selectPurchaseAmount();
	}

}
