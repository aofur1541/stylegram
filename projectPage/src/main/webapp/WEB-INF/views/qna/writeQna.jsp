<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div id="body">
	<h2>Qna 글쓰기</h2>
	<form:form action="writeQna.do" enctype="multipart/form-data" commandName="qnaVO">
	<form:hidden path="qb_usernum" value="${m_num}"/>
		<ul>
			<li>
				<label for="upload">사진 추가</label>
				<input type="file" name="upload" id="upload">
			</li>
			<li>
				<label for="qb_title">제목</label>
				<form:input path="qb_title"/>
			</li>
			<li>
				<label>내용 설명</label>
				<form:textarea path="qb_content"/>
			</li>
			<li class="category">
				<label for="tag"></label><br>
				<input type="checkbox" value="상의"><b>상의</b>
				<input type="checkbox" value="하의"><b>하의</b>
				<input type="checkbox" value="모자"><b>모자</b>
				<input type="checkbox" value="신발"><b>신발</b>
			</li>
		</ul>
		<div>
			<input type="submit" value="올리기">
			<input type="button" value="취소" id="homebtn" onclick="location.href='listQna.do'">
		</div>
	</form:form>
</div>
</body>
</html>