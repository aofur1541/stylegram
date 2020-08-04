<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript">
	window.onload=function(){
		var del = document.getElementById('delete');
		del.onclick=function(){
			var delConfirm = confirm("등록된 물품을 삭제하시겠습니까?");
			if(delConfirm){
				alert("삭제완료!");
				location.href='fleaDelete.do?fb_num=${flea.fb_num}'
			}else{
				return false;
			}
		}
	}
</script>
<div id="body">
	<h2>${flea.fb_title}</h2>
	<ul>
		<li>번호 : ${flea.fb_num}</li>
		<li>작성일 : ${flea.fb_regdate}</li>
		<li>최근 수정일 : ${flea.fb_modifydate}</li>
	</ul>
	<hr size="1" width="100%">
	<c:if test="${
					fn:endsWith(flea.fb_filename,'.jpg') ||
					fn:endsWith(flea.fb_filename,'.JPG') ||
					fn:endsWith(flea.fb_filename,'.gif') ||
					fn:endsWith(flea.fb_filename,'.GIF') ||
					fn:endsWith(flea.fb_filename,'.png') ||
					fn:endsWith(flea.fb_filename,'.PNG')
				}">
		<div class="align-center">
			<img src="imageView.do?fb_num=${flea.fb_num}" style="max-width:300px">
		</div>
	</c:if>
	<c:if test="${flea.fb_topcheck == 1}">
		<div><p>상의</p></div>
	</c:if>
	<c:if test="${flea.fb_bottomcheck  == 1}">
		<div>하의</div>
	</c:if>
	<c:if test="${flea.fb_hatcheck == 1}">
		<div>모자</div>
	</c:if>
	<c:if test="${flea.fb_shoescheck == 1}">
		<div>신발</div>
	</c:if>
	<p>
		${flea.fb_content}
	</p>
	<hr size="1" width="100%">
	<div class="align-right">
		<%-- 글 수정 및 삭제를 하려면 로그인한 후 로그인 아이디와 작성자 아이디가 일치해야 함 --%>	
		<c:if test="${!empty m_num && m_num == flea.fb_usernum}">
			<input type="button" value="수정" onclick="location.href='fleaUpdate.do?fb_num=${flea.fb_num}'">
			<input id="delete" type="button" value="삭제">
		</c:if>
		<input type="button" value="목록" onclick="location.href='fleaList.do'">
	</div>
</div>