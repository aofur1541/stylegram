<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<!-- 로그인 되었을 시 글쓰기 버튼 화면따라다님 -->
	<c:if test="${!empty m_id}">
		<div id="write_btn">
			<a href="${pageContext.request.contextPath}/qna/writeQna.do"> 
				<img src="${pageContext.request.contextPath}/resources/images/write.png">
			</a>
		</div>
	</c:if>
	<div>
	<c:if test="${count > 0}">
		<div class="all_wrap" data-masonry='{ "itemSelector": ".wrap-item", "columnWidth": 200 }'>
		<c:forEach var="qna" items="${listQna}">
			<div class="wrap-item">
				<div>
					<a href="${pageContext.request.contextPath}/qna/detailQna.do?qb_num=${qna.qb_num}">
						<img src="imageView.do?qb_num=${qna.qb_num}">
					</a>
				</div>
			<div>
				<div>제목 : ${qna.qb_title}</div>
				<hr size="1" width="100%">
				<c:if test="${empty qna.m_nickname}">
				<div>작성자 : ${qna.m_id}</div>
				</c:if>
				<c:if test="${!empty qna.m_nickname}">
				<div>작성자 : ${qna.m_nickname}</div>
				</c:if>
				<hr size="1" width="100%">
				<div>내용 : ${qna.qb_content}</div>
				<hr size="1" width="100%">
						
				</div>
			</div>
			</c:forEach>
			</div>
		
	</c:if>
	</div>
</div>
