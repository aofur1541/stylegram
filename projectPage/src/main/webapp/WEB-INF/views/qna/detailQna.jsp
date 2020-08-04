<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- 스크립트 방식으로 글 삭제 -->
<script type="text/javascript">
window.onload=function(){
	deleteQna.onclick=function(){
		var delete_check = confirm("삭제 하시겠습니까?")
		if(delete_check == true){
			alert("삭제되었습니다.");
			location.href='deleteQna.do?qb_num=${qna.qb_num}'
		}else if(delete_check == false){
			return;
		}
	}
}
</script>

<div id="body">
	<div class="align-right">
		<c:if test="${!empty m_num && m_num == qna.qb_usernum}">
		<input type="button" value="수정" onclick="location.href='modifyQna.do?qb_num=${qna.qb_num}'">
		<input type="button" value="삭제" id="deleteQna" onclick="location.href='deleteQna.do?qb_num=${qna.qb_num}'">
		</c:if>
		<input type="button" value="목록" id="homebtn" onclick="location.href='${pageContext.request.contextPath}/qna/listQna.do'">
	</div>
	<hr size="1" width="100%">
	<h2>${qna.qb_title}</h2> <!-- 구현 후 위치 수정 -->
	<ul>
		<c:if test="${!empty qna.qb_photo}">
		<div>
			<img src="imageView.do?qb_num=${qna.qb_num}">
		</div>
		<li>사진 : ${qna.qb_filename}</li><!-- 구현 후 텍스트 삭제 -->
		<li>글번호 : ${qna.qb_num}</li><!-- 구현 후 텍스트 삭제 -->
		<li>작성자 : ${qna.m_id}</li><!-- 구현 후 텍스트 삭제 --> 
		<li>작성일 : ${qna.qb_regdate}</li>
		<li>수정일 : ${qna.qb_modifydate}</li>
		
		<%-- </c:if>
		<li>내용 : ${proqnaboard.qb_content}</li><!-- 구현 후 텍스트 삭제 -->
		<li>카테고리 : ${proqnaboard.qb_topinfo}</li><!-- 구현 후 텍스트 삭제 -->
		<li>카테고리 : ${proqnaboard.qb_bottominfo}</li><!-- 구현 후 텍스트 삭제 -->
		<li>카테고리 : ${proqnaboard.qb_hatinfo}</li><!-- 구현 후 텍스트 삭제 -->
		<li>카테고리 : ${proqnaboard.qb_shoseinfo}</li><!-- 구현 후 텍스트 삭제 -->
		<li>댓글번호 : ${proqnaboard.qr_num}</li><!-- 구현 후 텍스트 삭제 -->
		<li>회원번호 : ${promqmber.m_num}</li><!-- 구현 후 텍스트 삭제 -->
		<li>작성자아이디 : ${proqnaboard.qr_id}</li><!-- 구현 후 텍스트 삭제 -->
		<li>댓글내용 : ${proqnaboard.qr_content}</li><!-- 구현 후 텍스트 삭제 -->
		<li>댓글작성일 : ${proqnaboard.qr_regdate}</li><!-- 구현 후 텍스트 삭제 --> --%>
	
	<%-- <hr size="1">
	<c:if test="${fn.endWish(proqnaboard.qb_photo,'.jpg')||
	${fn.endWish(proqnaboard.qb_photo,'.JPG')||
	${fn.endWish(proqnaboard.qb_photo,'.png')||
	${fn.endWish(proqnaboard.qb_photo,'.PNG')||
	${fn.endWish(proqnaboard.qb_photo,'.bmp')||
	${fn.endWish(proqnaboard.qb_photo,'.BMP')||
	${fn.endWish(proqnaboard.qb_photo,'.gif')||
	${fn.endWish(proqnaboard.qb_photo,'.GIF')} "> --%>
	</c:if>
	</ul>
</div>