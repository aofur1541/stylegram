<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<c:if test="${empty m_id}">
	<h3>로그인 후 이용 바랍니다.</h3>
	<div class="nologin">
	<a href="${pageContext.request.contextPath}/member/register.do" id="nav_menu">회원가입</a>	
	<a href="${pageContext.request.contextPath}/member/login.do" id="nav_menu">로그인</a>
	</div>
	</c:if>
	<c:if test="${m_auth == 2}">
	<h3>본인인증 후 이용 바랍니다.</h3>
	<div class="noauth">
	<a href="${pageContext.request.contextPath}/member/auth.do" id="nav_menu">본인인증</a>
	</div>
	</c:if>
	<c:if test="${m_auth == 3}">
	<div class="searchForm">
		<form action="fleaList.do" method="get">
			<div id="filter">
				<select name="filter" class="filter" onchange="this.form.submit()">
					<option value="">전체</option>
					<option value="top" <c:if test="${filter eq 'top'}">selected</c:if>>상의</option>
					<option value="bottom" <c:if test="${filter eq 'bottom'}">selected</c:if>>하의</option>
					<option value="hat" <c:if test="${filter eq 'hat'}">selected</c:if>>모자</option>
					<option value="shoes" <c:if test="${filter eq 'shoes'}">selected</c:if>>신발</option>
				</select>
				<select name="keyfield" class="keyfield">
					<option value="title">제목</option>
					<option value="content">내용</option>
					<option value="id">아이디</option>
				</select>		
				<input type="search" size="16" name="keyword" id="keyword">
			</div>
		</form>
	</div>
	<!-- 로그인 되었을 시 글쓰기 버튼 화면따라다님 -->
	<c:if test="${!empty m_id}">
		<div id="write_btn">
			<a href="${pageContext.request.contextPath}/flea/fleaWrite.do"> 
				<img src="${pageContext.request.contextPath}/resources/images/write.png">
			</a>
		</div>
	</c:if>
	<div class="all_wrap" data-masonry='{ "itemSelector": ".wrap-item", "columnWidth": 300 }'>
	<c:forEach var="flea" items="${list}">
		<div class="wrap-item">
		<div class="card-sheet">
			<div id="card-img">
				<c:if test="${empty flea.fb_photo}">
					<a href="${pageContext.request.contextPath}/flea/fleaDetail.do?fb_num=${flea.fb_num}">
						<img src="${pageContext.request.contextPath}/resources/images/noimage.png">
					</a>
				</c:if>
				<c:if test="${!empty flea.fb_photo}">
					<a href="${pageContext.request.contextPath}/flea/fleaDetail.do?fb_num=${flea.fb_num}">
						<img class="fleaItem" src="imageView.do?fb_num=${flea.fb_num}">
					</a>
				</c:if>
			</div>
			<div id="card-body">
				<div id="card-profile">
					<c:if test="${empty flea.m_image}">
						<a href="${pageContext.request.contextPath}/member/anotherPage.do?m_num=${flea.fb_usernum}">
							<img src="${pageContext.request.contextPath}/resources/images/basicprofile.png">
						</a>
					</c:if>
					<c:if test="${!empty flea.m_image}">
						<a href="${pageContext.request.contextPath}/member/anotherPage.do?m_num=${flea.fb_usernum}">
							<img src="${pageContext.request.contextPath}/member/imageViewProfile.do?m_num=${flea.fb_usernum}">
						</a>
					</c:if>
					<c:if test="${empty flea.m_nickname}">
					${flea.m_id}
					</c:if>
					<c:if test="${!empty flea.m_nickname}">
					${flea.m_nickname}
					</c:if>
				</div>
				<div id="card-content">
					<div class="card-title">
						${flea.fb_title}
					</div>
					<hr size="1" width="100%">
					<div class="card-content">
						${flea.fb_price}
					</div>
					<hr size="1" width="100%">
					<div class="card-category">
					<c:if test="${flea.fb_topcheck eq 1}">	
						<img src="${pageContext.request.contextPath}/resources/images/tshirts.png">
					</c:if>
					<c:if test="${flea.fb_bottomcheck eq 1}">
						<img src="${pageContext.request.contextPath}/resources/images/pants2.png">
					</c:if>
					<c:if test="${flea.fb_hatcheck eq 1}">
						<img src="${pageContext.request.contextPath}/resources/images/cap.png">
					</c:if>
					<c:if test="${flea.fb_shoescheck eq 1}">
						<img src="${pageContext.request.contextPath}/resources/images/shoes.png">
					</c:if>
					<c:if test="${flea.fb_topcheck eq 0 && flea.fb_bottomcheck eq 0 && flea.fb_hatcheck eq 0 && flea.fb_shoescheck eq 0}">
						분   류   없   음
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