package kr.spring.storepurchase.service;

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
	public int selectPurchaseCount() {
		return storePurchaseMapper.selectPurchaseCount();
	}
	
	@Override
	public List<StorePurchaseVO> selectPurchaseList(Integer num) {
		return storePurchaseMapper.selectPurchaseList(num);
	}
	
	@Override
	public StorePurchaseVO selectPurchase(Integer num) {
		return storePurchaseMapper.selectPurchase(num);
	}


}
