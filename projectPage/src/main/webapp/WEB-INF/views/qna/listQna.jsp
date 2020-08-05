<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://unpkg.com/imagesloaded@4/imagesloaded.pkgd.js"></script>
<script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.js"></script>
<script src="https://unpkg.com/infinite-scroll@3/dist/infinite-scroll.pkgd.js"></script>
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

<style type="text/css">
   
    /* reveal grid after images loaded */
    .grid.are-images-unloaded {
      opacity: 0;
    }

    .grid__item,
    .grid__col-sizer {
      width: 32%;
    }

    .grid__gutter-sizer { width: 2%; }

    /* hide by default */
    .grid.are-images-unloaded .image-grid__item {
      opacity: 0;
    }

    .grid__item {
      margin-bottom: 20px;
      float: left;
    }

    .grid__item img {
      display: block;
      max-width: 100%;
    }


    .page-load-status {
      display: none; /* hidden by default */
      padding-top: 20px;
      border-top: 1px solid #DDD;
      text-align: center;
      color: #777;
    }

    /* loader ellips in separate pen CSS */
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://unpkg.com/infinite-scroll@3/dist/infinite-scroll.pkgd.js"></script>
<script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.js"></script>
<script>
$(document).ready(function() {
    //-------------------------------------//
    // init Masonry

    var $grid = $('.grid').masonry({
      itemSelector: 'none', // select none at first
      columnWidth: '.grid__col-sizer',
      gutter: '.grid__gutter-sizer',
      percentPosition: true,
      stagger: 30,
      // nicer reveal transition
      visibleStyle: { transform: 'translateY(0)', opacity: 1 },
      hiddenStyle: { transform: 'translateY(100px)', opacity: 0 },
    });

    // get Masonry instance
    var msnry = $grid.data('masonry');

    // initial items reveal
    $grid.imagesLoaded( function() {
      $grid.removeClass('are-images-unloaded');
      $grid.masonry( 'option', { itemSelector: '.grid__item' });
      var $items = $grid.find('.grid__item');
      $grid.masonry( 'appended', $items );
    });

    //-------------------------------------//
    // hack CodePen to load pens as pages

    var nextPenSlugs = [
      '/listQna.do?keyfield=&keyword=&pageNum=2',
      '/listQna.do?keyfield=&keyword=&pageNum=3',
      '/listQna.do?keyfield=&keyword=&pageNum=4',
      '/listQna.do?keyfield=&keyword=&pageNum=5',
      '/listQna.do?keyfield=&keyword=&pageNum=6',
      '/listQna.do?keyfield=&keyword=&pageNum=7',
     
    ];

    function getPenPath() {
      var slug = nextPenSlugs[ this.loadCount ];
      if ( slug ) {
        return './' + slug;
      }
    }

    //-------------------------------------//
    // init Infinte Scroll

    $grid.infiniteScroll({
      path: getPenPath,
      append: '.grid__item',
      outlayer: msnry,
      status: '.page-load-status',
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
	<div id="card">
	<c:if test="${count > 0}">
	
	<div class="all_wrap" data-masonry='{ "itemSelector": ".wrap-item", "columnWidth": 300 }'>
	<div class="grid">
	<div class="grid__col-sizer"></div>
  
	<c:forEach var="qna" items="${listQna}">
	<div class="grid__item">
		<div class="wrap-item">
		<div class="entry-content">
		<div class="card-sheet">
			<div id="card-img">
			<c:if test="${empty qna.qb_photo}">
				<a href="${pageContext.request.contextPath}/qna/detailQna.do?qb_num=${qna.qb_num}">
					<img src="${pageContext.request.contextPath}/resources/images/noimage.png">
				</a>
			</c:if>
			<c:if test="${!empty qna.qb_photo}">
				<a href="${pageContext.request.contextPath}/qna/detailQna.do?qb_num=${qna.qb_num}">
					<img src="imageView.do?qb_num=${qna.qb_num}">
				</a>
			</c:if>
			</div>
			<div id="card-body">
				<div id="card-profile">
					<c:if test="${empty qna.m_image}">
						<a href="${pageContext.request.contextPath}/member/anotherPage.do?m_num=${qna.qb_usernum}">
						<img src="${pageContext.request.contextPath}/resources/images/basicprofile.png">
						</a>
					</c:if>
					<c:if test="${!empty qna.m_image}">
						<a href="${pageContext.request.contextPath}/member/anotherPage.do?m_num=${qna.qb_usernum}">
						<img src="${pageContext.request.contextPath}/member/imageViewProfile.do?m_num=${qna.qb_usernum}">
						</a>
					</c:if>
					<c:if test="${empty qna.m_nickname}">
					${qna.m_id}
					</c:if>
					<c:if test="${!empty qna.m_nickname}">
					${qna.m_nickname}
					</c:if>
				</div>
				<div id="card-content">
					<div class="card-title">
						<a href="${pageContext.request.contextPath}/qna/detailQna.do?qb_num=${qna.qb_num}">
							${qna.qb_title}
						</a>
					</div>
					<hr size="1" width="100%">
					<div class="card-content">
						${qna.qb_content}
					</div>
					<hr size="1" width="100%">
					<div class="card-category">
					<c:if test="${qna.qb_topinfo eq 1}">	
						<img src="${pageContext.request.contextPath}/resources/images/tshirts.png">
					</c:if>
					<c:if test="${qna.qb_pantsinfo eq 1}">
						<img src="${pageContext.request.contextPath}/resources/images/pants2.png">
					</c:if>
					<c:if test="${qna.qb_capinfo eq 1}">
						<img src="${pageContext.request.contextPath}/resources/images/cap.png">
					</c:if>
					<c:if test="${qna.qb_shoesinfo eq 1}">
						<img src="${pageContext.request.contextPath}/resources/images/shoes.png">
					</c:if>
					</div>
				</div>
			</div>
		</div>
		</div>
		</div>
		</div>
	</c:forEach>
	</div>
	<%-- <div>${pagingHtml}</div> --%>
	</div>
	</c:if>
	</div>
</div>
<div class="page-load-status">
  <div class="loader-ellips infinite-scroll-request">
    <span class="loader-ellips__dot"></span>
    <span class="loader-ellips__dot"></span>
    <span class="loader-ellips__dot"></span>
    <span class="loader-ellips__dot"></span>
  </div>
  <p class="infinite-scroll-last">End of content</p>
  <p class="infinite-scroll-error">No more pages to load</p>
</div>
