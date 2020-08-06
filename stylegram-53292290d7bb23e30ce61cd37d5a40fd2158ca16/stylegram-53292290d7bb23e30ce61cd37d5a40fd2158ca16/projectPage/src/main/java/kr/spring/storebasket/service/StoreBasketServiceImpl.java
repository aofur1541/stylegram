package kr.spring.storebasket.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.spring.store.domain.StoreVO;
import kr.spring.storebasket.dao.StoreBasketMapper;
import kr.spring.storebasket.domain.StoreBasketVO;

@Service("storeBasketService")
public class StoreBasketServiceImpl implements StoreBasketService{
	
	@Resource
	private StoreBasketMapper basketMapper;
	
	@Override
	public void insert(StoreBasketVO basketVO) {
		// TODO Auto-generated method stub
		basketMapper.insert(basketVO);
	}

	@Override
	public void delete(StoreBasketVO basketVO) {
		// TODO Auto-generated method stub
		basketMapper.delete(basketVO);
	}

	@Override
	public List<StoreVO> selectBasketList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return basketMapper.selectBasketList(map);
	}

}
