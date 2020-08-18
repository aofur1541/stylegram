<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script type="text/javascript">
	$(function(){
		$("#review-body").hide();
		$("#review-open").on("click",function(){
			$("#review-body").toggle("fast");
		});
	});
	/* 별점주기 구현 */
	function updateMark(star){
		lock(star);
		alert("별점 "+star+"점을 선택하셨습니다.");
		document.updateReviewForm.sr_star.value=star;
	}
</script>

<body>
	<div class="reviewbutton">
		<button id="review-open">리뷰 보기</button>
	</div>
 	<div id="review-body">
		<div class="card-content">
			<c:if test="${count == 0}">
			<table>
				<tr>
					<td>리뷰 없음</td> 
				</tr>
			</table>
			</c:if>
			<c:if test="${count != 0}">
			<table>
			<c:forEach var="row" items="${list }">
				<!-- 리뷰 수정 삭제 jquery -->
				<script type="text/javascript">
				$(function(){
					$(".updateReview${row.sr_num}").hide();
					$(".updateReview_btn${row.sr_num}").on("click",function(){
						$(".updateReview${row.sr_num}").toggle("fast");
					});
					$(".deleteReview_btn${row.sr_num }").click(function(){
						var checking = confirm("리뷰를 삭제하시겠습니까?");
						if(checking == true){
							alert("삭제성공");
							location.href='${pageContext.request.contextPath }/store/deleteReview.do?sr_num=${row.sr_num }';
						}else if(checking == false){
						 
						}
						
					});
				});
				
				</script>
				<!-- 리뷰 리스트 -->
				<tr>
					<td class="writeinfo">
						<c:if test="${empty row.m_nickname }">
							<b>${row.m_id }</b>
						</c:if>
						<c:if test="${!empty row.m_nickname }">
							<b>${row.m_nickname }</b>
						</c:if>
						(<fmt:formatDate value="${row.sr_regdate }" pattern="yyyy-MM-dd"/>)<br>
						<c:if test="${row.m_num == m_num || m_auth == 4 }">
							<button id="updateReview_btn" class="updateReview_btn${row.sr_num }" name="updateReview_btn">수정</button>
							<button id="deleteReview_btn" class="deleteReview_btn${row.sr_num }" name="deleteReview_btn">삭제</button>
						</c:if>
					</td>
					<td>
						<c:if test="${row.sr_star == 1}"><img src="${pageContext.request.contextPath}/resources/images/star-1.png" class="starimg"></c:if>
						<c:if test="${row.sr_star == 2}"><img src="${pageContext.request.contextPath}/resources/images/star-2.png" class="starimg"></c:if>
						<c:if test="${row.sr_star == 3}"><img src="${pageContext.request.contextPath}/resources/images/star-3.png" class="starimg"></c:if>
						<c:if test="${row.sr_star == 4}"><img src="${pageContext.request.contextPath}/resources/images/star-4.png" class="starimg"></c:if>
						<c:if test="${row.sr_star == 5}"><img src="${pageContext.request.contextPath}/resources/images/star-5.png" class="starimg"></c:if>					
					</td>
				</tr>
				<tr>
					<td>
						${row.sr_content } 
					</td>
				</tr>
				<!-- 리뷰 수정 -->
				
				
				<tr id="updateReview" class="updateReview${row.sr_num }">
					<td>
						<form action="updateReview.do" name="updateReviewForm" id="updateReviewForm">
							<input type="hidden" name="sr_num" value="${row.sr_num }"/>
							<input type="text" name="updateText" id="updateText" value="${row.sr_content }">
							<input type="submit" value="수정">

						</form>			
					</td>
				</tr>
				
			</c:forEach>
			</table>
			</c:if>
		</div>
	</div> 
</body>
<%-- <form:form action="productReview.do" commandName="storeReviewVO">
				<table style="width:700;">
					<c:forEach var="review" items="${detail}">
						<tr>
							<td rowspan="3" width="100">${m_id}</td>
							<td width="550" height="20">
								<font size="5" style="border:border;">${m_id}</font>
								<font size="1">${sr_regdate}</font>					
							</td>
							<td width="50">
								<c:if test="${m_id == admin}">
									<a href="삭제폼">삭제</a>
								</c:if>
							</td>
						</tr>
						<tr>
							<td colspan="2" width="600">${sr_star}
								<c:if test="${review.sr_star == 1}"><img src="${pageContext.request.contextPath}/resources/images/star1.png"></c:if>
								<c:if test="${review.sr_star == 2}"><img src="${pageContext.request.contextPath}/resources/images/star2.png"></c:if>
								<c:if test="${review.sr_star == 3}"><img src="${pageContext.request.contextPath}/resources/images/star3.png"></c:if>
								<c:if test="${review.sr_star == 4}"><img src="${pageContext.request.contextPath}/resources/images/star4.png"></c:if>
								<c:if test="${review.sr_star == 5}"><img src="${pageContext.request.contextPath}/resources/images/star5.png"></c:if>
							</td>
						</tr>
						<tr>
							<td height="100" colspan="2">${sr_content}</td>
						</tr>
					</c:forEach>
				</table>
			</form:form> --%>