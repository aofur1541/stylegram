<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" contentType = "text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.0.min.js"></script>
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
		document.reviewform.star.value=star;
	}
	
</script>
<div id="body">
	<div class="card-board">
		<div class="card-sheet">
			<div class="card-img">
				<c:if test="${fn:endsWith(normal.filename,'.jpg') || 
	        				  fn:endsWith(normal.filename,'.JPG') ||
	        				  fn:endsWith(normal.filename,'.gif') ||
	        			      fn:endsWith(normal.filename,'.GIF') ||
	        				  fn:endsWith(normal.filename,'.png') ||
	          				  fn:endsWith(normal.filename,'.PNG')}">
					<div><img src="imageView.do?s_num=${detail.s_num}" style="width:300px;height:400px;"></div>
				</c:if>	
			</div>
		<div class="card-content">
			<div id="text-box"><b>${detail.s_title}</b></div>
				<div id="text-box">
					<c:if test="${detail.s_discount == ''}">
						${detail.s_price}
					</c:if>
					<c:if test="${detail.s_discount > 0}">
						[${detail.s_discount}%]${detail.s_price}
					</c:if>
				</div>
			</div>
		</div>
	</div>
		<form:form action="insertReview.do" name="reviewform" commandName="storeReviewVO">
		<table width="700">
		<tr>
			<td width="100" rowspan="2">${m_id}</td>
			<td width="500" height="50" colspan="2">
				<div id="rating" align="center">
					<span>
					<!-- onmouseover : 마우스오버 상태에서 show()메서드를 매개변수1로 실행 -->
					<!-- onclick : 클릭 시 mark() 실행 -->
						<img id="image1" onmouseover=show(1) onclick=mark(1) onmouseout=noshow(1) src="${pageContext.request.contextPath}/resources/images/star00.png">
						<img id="image2" onmouseover=show(2) onclick=mark(2) onmouseout=noshow(2) src="${pageContext.request.contextPath}/resources/images/star00.png">
						<img id="image3" onmouseover=show(3) onclick=mark(3) onmouseout=noshow(3) src="${pageContext.request.contextPath}/resources/images/star00.png">
						<img id="image4" onmouseover=show(4) onclick=mark(4) onmouseout=noshow(4) src="${pageContext.request.contextPath}/resources/images/star00.png">
						<img id="image5" onmouseover=show(5) onclick=mark(5) onmouseout=noshow(5) src="${pageContext.request.contextPath}/resources/images/star00.png">
					</span>
					<br><span id="startext">평가하기</span>
				</div>
				<input type="hidden" name="star">
			</td>
			<td width="100" rowspan="2"><input type="submit" name="submit" value="submit"></td>
			<input type="hidden" name="product" value="${detail.s_num}">
		</tr>
		<tr>
			<c:if test="${m_id==null}">
				<td width="500" height="100" colspan="2">
					<textarea name="content" cols="65" rows="7" readonly="readonly">로그인 후 이용 가능한 서비스입니다.</textarea>
				</td>
			</c:if>
			<c:if test="${m_id!=null}">
				<td width="500" height="100" colspan="2"><textarea name="content" cols="65" rows="7"></textarea></td>
			</c:if>
		</tr>
		</table>
	</form:form>
	<c:if test="${count != 0}">
		<table width="700">
<%-- 		<c:forEach var="review" items="${detail}"> --%>
			<tr>
				<td rowspan="3" width="100">${m_id}</td>
				<td width="550" height="20">
					<font size="5" border="border">${m_id}</font>
					<font size="1">${sr_regdate}</font>					
				</td>
				<td width="50">
					<c:if test="${m_id == admin}">
						<a href="삭제폼">삭제</a>
					</c:if>
				</td>
			</tr>
			<tr>
				<td colspan="2" width="600">${sr_star}
					<c:if test="${review.sr_star == 1}"><img src="${pageContext.request.contextPath}/resources/images/star1.png"></c:if>
					<c:if test="${review.sr_star == 2}"><img src="${pageContext.request.contextPath}/resources/images/star2.png"></c:if>
					<c:if test="${review.sr_star == 3}"><img src="${pageContext.request.contextPath}/resources/images/star3.png"></c:if>
					<c:if test="${review.sr_star == 4}"><img src="${pageContext.request.contextPath}/resources/images/star4.png"></c:if>
					<c:if test="${review.sr_star == 5}"><img src="${pageContext.request.contextPath}/resources/images/star5.png"></c:if>
				</td>
			</tr>
			<tr>
				<td height="100" colspan="2">${sr_content}</td>
			</tr>
<%-- 		</c:forEach> --%>
		</table>
	</c:if>
	<!-- 장바구니 -->
	<div id="basket" class="basket">
		<a id="basket-icon">
			<img src="${pageContext.request.contextPath}/resources/images/shoppingBag.png" width="30px">장바구니
		</a>
	</div>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#basket-icon").click(function(){
				location.href="${pageContext.request.contextPath}/basket/basket.do?s_num=${detail.s_num}";
				var check = confirm("장바구니에 담겼습니다! \n장바구니로 이동하시겠습니까?")
				if(check == true){
					location.href='${pageContext.request.contextPath }/store/storeBasket.do';
				}else if(check == false){
					
				}
			});
		});
	</script>
</div>


















































