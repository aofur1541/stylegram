<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<script type="text/javascript">
	$(document).ready(function(){
		if($('#fb_topcheck').val() != 1){
			$('#fb_topcheck').prop("checked", true);
		}
		if($('#fb_bottomcheck').val() != 1){
			$('#fb_bottomcheck').prop("checked", true);
		}
		if($('#fb_hatcheck').val() != 1){
			$('#fb_hatcheck').prop("checked", true);
		}
		if($('#fb_shoescheck').val() != 1){
			$('#fb_shoescheck').prop("checked", true);
		}
	});
</script>
<div id="body">
	<h2>물품수정</h2>
	<form:form action="fleaUpdate.do" enctype="multipart/form-data" commandName="fleaVO">
		<form:hidden path="fb_num"/>
		<ul>
			<li>
				<label for="upload">사진</label>
				<input type="file" name="upload" id="upload">
				<c:if test="${!empty fleaVO.fb_filename}">
					<br>
					<span>(${fleaVO.fb_filename})사진이 등록되어 있습니다. 다시 업로드하면 기존 파일은 삭제됩니다.</span>
				</c:if>
			</li>
			<li>
				<label for="fb_title">제목</label>
				<form:input path="fb_title"/>
				<form:errors path="fb_title" cssClass="error-color"/>
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
			<li class="category">
				<label>태그선택</label><br>
				<form:checkbox path="fb_topcheck" value="1"/><b>상의</b>
				<form:checkbox path="fb_bottomcheck" value="1"/><b>하의</b>
				<form:checkbox path="fb_hatcheck" value="1"/><b>모자</b>
				<form:checkbox path="fb_shoescheck" value="1"/><b>신발</b>
			</li>
		</ul>
		<div class="align-center">
			<input type="submit" value="전송">
			<input type="button" value="목록" id="homebtn" onclick="location.href='fleaList.do'">
		</div>
	</form:form>
</div>