<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div id="body">
	<h2 style="text-align:center;">구매 성공!</h2>
	<h3 style="text-align:center;">정상적으로 구매되었습니다.</h3>
		<table class="purchasetable">
			<tr>
				<th colspan="3">주문일 : <fmt:formatDate value='${sv.p_regdate}' type="Date" pattern="yyyy년MM월dd일 E요일"/></th>
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
				<td><h3>배송예정일</h3><br><fmt:formatDate value='${sv.p_shipdate}' type="Date" pattern="yyyy년MM월dd일 E요일"/> 도착 예정</td>
			</tr>
		</table>
	<input type="button" value="계속 쇼핑하기" id="homebtn" class="homebtn" onclick="location.href='${pageContext.request.contextPath}/store/storeDetail.do'">
	<input type="button" value="구매내역 확인" id="blackbtn" class="blackbtn" onclick="location.href='${pageContext.request.contextPath}/store/purchaseList.do'">
</div>

