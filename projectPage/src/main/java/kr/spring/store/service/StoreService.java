package kr.spring.store.service;

import java.util.List;
import java.util.Map;

import kr.spring.store.domain.StoreVO;

public interface StoreService {
	public void insert (StoreVO store);
	public int selectProductCount();
	public List<StoreVO> selectProductList();//mb_num으로 진행
	public StoreVO selectProduct(Integer num);
}