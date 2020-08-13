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
<jsp:useBean id="toDay" class="java.util.Date" />
<div id="body">
	<c:if test="${count == 0}">
		<h2>구매한 물품이 없습니다.</h2>
	</c:if>
	<c:if test="${count > 0}">
		<h2>구매 내역 확인</h2>
		<c:forEach var="plist" items="${plist}" varStatus="status">
		<table>
			<tr>
				<th colspan="3">
					<h4>주문일 ${plist.p_regdate}</h4>
				</th>
			</tr>
			<tr>
				<td><img src="imageView.do?s_num=${slist[status.index].s_num}" style="width:200px;"></td>
				<td>
					<b>구매한 상품</b> : ${slist[status.index].s_title} ${plist.a_num}개<br>
					<b>상품 가격</b> :
					<c:if test="${(slist[status.index].s_price-(slist[status.index].s_price*(slist[status.index].s_discount/100)))*slist[status.index].a_num < 50000}">
						<fmt:formatNumber value="${(slist[status.index].s_price-(slist[status.index].s_price*(slist[status.index].s_discount/100)))*slist[status.index].a_num+slist[status.index].s_shipcost}" type="number"/>원
					</c:if>
					<c:if test="${(slist[status.index].s_price-(slist[status.index].s_price*(slist[status.index].s_discount/100)))*slist[status.index].a_num > 50000}">
						<fmt:formatNumber value="${(slist[status.index].s_price-(slist[status.index].s_price*(slist[status.index].s_discount/100)))*slist[status.index].a_num}" type="number"/>원
					</c:if>
				</td>
				<td>
					<c:if test="${slist[status.index].shipdate==sysdate}">
						배송완료
					</c:if>
					<c:if test="${slist[status.index].shipdate!=sysdate}">
						배송중
					</c:if>
				</td>
			</tr>
		</table>
		</c:forEach>
	</c:if>
	<fmt:formatDate value="${toDay}" pattern="yyyy-MM-dd" />
</div>






























