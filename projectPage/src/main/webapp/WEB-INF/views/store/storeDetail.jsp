<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div id="body">
	<c:if test="${count == 0}">	
		<div>등록된 게시물이 없습니다</div>
	</c:if>
	<c:if test="${count > 0}">
		<c:forEach var="store" items="${list}">
			<c:if test="${store.mdpick == 1}">
			<div class="card-board">
				<div class="card-sheet-top">
					<div><b>실시간 인기 TOP | </b>가장 HOT한 상품!</div>
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
									<img src="imageView.do?s_num=${store.s_num}" style="width:300px;">
								</a>
							</div>
						</c:if>	
					</div>
					<div class="card-content">
						<div id="text-box"><a href="${pageContext.request.contextPath}/store/productDetail.do?s_num=${store.s_num}">${store.s_title}</a></div>
						<div id="text-box">[${store.s_discount}%]${store.s_price}</div>
					</div>
				</div>
			</div>
			<div class="card-board">
				<div class="card-sheet-top">
					<div><b>MD추천 | </b>오늘의 추천 상품!</div>
					<div class="card-img">
						<c:if
							test="${fn:endsWith(store.filename,'.jpg') || 
	          					    fn:endsWith(store.filename,'.JPG') ||
	           					    fn:endsWith(store.filename,'.gif') ||
	           				        fn:endsWith(store.filename,'.GIF') ||
	           					    fn:endsWith(store.filename,'.png') ||
	            				    fn:endsWith(store.filename,'.PNG')}">
							<div>
								<a href="${pageContext.request.contextPath}/store/productDetail.do?s_num=${store.s_num}"><img src="imageView.do?s_num=${store.s_num}" style="width:300px;"></a>
							</div>
						</c:if>	
					</div>
					<div class="card-content">
						<div id="text-box"><a href="${pageContext.request.contextPath}/store/productDetail.do?s_num=${store.s_num}">${store.s_title}</a></div>
						<div id="text-box">[${store.s_discount}%]${store.s_price}</div>
					</div>
				</div>
			</div>
			</c:if>
		</c:forEach>
		<c:forEach var="normal" items="${list}">
			<c:if test="${normal.mdpick == 0}">
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
									<img src="imageView.do?s_num=${normal.s_num}" style="width:300px;height:400px;">
								</a>
							</div>
						</c:if>	
					</div>
					<div class="card-content">
						<div id="text-box"><a href="${pageContext.request.contextPath}/store/productDetail.do?s_num=${normal.s_num}"><b>${normal.s_title}</b></a></div>
						<div id="text-box">
							<c:if test="${normal.s_discount == ''}">
								${normal.s_price}
							</c:if>
							<c:if test="${normal.s_discount > 0}">
								[${normal.s_discount}%]${normal.s_price}
							</c:if>
						</div>
					</div>
				</div>
			</div>
			</c:if>
		</c:forEach>
	</c:if>
</div>