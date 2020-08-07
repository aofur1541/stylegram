<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" contentType = "text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">
	var locked = 0;
	function show(star){
		var i;
		var image;
		var el;
		var e = document.getElementById('startext');
		var stateMsg;
		
		for(i=1;i<=star;i++){
			image = 'image'+i;
			el = document.getElementById(image);
			el.src = "${pageContext.request.contextPath}/resources/images/star01.png";
		}
		
		switch(star){
		case 1:stateMsg="끔찍한 상품이에요";break;
		case 2:stateMsg="별로인 상품이에요";break;
		case 3:stateMsg="평범한 상품이에요";break;
		case 4:stateMsg="만족스러운 상품이에요!";break;
		case 5:stateMsg="최고의 상품이에요!";break;
		default:stateMsg="";
		}
		e.innerHTML = stateMsg;
	}
	
	function noshow(star){
		var i;
		var image;
		var el;
		
		for(i=1;i<=star;i++){
			image = 'image'+i;
			el = document.getElementById(image);
			el.src = "${pageContext.request.contextPath}/resources/images/star00.png";
		}
	}
	
	function lock(star){
		show(star);
		locked = 1;
	}
	
	function mark(star){
		lock(star);
		alert("별점 "+star+"점을 선택하셨습니다.");
		document.reviewform.sr_star.value=star;
	}
$(document).ready(function(){
	
	listReview("1");
	
	function listReview(num){
		$.ajax({
			type: "get",
			url: "listReview.do?s_num=${detail.s_num}&curPage="+num,
			success: function(result){
				$("#listReview").html(result);
			}
		});
		
	}
});
	
</script>
<div id="body">
	<!-- 장바구니 -->
	<c:if test="${!empty m_id}">
		<div id="basket" class="basket">
			<a href="${pageContext.request.contextPath }/basket/storeBasket.do">
				<img src="${pageContext.request.contextPath}/resources/images/shoppingBag.png">
			</a>
		</div>
	</c:if>
<!-- ============================ 상품 결제 및 상품 상세 소개 부분 ================================================== -->
	<div id="text-box"><h2>${detail.s_title}</h2></div>
	<div class="productdetail">
		<div class="mainimage">
			<c:if test="${fn:endsWith(detail.filename,'.jpg') || 
        				  fn:endsWith(detail.filename,'.JPG') ||
        				  fn:endsWith(detail.filename,'.gif') ||
        			      fn:endsWith(detail.filename,'.GIF') ||
        				  fn:endsWith(detail.filename,'.png') ||
          				  fn:endsWith(detail.filename,'.PNG')}">
				<div><img src="imageView.do?s_num=${detail.s_num}"></div>
			</c:if>	
		</div>
	</div>
	<div class="buyform">
		<div class="buyformback">
			<div>
				<div id="text-box">
					<c:if test="${detail.s_ship==0}">무료배송</c:if>
					<c:if test="${detail.s_ship==1}">배송비 : <fmt:formatNumber value="${detail.s_shipcost}" type="currency" currencySymbol="\\"/></c:if>
				</div>
				<div id="text-box">
					<div>배송예정일 : ${detail.shipdate}</div>
				</div>
				<c:if test="${detail.staravg==1}"><div><img src="${pageContext.request.contextPath}/resources/images/star1.png" class="starimg"></div></c:if>	 
				<c:if test="${detail.staravg==2}"><div><img src="${pageContext.request.contextPath}/resources/images/star2.png" class="starimg"></div></c:if>	 
				<c:if test="${detail.staravg==3}"><div><img src="${pageContext.request.contextPath}/resources/images/star3.png" class="starimg"></div></c:if>	 
				<c:if test="${detail.staravg==4}"><div><img src="${pageContext.request.contextPath}/resources/images/star4.png" class="starimg"></div></c:if>	 
				<c:if test="${detail.staravg==5}"><div><img src="${pageContext.request.contextPath}/resources/images/star5.png" class="starimg"></div></c:if>
				<div id="text-box">
					<c:if test="${detail.s_discount == ''}">
						<h4 style="color:green;"><fmt:formatNumber value="${detail.s_price}" type="currency" currencySymbol="\\"/></h4>
					</c:if>
					<c:if test="${detail.s_discount > 0}">
						<h4 style="color:red;">
							[${detail.s_discount}%]<fmt:formatNumber value="${detail.s_price-(detail.s_price*(detail.s_discount/100))}" type="currency" currencySymbol="\\"/>
						</h4>
					</c:if>
				</div>
			</div>
			<c:if test="${!empty m_id}">
			<div class="btn-group"> 
				<input type="button" class="buy" value="구매하기"><br>
				<input type="button" class="basket"  value="장바구니" id="basketBtn">
			</div>
			</c:if>
		</div>
	</div>
	<div class="productcontent">
		<div class="contentimg">
			<c:if test="${fn:endsWith(detail.dfilename,'.jpg') || 
        				  fn:endsWith(detail.dfilename,'.JPG') ||
        				  fn:endsWith(detail.dfilename,'.gif') ||
        			      fn:endsWith(detail.dfilename,'.GIF') ||
        				  fn:endsWith(detail.dfilename,'.png') ||
          				  fn:endsWith(detail.dfilename,'.PNG')}">
				<img src="imageView2.do?s_num=${detail.s_num}">
			</c:if>	 
		</div>
		<div class="contentimg">
			<c:if test="${fn:endsWith(detail.dfilename2,'.jpg') || 
        				  fn:endsWith(detail.dfilename2,'.JPG') ||
        				  fn:endsWith(detail.dfilename2,'.gif') ||
        			      fn:endsWith(detail.dfilename2,'.GIF') ||
        				  fn:endsWith(detail.dfilename2,'.png') ||
          				  fn:endsWith(detail.dfilename2,'.PNG')}">
				<img src="imageView3.do?s_num=${detail.s_num}">
			</c:if>	
		</div>
		<div class="contentimg">
			<c:if test="${fn:endsWith(detail.dfilename3,'.jpg') || 
        				  fn:endsWith(detail.dfilename3,'.JPG') ||
        				  fn:endsWith(detail.dfilename3,'.gif') ||
        			      fn:endsWith(detail.dfilename3,'.GIF') ||
        				  fn:endsWith(detail.dfilename3,'.png') ||
          				  fn:endsWith(detail.dfilename3,'.PNG')}">
				<img src="imageView4.do?s_num=${detail.s_num}">
			</c:if>	 
		</div>
		<div class="contenttext">
			<div id="text-box">
				[${detail.s_content}]
			</div>
		</div>
	</div>	
<!-- ============================ 상품 결제 및 상품 상세 소개 부분 ================================================== -->
	<!-- 리뷰 불러오기 -->
	<div id="listReview">
		
	</div>	
<!-- ============================ 리뷰 등록 및 별점 기능 구현 부분 ================================================== -->
	<div class="starpoint"> 
		<div class="card-img">
			<c:if test="${detail.staravg==1}"><div><img src="${pageContext.request.contextPath}/resources/images/star1.png" class="starimg"></div></c:if>	 
			<c:if test="${detail.staravg==2}"><div><img src="${pageContext.request.contextPath}/resources/images/star2.png" class="starimg"></div></c:if>	 
			<c:if test="${detail.staravg==3}"><div><img src="${pageContext.request.contextPath}/resources/images/star3.png" class="starimg"></div></c:if>	 
			<c:if test="${detail.staravg==4}"><div><img src="${pageContext.request.contextPath}/resources/images/star4.png" class="starimg"></div></c:if>	 
			<c:if test="${detail.staravg==5}"><div><img src="${pageContext.request.contextPath}/resources/images/star5.png" class="starimg"></div></c:if>	 
		</div>
	</div>
	<div class="storeReview">
		<form:form action="insertReview.do" name="reviewform" commandName="storeReviewVO">
			<form:hidden path="sr_star"/>
			<form:hidden path="s_num" value="${detail.s_num}"/>
			<c:if test="${m_id==null}">
				<textarea name="content" cols="65" rows="3" readonly="readonly">로그인 후 이용 가능한 서비스입니다.</textarea>
			</c:if>
			<c:if test="${m_id!=null}">
				<div id="rating" align="center">
					<span>
						<img id="image1" onmouseover=show(1) onclick=mark(1) onmouseout=noshow(1) src="${pageContext.request.contextPath}/resources/images/star00.png">
						<img id="image2" onmouseover=show(2) onclick=mark(2) onmouseout=noshow(2) src="${pageContext.request.contextPath}/resources/images/star00.png">
						<img id="image3" onmouseover=show(3) onclick=mark(3) onmouseout=noshow(3) src="${pageContext.request.contextPath}/resources/images/star00.png">
						<img id="image4" onmouseover=show(4) onclick=mark(4) onmouseout=noshow(4) src="${pageContext.request.contextPath}/resources/images/star00.png">
						<img id="image5" onmouseover=show(5) onclick=mark(5) onmouseout=noshow(5) src="${pageContext.request.contextPath}/resources/images/star00.png">
					</span>
					<span id="startext">별점주기</span>
				</div>
				<form:textarea path="sr_content" cols="65" rows="3"/>
				<input type="submit" class="srsubmit" value="등록하기">
			</c:if>
		</form:form>
	</div>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#basketBtn").click(function(){
				location.href="${pageContext.request.contextPath}/basket/basket.do?s_num=${detail.s_num}";
				var check = confirm("장바구니에 담겼습니다! \n장바구니로 이동하시겠습니까?")
				if(check == true){
					location.href='${pageContext.request.contextPath }/basket/storeBasket.do';
				}else if(check == false){
					return false;
				}
			});
		});
	</script>

</div>