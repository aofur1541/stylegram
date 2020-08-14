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
		<table>
			<tr>
				<th colspan="3">주문일 : ${sv.p_regdate}</th>
			</tr>
			<tr>
				<td><img src="imageView.do?s_num=${sv.s_num}" style="width:200px;"></td>
				<td>
					<h3>결제 정보</h3><br>
					결제 상품 : <b>${store.s_title}</b> [${sv.a_num}개]<br>
					결제 가격 : 
					<c:if test="${(store.s_price-(store.s_price*(store.s_discount/100)))*store.a_num < 50000}">
						<fmt:formatNumber value="${(store.s_price-(store.s_price*(store.s_discount/100)))*store.a_num+store.s_shipcost}" type="number"/>원
					</c:if>
					<c:if test="${(store.s_price-(store.s_price*(store.s_discount/100)))*store.a_num > 50000}">
						<fmt:formatNumber value="${(store.s_price-(store.s_price*(store.s_discount/100)))*store.a_num}" type="number"/>원
					</c:if>
				</td>
				<td><h3>배송예정일</h3><br>${store.shipdate}도착 예정</td>
			</tr>
		</table>
	<input type="button" value="계속 쇼핑하기" onclick="location.href='${pageContext.request.contextPath}/store/storeDetail.do'">
	<input type="button" value="구매내역 확인" onclick="location.href='${pageContext.request.contextPath}/store/purchaseList.do'">
</div>

