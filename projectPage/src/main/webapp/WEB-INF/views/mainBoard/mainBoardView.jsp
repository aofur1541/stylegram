<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	listComment("1");
	
	//댓글쓰기
    $("#writeCommentForm").submit(function(){
        var mr_content=$("#mr_content").val(); //댓글 내용
        var mb_num="${mainBoard.mb_num}"; //게시물 번호
        var param={ "mr_content": mr_content, "mb_num": mb_num};
        
        
        
        var data = $(this).serialize();
        //var param="replytext="+replytext+"&bno="+bno;
        $.ajax({
            type: "post", //데이터를 보낼 방식
            url: "insertComment.do", //데이터를 보낼 url
            data: data, //보낼 데이터
            success: function(){ //데이터를 보내는것이 성공했을시 출력되는 메시지
                alert("댓글이 등록되었습니다.");
                listComment(); //댓글 목록 출력
            }
        });
        
        return;
    });
	
  //댓글 목록 출력 함수
    function listComment(num){
        $.ajax({
            type: "post", //get방식으로 자료를 전달한다
            url: "listComment.do?mb_num=${mainBoard.mb_num}&curPage="+num, //컨트롤러에 있는 list.do로 맵핑하고 게시판 번호도 같이 보낸다.
            success: function(result){ //자료를 보내는것이 성공했을때 출력되는 메시지
                //result : responseText 응답텍스트(html)
                $("#listComment").html(result);
            }
        });
  	}

    function changeDate(date){
    	date = new Date(parseInt(date));
    	year = date.getFullYear();
    	month = date.getMonth()+1;
    	day = date.getDate();
    	hour = date.getHours();
    	minute = date.getMinutes();
    	second = date.getSeconds();
    	strDate = year+"-"+month+"-"+day;
    	return strDate;
    }

});

</script>
<script type="text/javascript">
window.onload=function(){
	delete_btn.onclick=function(){
		var delete_check = confirm("진짜 삭제하끄야???")
		if(delete_check==true){
			alert("삭제하였습니다!");
			location.href='delete.do?mb_num=${mainBoard.mb_num}'
		}else if(delete_check==false){
			return;
		}
	}
}
</script>

<div id="body">
	<div class="align-right">
		<c:if test="${mnumVO.m_num == m_num || m_auth == 4}">
		<input type="button" value="수정" id="update_btn" onclick="location.href='update.do?mb_num=${mainBoard.mb_num}'">
		<input type="button" value="삭제" id="delete_btn" onclick="location.href='delete.do?mb_num=${mainBoard.mb_num}'">
		</c:if>
		<input type="button" value="목록" onclick="location.href='${pageContext.request.contextPath }/main/main.do'">
	</div>
	<hr size="1" width="100%">
	<div id="likes" class="align-right">
	<b>( ${likeCount} )</b>
	<c:if test="${!empty m_id}">
	<c:if test="${likeCheck == 0}">
		<a href="${pageContext.request.contextPath}/like/like.do?mb_num=${mainBoard.mb_num}">
			<img src="${pageContext.request.contextPath}/resources/images/likes.png">
		</a>
	</c:if>
	<c:if test="${likeCheck == 1}">
		<a href="${pageContext.request.contextPath}/like/unlike.do?mb_num=${mainBoard.mb_num}">
			<img src="${pageContext.request.contextPath}/resources/images/unlikes.png">
		</a>
	</c:if>
	</c:if>
	</div>
	<div id="viewPhoto" class="align-center">
	<c:if test="${!empty mainBoard.mb_photo}">
		<img src="imageView.do?mb_num=${mainBoard.mb_num}">
	</c:if>
	</div>
	<hr size="1" width="100%">
	<h2>${mainBoard.mb_title}</h2>
	<ul>
		<li>작성자: ${mainBoard.m_id} </li>
		<li>작성일 : ${mainBoard.mb_regdate} </li>
	</ul>
	<p class="mb_content">
		${mainBoard.mb_content}
	</p>
	<p id="categoryinfo">
		<c:if test="${!empty mainBoard.mb_topinfo}">
		<a href="${mainBoard.mb_topinfo}" target="_blank"><b>상의사러가기</b></a>
		</c:if>
		<c:if test="${!empty mainBoard.mb_pantsinfo}">
		<a href="${mainBoard.mb_pantsinfo}" target="_blank"><b>하의사러가기</b></a>
		</c:if>
		<c:if test="${!empty mainBoard.mb_capinfo}">
		<a href="${mainBoard.mb_capinfo}" target="_blank"><b>모자사러가기</b></a>
		</c:if>
		<c:if test="${!empty mainBoard.mb_shoesinfo}">
		<a href="${mainBoard.mb_shoesinfo}" target="_blank"><b>신발사러가기</b></a>
		</c:if>
	</p>
	<hr size="1" width="100%">
	<!-- 댓글 -->
	<p>댓글리스트</p>
	<table id="listComment" border="1">
	
	</table>
	<!-- 댓글 쓰기 폼 -->
	<c:if test="${!empty m_id}">
	<form id="writeCommentForm">
	<input type="hidden" name="mb_num" value="${mainBoard.mb_num}">
	<input type="hidden" name="m_num" value="${m_num}">
		<table border="1">
			<tr>
				<!-- 댓글작성 -->
				<td width="150px">
					<c:if test="${empty m_nickname}">
						<div>${m_id}</div>
					</c:if>
					<c:if test="${!empty m_nickname}">
						<div>${m_nickname}</div>
					</c:if>
				</td>
				<td width="550px">
					<div>
						<input type="text" name="mr_content" id="mr_content">					
					</div>
				</td>
				<td width="100px">
					<div>
						<button type="submit" name="btnComment" id="btnComment">댓글등록</button>
					</div>
				</td>
			</tr>
		</table>
	</form>		
	</c:if>
</div>