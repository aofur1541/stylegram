<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	$(document).ready(function(){
		$(window).scroll(function(){
			var scrollHeight = $(window).scrollTop() + $(window).height();
			var documentHeight = $(document).height();
			
			if(scrollHeight == documentHeight){
				
			}
		});
	});
</script>
<div id="body">
	<div id="flea_content_wrapper">
		<form action="fleaList.do" method="get">
			<div id="filter">
				<select name="filter" onchange="this.form.submit()">
					<option value="">전체</option>
					<option value="top" <c:if test="${filter eq 'top'}">selected</c:if>>상의</option>
					<option value="bottom" <c:if test="${filter eq 'bottom'}">selected</c:if>>하의</option>
					<option value="hat" <c:if test="${filter eq 'hat'}">selected</c:if>>모자</option>
					<option value="shoes" <c:if test="${filter eq 'shoes'}">selected</c:if>>신발</option>
				</select>
			</div>
		</form>
		<div id="write">
			<a href="${pageContext.request.contextPath}/flea/fleaWrite.do">글쓰기</a>
		</div>
		<c:forEach var="flea" items="${list}">
			<div id="content">
				<div id="img">
					<a href="${pageContext.request.contextPath}/flea/fleaDetail.do?fb_num=${flea.fb_num}"><img class="fleaItem" src="imageView.do?fb_num=${flea.fb_num}"></a>
				</div>
				<div id="info" style="cursor:pointer;" onclick="location.href='${pageContext.request.contextPath}/flea/fleaDetail.do?fb_num=${flea.fb_num}'">
					<span class="fleaPre">${flea.fb_title}</span><br>
					<span class="fleaPre">${flea.fb_price}</span>
				</div>
				<div id="category">
					<c:if test="${flea.fb_topcheck == 1}">
						<div id="ca1">상의</div>
					</c:if>
					<c:if test="${flea.fb_bottomcheck == 1}">
						<div id="ca2">하의</div>
					</c:if>
					<c:if test="${flea.fb_hatcheck == 1}">
						<div id="ca3">모자</div>
					</c:if>
					<c:if test="${flea.fb_shoescheck == 1}">
						<div id="ca4">신발</div>
					</c:if>
				</div>
			</div>
		</c:forEach>
	</div>
</div>