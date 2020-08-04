package kr.spring.qna.dao;

import java.util.List;
import java.util.Map;

import kr.spring.qna.domain.QnaVO;

public interface QnaMapper {
	
	public List<QnaVO> listQna(Map<String,Object> map);
	public void writeQna(QnaVO qna);	
	public QnaVO selectQna(Integer qb_num);
	public void modifyQna(QnaVO qna);
	public int selectRowCount(Map<String,Object> map);
	public void deleteQna(Integer qb_num);
}
