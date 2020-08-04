<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script type="text/javascript">
</script>
<div id="body">
	<h2>회원정보수정</h2>
	<form:form action="update.do" enctype="multipart/form-data" commandName="memberVO">
		<form:hidden path="m_num"/>
		<ul>
			<li>
				<label for="upload">프로필사진</label>
				<input type="file" name="upload" id="upload" class="upload">
			</li>
			<li>
				<label for="m_nickname">닉네임</label>
				<form:input path="m_nickname"/>
				<form:errors path="m_nickname" cssClass="error-color"/>     
			</li>
			<li>
				<label for="m_address">주소</label>
				<form:input path="m_address"/>
				<form:errors path="m_address" cssClass="error-color"/>     
			</li>
			<li class="public">
				<label for="m_public">개인정보 공개여부</label>
				<form:radiobutton path="m_public" value="0"/><b>비공개</b>
				<form:radiobutton path="m_public" value="1"/><b>공개</b>
			</li>
		</ul>
		<div class="align-center">
			<input type="submit" value="수정">
			<input type="button" value="홈으로" id="homebtn" onclick="location.href='${pageContext.request.contextPath}/main/main.do'">
		</div>
	</form:form>
</div>