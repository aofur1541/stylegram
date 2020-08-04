<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script type="text/javascript">
	$(document).ready(function(){
	var checkNumber = 0;

	$("#checkNumber").click(function(){
		if($('#confirmNumber').val().length != 6){
			alert("인증번호를 확인해주세요.");
			$('#confirmNumber').val("");
			$('#confirmNumber').focus();
		}
		if($('#confirmNumber').val().length == 6){
			$('#confirmNumber').val("success!!").css("font-size", "18px").css("color", "white");
			$("#confirmNumber").attr("readonly", true).css("background-color", "rgba(130, 130, 130, 0.8)");
			checkNumber = 1;
		}
	});
		$('#authForm').submit(function(){
			if(checkNumber == 0){
				$('#checkNum').text('인증번호 확인 필수!');
				$('#confirmNumber').focus();
				return false;
			}
		});
	});
</script>
<div id="body">
	<h2>본인인증</h2>
	<br>
	<form:form action="auth.do" commandName="memberVO" id="authForm">
		<span id="notempty">* 이 붙어있는 항목은 필수항목 입니다.</span>
		<form:hidden path="m_num"/>
		<ul>
			<li>
				<label for="m_phone">핸드폰번호 *</label>
				<form:input path="m_phone"/>
				<form:errors path="m_phone" cssClass="error-color"/>     
			</li>
			<li>
				<label for="confirmNumber">인증번호 *</label>
				<input type="text" id="confirmNumber" class="confirmNumber">
				<span id="checkNum"></span>
			</li>
			<li>
				<input type="button" value="확인" id="checkNumber">
			</li>
			<li>
				<label for="m_address">주소 *</label>
				<form:input path="m_address"/>
				<form:errors path="m_address" cssClass="error-color"/>     
			</li>
		</ul>
		<div class="align-center">
			<input type="submit" value="인증">
			<input type="button" id="homebtn" value="홈으로" onclick="location.href='${pageContext.request.contextPath}/main/main.do'">
		</div>
	</form:form>
</div>