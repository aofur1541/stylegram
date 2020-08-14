<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
    table {
      border-collapse: collapse;
      border-top: 3px solid #168;
      margin:0 0 30 0;
      width:1200px;
    }  
    table th {
      color: #168;
      background: #f0f6f9;
      text-align: center;
    }
    table th, table td {
      padding: 10px;
      border: 1px solid #ddd;
    }
    table th:first-child, table td:first-child {
      border-left: 0;width:200px;text-align:left;
    }
    table th:last-child, table td:last-child {
      border-right: 0;width:200px;
    }
    table tr td:first-child{
      text-align: center;
    }
    table caption{caption-side: bottom; display: none;}
</style>
<div id="body">
	<h2 style="text-align:center;">구매 성공!</h2>
	<h3 style="text-align:center;">정상적으로 구매되었습니다.</h3>
	<input type="button" value="계속 쇼핑하기" onclick="location.href='${pageContext.request.contextPath}/store/storeDetail.do'">
	<input type="button" value="구매내역 확인" onclick="location.href='${pageContext.request.contextPath}/store/purchaseList.do'">
</div>

