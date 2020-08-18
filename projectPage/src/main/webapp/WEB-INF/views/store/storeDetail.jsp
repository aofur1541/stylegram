<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<div id="body" class="store">
	<!-- 장바구니 -->
	<c:if test="${!empty m_id}">
		<div id="basket" class="basket">
			<a href="${pageContext.request.contextPath }/basket/storeBasket.do">
				<img src="${pageContext.request.contextPath}/resources/images/shoppingBag.png">
			</a>
		</div>
	</c:if>
	<c:if test="${count == 0}">
		<div>등록된 게시물이 없습니다</div>
	</c:if>
	<c:if test="${count > 0}">
		<c:forEach var="store" items="${list}">
			<c:if test="${store.salesrate == amount && store.staravg >= 4}"> 
			<div class="card-board1">
				<div class="card-sheet-top">
					<div class="toptext"><b> 인기 TOP | </b>가장 HOT한 상품!!</div>
					<div class="card-img">
						<c:if
							test="${fn:endsWith(store.filename,'.jpg') || 
	          					    fn:endsWith(store.filename,'.JPG') ||
	           					    fn:endsWith(store.filename,'.gif') ||
	           				        fn:endsWith(store.filename,'.GIF') ||
	           					    fn:endsWith(store.filename,'.png') ||
	            				    fn:endsWith(store.filename,'.PNG')}">
							<div>
								<a href="${pageContext.request.contextPath}/store/productDetail.do?s_num=${store.s_num}">
									<img src="imageView.do?s_num=${store.s_num}" class="productimage">
								</a>
							</div>
						</c:if>
						<c:if test="${store.staravg==0}"><div><img src="${pageContext.request.contextPath}/resources/images/star-0.png" class="starimg"></div></c:if>
						<c:if test="${store.staravg==1}"><div><img src="${pageContext.request.contextPath}/resources/images/star-1.png" class="starimg"></div></c:if>	
						<c:if test="${store.staravg==2}"><div><img src="${pageContext.request.contextPath}/resources/images/star-2.png" class="starimg"></div></c:if>	
						<c:if test="${store.staravg==3}"><div><img src="${pageContext.request.contextPath}/resources/images/star-3.png" class="starimg"></div></c:if>	
						<c:if test="${store.staravg==4}"><div><img src="${pageContext.request.contextPath}/resources/images/star-4.png" class="starimg"></div></c:if>	
						<c:if test="${store.staravg==5}"><div><img src="${pageContext.request.contextPath}/resources/images/star-5.png" class="starimg"></div></c:if>
					</div>
					<div class="card-content">
						<div id="text-box"><a href="${pageContext.request.contextPath}/store/productDetail.do?s_num=${store.s_num}">${store.s_title}</a></div>
						<div id="text-box">
							<c:if test="${store.s_discount == ''}">
								<strong style="color:green;"><fmt:formatNumber value="${store.s_price}" type="currency" currencySymbol="\\"/></strong>
							</c:if>
							<c:if test="${store.s_discount > 0}">
								<strong style="color:red;">
									[${store.s_discount}%]<fmt:formatNumber value="${store.s_price-(store.s_price*(store.s_discount/100))}" type="number"/>원 
								</strong><del style="color:gray;"><fmt:formatNumber value="${store.s_price}" type="number"/>원</del>
							</c:if>
						</div>
					</div>
				</div>
			</div>
			</c:if>
			<c:if test="${store.mdpick == 1}">
			<div class="card-board1">
				<div class="card-sheet-top">
					<div class="toptext"><b>MD추천 | </b>오늘의 추천 상품!</div>
					<div class="card-img">
						<c:if
							test="${fn:endsWith(store.filename,'.jpg') || 
	          					    fn:endsWith(store.filename,'.JPG') ||
	           					    fn:endsWith(store.filename,'.gif') ||
	           				        fn:endsWith(store.filename,'.GIF') ||
	           					    fn:endsWith(store.filename,'.png') ||
	            				    fn:endsWith(store.filename,'.PNG')}">
							<div>
								<a href="${pageContext.request.contextPath}/store/productDetail.do?s_num=${store.s_num}">
								<img src="imageView.do?s_num=${store.s_num}" class="productimage">
								</a>
							</div>
						</c:if>
						<c:if test="${store.staravg==0}"><div><img src="${pageContext.request.contextPath}/resources/images/star-0.png" class="starimg"></div></c:if>
						<c:if test="${store.staravg==1}"><div><img src="${pageContext.request.contextPath}/resources/images/star-1.png" class="starimg"></div></c:if>	
						<c:if test="${store.staravg==2}"><div><img src="${pageContext.request.contextPath}/resources/images/star-2.png" class="starimg"></div></c:if>	
						<c:if test="${store.staravg==3}"><div><img src="${pageContext.request.contextPath}/resources/images/star-3.png" class="starimg"></div></c:if>	
						<c:if test="${store.staravg==4}"><div><img src="${pageContext.request.contextPath}/resources/images/star-4.png" class="starimg"></div></c:if>	
						<c:if test="${store.staravg==5}"><div><img src="${pageContext.request.contextPath}/resources/images/star-5.png" class="starimg"></div></c:if>
					</div>
					<div class="card-content">
						<div id="text-box"><a href="${pageContext.request.contextPath}/store/productDetail.do?s_num=${store.s_num}">${store.s_title}.</a></div>
						<div id="text-box">
							<c:if test="${store.s_discount == ''}">
								<strong style="color:green;"><fmt:formatNumber value="${store.s_price}" type="currency" currencySymbol="\\"/></strong>
							</c:if>
							<c:if test="${store.s_discount > 0}">
								<strong style="color:red;">
									[${store.s_discount}%]<fmt:formatNumber value="${store.s_price-(store.s_price*(store.s_discount/100))}" type="number"/>원 
								</strong><del style="color:gray;"><fmt:formatNumber value="${store.s_price}" type="number"/>원</del>
							</c:if>
						</div>
					</div>
				</div>
			</div>
			</c:if>
		</c:forEach>
		<div class="all_wrap" data-masonry='{ "itemSelector": ".wrap-item", "columnWidth": 320 }'>
		<c:forEach var="normal" items="${list}">
			<c:if test="${normal.mdpick == 0}">
			<div class="wrap-item">
			<div class="card-board">
				<div class="card-sheet">
					<div class="card-img">
						<c:if
							test="${fn:endsWith(normal.filename,'.jpg') || 
	          					    fn:endsWith(normal.filename,'.JPG') ||
	           					    fn:endsWith(normal.filename,'.gif') ||
	           				        fn:endsWith(normal.filename,'.GIF') ||
	           					    fn:endsWith(normal.filename,'.png') ||
	            				    fn:endsWith(normal.filename,'.PNG')}">
							<div>
								<a href="${pageContext.request.contextPath}/store/productDetail.do?s_num=${normal.s_num}">
									<img src="imageView.do?s_num=${normal.s_num}">
								</a>
							</div>
						</c:if>
							<c:if test="${normal.staravg==0}"><div><img src="${pageContext.request.contextPath}/resources/images/star-0.png" class="starimg"></div></c:if>
							<c:if test="${normal.staravg==1}"><div><img src="${pageContext.request.contextPath}/resources/images/star-1.png" class="starimg"></div></c:if>	
							<c:if test="${normal.staravg==2}"><div><img src="${pageContext.request.contextPath}/resources/images/star-2.png" class="starimg"></div></c:if>	
							<c:if test="${normal.staravg==3}"><div><img src="${pageContext.request.contextPath}/resources/images/star-3.png" class="starimg"></div></c:if>	
							<c:if test="${normal.staravg==4}"><div><img src="${pageContext.request.contextPath}/resources/images/star-4.png" class="starimg"></div></c:if>	
							<c:if test="${normal.staravg==5}"><div><img src="${pageContext.request.contextPath}/resources/images/star-5.png" class="starimg"></div></c:if>
					</div>
					<div class="card-content">
						<div id="text-box"><a href="${pageContext.request.contextPath}/store/productDetail.do?s_num=${normal.s_num}"><b>${normal.s_title}</b></a></div>
						<div id="text-box">
							<c:if test="${normal.s_discount == ''}">
								<strong style="color:green;"><fmt:formatNumber value="${normal.s_price}" type="currency" currencySymbol="\\"/></strong>
							</c:if>
							<c:if test="${normal.s_discount > 0}">
								<strong style="color:red;">
									[${normal.s_discount}%]<fmt:formatNumber value="${normal.s_price-(normal.s_price*(normal.s_discount/100))}" type="number"/>원 
								</strong><del style="color:gray;"><fmt:formatNumber value="${normal.s_price}" type="number"/>원</del>
							</c:if>
						</div>
					</div>
				</div>
			</div>
			</div>
			</c:if>
		</c:forEach>
		</div>
	</c:if>
</div>
