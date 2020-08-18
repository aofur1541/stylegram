<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">
	window.onpageshow = function(event){
		
		if(event.persisted || (window.performance && window.performance.navigation.type==2)){
			location.reload();
		}
		
		//상품 합계
		var sum =0;
		//배송비
		var ship = 0;
		
		var inputs = $("input[name='products']");
		
		for(var i=0;i<inputs.length;i++){
			$(inputs[i]).click(function(){
				var value = this.value;
				var price = $('td.'+value+' input.price').val();
				var stock = $('td.'+value+' input.stock').val();
				if(this.checked){//체크박스 선택시
					sum += Number(price)*Number(stock);//선택시 가격 누적
				}else{//체크박스 해제시
					sum -= Number(price)*Number(stock);//선택을 해제하면 가격을 차감
				}
				
				if(sum>0 && sum< 50000){
					ship = 3000;
				}else{
					ship = 0;
				}
				
				//지불금액 미리보고
				$('#p_price').text(sum);
				$('#ship').text('+ ' + ship);
				$('#total').text(sum+ship);
				$('#pa_price').val(sum);
				$('#pa_ship').val(ship);
				$('#total_price').val(sum+ship);
			});
		}
		
		$('.basketBuyForm').submit(function(event){
			 var output = '';
			  $('input[type=checkbox]:checked').each(function(index,item){
			    if(index!=0){
			       output += ',';
			    }
			    output += $(this).val();
			 });
			 $('#p_nums').val(output);
			 if($('#p_nums').val() == ''){
				 alert("구매하실 상품을 선택하세요");
				 return false;
			 }
		});
		
	}
</script>
</head>
<div id="body">
	<h2>장바구니</h2>
	<c:if test="${count == 0}">
		<br><br>
		<h3>장바구니가 비어있습니다.</h3>
		<div>
			<input type="button" value="쇼핑하러가기" id="homebtn" class="homebtn" onclick="location.href='${pageContext.request.contextPath}/store/storeDetail.do'">
		</div>
	</c:if>
	<c:if test="${count > 0}">
	<form:form action="basketBuy.do" commandName="storeVO" class="basketBuyForm">
	    <input type="hidden" name="p_nums" id="p_nums">
	    <input type="hidden" name="pa_price" id="pa_price">
	    <input type="hidden" name="pa_ship" id="pa_ship">
	    <input type="hidden" name="total_price" id="total_price">
		<c:if test="${!empty m_id}">
			<form:hidden path="m_num"/>
		</c:if>
			<table class="baskettable">
				<tr>
					<th></th>
					<th>상품정보</th>
					<th>상품금액</th>
					<th>구매수량</th>
					<th>삭제</th>
				</tr>
				<c:forEach var="basket" items="${basket}">
					<form:hidden path="s_num" value="${basket.s_num}"/>
					<form:hidden path="p_num" value="${basket.p_num}"/>
					<tr>
						<td>
							<input type="checkbox" class="chk" name="products" value="${basket.p_num}">
						</td>
						<td class="productTd">
							<div id="productImg"><a href="${pageContext.request.contextPath}/store/productDetail.do?s_num=${basket.s_num}"><img src="imageView.do?s_num=${basket.s_num}"></a></div>	
							<div id="productTitle">${basket.s_title}</div>
						</td>
						<td class="${basket.p_num}">
							<input type="hidden" value="${basket.s_price-(basket.s_price*(basket.s_discount/100))}" class="price">
							<fmt:formatNumber value="${basket.s_price-(basket.s_price*(basket.s_discount/100))}" type="number"/>원
						</td>
						<td class="${basket.p_num}">
							<input type="hidden" value="${basket.a_num}" class="stock">
							${basket.a_num} 개
							<form:hidden path="a_num" value="${basket.a_num}"/>
						</td>
						<td><input type="button" class="basketdelbtn" onclick="location.href='${pageContext.request.contextPath}/basket/deleteBasket.do?p_num=${basket.p_num}'" value="삭제"></td>
					</tr>
				</c:forEach>
			</table>
		<div>
			<h3><b>5만원 미만 결제</b>시 3000원의 배송비가 추가됩니다.</h3>
			<div>
				<div>
					총 상품금액<span id="p_price">0</span><br>
					총 배송비<span id="ship">+ 0</span><br>
					총 결제 예상 금액<span id="total">0</span>
				</div>
				<input type="button" value="계속 쇼핑하기" id="homebtn" class="homebtn" onclick="location.href='${pageContext.request.contextPath}/store/storeDetail.do'">
				<input type="submit" value="구매하기">
			</div>
		</div>
	</form:form>
	</c:if>
</div>

