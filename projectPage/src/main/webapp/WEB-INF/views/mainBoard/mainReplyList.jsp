<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<body>
	<c:if test="${commentCount == 0}">
	<table>
		<tr>
			<td>댓글 없음</td>
		</tr>
	</table>
	</c:if>
	<c:if test="${commentCount != 0}">
	<!-- 댓글 목록 -->
	<table style="width:100%">
	<c:forEach var="row" items="${c_list}">
		<script type="text/javascript">
		$(function(){
			$(".updateCom${row.mr_num}").hide();
			$(".updateComment_btn${row.mr_num}").on("click",function(){
				$(".updateCom${row.mr_num}").toggle("fast");
			});
			$(".deleteComment_btn${row.mr_num }").click(function(){
				var checking = confirm("댓글을 삭제합니다");
				if(checking == true){
					alert("삭제성공");
					location.href='${pageContext.request.contextPath }/mainBoard/deleteComment.do?mr_num=${row.mr_num }';
				}else if(checking == false){
				
				}
				
			});
		});
		</script>
		<tr>
			<td>
				<c:if test="${empty m_nickname}">
					${row.m_id}
				</c:if>
				<c:if test="${!empty m_nickname}">
					${row.m_nickname}
				</c:if>				
				(<fmt:formatDate value="${row.mr_regdate }" pattern="yyyy-MM-dd"/>)
				<c:if test="${row.m_num == m_num || m_auth == 4}">
				<button id="updateComment_btn" class="updateComment_btn${row.mr_num }" name="updateComment_btn">수정</button>
				<button id="deleteComment_btn" class="deleteComment_btn${row.mr_num }" name="deleteComment_btn">삭제</button>
				</c:if>
				<br>
				${row.mr_content }
				<br>
			</td>
			
		</tr>
		<tr id="updateCom" class="updateCom${row.mr_num }">
			<td>
				<form action="updateComment.do" name="updateComForm" id="updateComForm">
					<input type="hidden" name="mr_num" value="${row.mr_num }">
					<input type="text" name="updateText" id="updateText" value="${row.mr_content }">
					<input type="submit" value="수정">
				</form>
			</td>
		</tr>
		</c:forEach>
	</table>
	</c:if>
</body>
