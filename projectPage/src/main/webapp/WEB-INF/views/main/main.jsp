<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
  .all_wrap{margin: 0 auto;}        
  .all_wrap div{margin: 3px;}
  .all_wrap img{width: 100%; border-radius: 10px;}
  .wrap-item { width: 330px; }
</style>
<script src="https://unpkg.com/imagesloaded@4/imagesloaded.pkgd.js"></script>
<script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.js"></script>
<script>
$(document).ready(function() {

    var $grid = $('.all_wrap').imagesLoaded( function() {
      $grid.masonry({
          itemSelector: '.wrap-item',
          fitwidth: true
      });
    });
});
</script> 
<div id="body">
	<form action="main.do" method="get">
		<div id="filter" class="filter">
			<select name="filter" onchange="this.form.submit()">
				<option value="">전체</option>
				<option value="top" <c:if test="${filter eq 'top'}">selected</c:if>>상의</option>
				<option value="pants" <c:if test="${filter eq 'pants'}">selected</c:if>>하의</option>
				<option value="cap" <c:if test="${filter eq 'cap'}">selected</c:if>>모자</option>
				<option value="shoes" <c:if test="${filter eq 'shoes'}">selected</c:if>>신발</option>
			</select>
			<select name="keyfield">
				<option value="title">제목</option>
				<option value="content">내용</option>
				<option value="id">아이디</option>
			</select>		
			<input type="search" size="16" name="keyword" id="keyword">
		</div>
	</form>	
	<!-- 로그인 되었을 시 글쓰기 버튼 화면따라다님 -->
	<c:if test="${!empty m_id}">
	<div id="write_btn">
		<a href="${pageContext.request.contextPath}/mainBoard/write.do">
			<img src="${pageContext.request.contextPath}/resources/images/write.png">
		</a>
	</div>
	</c:if>
	<div id="card">
	<c:if test="${count > 0}">
	<div class="all_wrap" data-masonry='{ "itemSelector": ".wrap-item", "columnWidth": 200 }'>
	<c:forEach var="mainList" items="${mainList}">
		<div class="wrap-item">
		<div class="card-sheet"> 
			<div id="card-img">
			<c:if test="${empty mainList.mb_photo}">
				<a href="${pageContext.request.contextPath}/mainBoard/detail.do?mb_num=${mainList.mb_num}">
					<img src="${pageContext.request.contextPath}/resources/images/noimage.png">
				</a>
			</c:if>
			<c:if test="${!empty mainList.mb_photo}">
				<a href="${pageContext.request.contextPath}/mainBoard/detail.do?mb_num=${mainList.mb_num}">
					<img src="imageView.do?mb_num=${mainList.mb_num}">
				</a>
			</c:if>
			</div>
			<div id="card-body">
				<div id="card-profile">
				<c:if test="${empty mainList.m_image}">
					<a href="${pageContext.request.contextPath}/member/anotherPage.do?m_num=${mainList.m_num}">
					<img src="${pageContext.request.contextPath}/resources/images/basicprofile.png">
					</a>
				</c:if>
				<c:if test="${!empty mainList.m_image}">
					<a href="${pageContext.request.contextPath}/member/anotherPage.do?m_num=${mainList.m_num}">
					<img src="${pageContext.request.contextPath}/member/imageViewProfile.do?m_num=${mainList.m_num}">
					</a>
				</c:if>
				</div>
				<div id="card-content">
					<div class="card-title">
						${mainList.mb_title}
					</div>
					<hr size="1" width="100%">
					<div class="card-content">
						${mainList.mb_content}			
					</div>
					<hr size="1" width="100%">
					<div class="card-category">
					<c:if test="${!empty mainList.mb_topinfo}">	
						<img src="${pageContext.request.contextPath}/resources/images/tshirts.png">
					</c:if>
					<c:if test="${!empty mainList.mb_pantsinfo}">
						<img src="${pageContext.request.contextPath}/resources/images/pants2.png">
					</c:if>
					<c:if test="${!empty mainList.mb_capinfo}">
						<img src="${pageContext.request.contextPath}/resources/images/cap.png">
					</c:if>
					<c:if test="${!empty mainList.mb_shoesinfo}">
						<img src="${pageContext.request.contextPath}/resources/images/shoes.png">
					</c:if>
					</div>
				</div>
			</div>
		</div>
		</div>
	</c:forEach>
	</div>
	</c:if>
	</div>
</div>