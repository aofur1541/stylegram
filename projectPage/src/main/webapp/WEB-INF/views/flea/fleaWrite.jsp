<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div id="body">
	<form:form action="fleaWrite.do" enctype="multipart/form-data" commandName="fleaVO">
		<ul>
			<li>
				<label for="upload">사진</label>
				<input type="file" name="upload" id="upload">
			</li>
			<li>
				<label for="fb_title">제목</label>
				<form:input path="fb_title"/>
				<form:errors path="fb_title" cssClass="error-color"/>
			</li>
			<li id="category">
				<label for="fb_topcheck">상의</label>
				<form:checkbox path="fb_topcheck" value="checked"/>
			</li>
			<li id="category">
				<label for="fb_bottomcheck">하의</label>
				<form:checkbox path="fb_bottomcheck" value="checked"/>
			</li>
			<li id="category">
				<label for="fb_hatcheck">모자</label>
				<form:checkbox path="fb_hatcheck" value="checked"/>
			</li>
			<li id="category">
				<label for="fb_shoescheck">신발</label>
				<form:checkbox path="fb_shoescheck" value="checked"/>
			</li>
			<li>
				<label for="fb_price">가격</label>
				<form:input path="fb_price"/>
				<form:errors path="fb_price" cssClass="error-color"/>
			</li>
			<li>
				<label for="fb_content">내용</label>
				<form:textarea path="fb_content"/>
				<form:errors path="fb_content" cssClass="error-color"/>
			</li>
		</ul>
		<div class="align-center">
			<input type="submit" value="전송">
			<input type="button" value="목록" onclick="location.href='fleaList.do'">
		</div>
	</form:form>
</div>