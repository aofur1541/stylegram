<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div id="body">
	<h2 style="text-align:center;">구매 성공!</h2>
	<h3 style="text-align:center;">정상적으로 구매되었습니다.</h3>
	<input type="button" value="계속 쇼핑하기" id="homebtn" class="homebtn" onclick="location.href='${pageContext.request.contextPath}/store/storeDetail.do'">
	<input type="button" value="구매내역 확인" id="blackbtn" class="blackbtn" onclick="location.href='${pageContext.request.contextPath}/store/purchaseList.do'">
</div>

