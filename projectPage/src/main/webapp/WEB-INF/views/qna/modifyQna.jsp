<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="body">
	<h2>게시글 수정</h2><!-- 구현 후 삭제 -->
	
	<form:form action="modifyQna.do" enctype="multipart/form-data" commandName="qnaVO">
	<form:hidden path="qb_num"/>
	
	<c:if test="${!empty qnaVO.qb_filename}">
		<div>
			<img src="imageView.do?qb_num=${qnaVO.qb_num}">
		</div>
	</c:if>
	<ul>
			<li>
				<label for="photo">사진 추가</label>
				<input type="file" name="upload" id="upload">
			</li>
			<li>
				<label for="title">제목</label>
				<form:input path="qb_title"/>
			</li>
			
			<li>
				<label>내용 설명</label>
				<form:textarea path="qb_content" value="${qna.qb_num}"/>
			</li>
			<!-- 태그 넣어야 됨 -->
		</ul>
		<div>
			<input type="submit" value="수정">
			<input type="button" value="취소" onclick="location.href='${pageContext.request.contextPath}/qna/list.do'">
		</div>
	</form:form>
	</div>