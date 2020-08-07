<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
	*{
		margin:0;
		padding:0;
	}
	
	h2{
		margin-top:40px;
		text-align:center;
	}
	table{
		margin:40px auto;
		width:600px;
	}
	td{
		padding-left:10px;
	}
	#buy{
		padding:10px 10px;
	}
	img{
		width:100px;
	}
	#price{
		text-align:center;
	}
	#preview{
		border:3px solid gray;
		margin:30px auto;
		text-align:center;
		height:50px;
	}
	input[type="submit"]{
		width:70px;
		height:30px;
		margin-left:500px;
		background-color:#289ca0;
		color:white;
		font-size:1.3em;
		font-weight:bold;
	}
	span{
		font-size:20px;
		font-weight:bold;
	}
	span#total{
		color:red;
	}
</style>
<script type="text/javascript">
	var product = { 
			c0:200000,
			c1:100000,
			c2:50000,
			c3:150000,
			c4:100000
	};
	window.onload=function(){
		//상품 합계
		var sum =0;
		//배송비
		var ship = 0;
		
		
		
		//var inputs = document.getElementsByName('goods');
		var inputs = document.getElementsByName('products');
		
		for(var i=0;i<inputs.length;i++){
			inputs[i].onclick=function(){
				//상품을 선택하게 되면 해당 상품의 가격을 읽어들여 
				//배송비를 계산하고, 전체 지불 금액을 표시
				//이벤트가 발생한 태그의 id -> this.id			
				//선택한 상품의 가격 -> product[this.id]
				if(this.checked){//체크박스 선택시
					sum += Number(this.value);//선택시 가격 누적
				}else{//체크박스 해제시
					sum -= Number(this.value);//선택을 해제하면 가격을 차감
				}
				
				//sum이 0이면 배송비도 0이어야 하기 때문에 sum>0 조건 필요
				if(sum>0 && sum< 50000){
					ship = 3000;
				}else{
					ship = 0;
				}
				
				var p_price = document.getElementById('p_price');
				var p_ship = document.getElementById('ship');
				var p_total = document.getElementById('total');
				//지불금액 미리보고
				p_price.innerHTML = sum;
				p_ship.innerHTML = ship;
				p_total.innerHTML = sum+ship;
			};
		}
		
	}
</script>
</head>
<div id="body">

	<h2>상품 구매</h2>
	<form action="order.jsp" method="post">
		<table border="1">
			<caption>장바구니</caption>
			<tr>
				<th>상품정보</th>
				<th>상품금액</th>
				<th>배송비</th>
				<th></th>
			</tr>
			<c:forEach var="basket" items="${basket }">
				<tr>
					<td>
					<span><a href="#"><img src="imageView.do?s_num=${basket.s_num}" height="100px"></a></span>	
					<span>${basket.s_title }</span>
					<span>${basket.s_content }</span>
					</td>
					<td>${basket.s_price}원 </td>
					<td>3000원</td>
					<td><input type="button" onclick="location.href='${pageContext.request.contextPath}/basket/deleteBasket.do?p_num=${basket.p_num}'" value="삭제"></td>
					<td><input type="checkbox" name="products" value="${basket.s_price}"></td>
				</tr>
			</c:forEach>
		</table>
		
		
		<!----------------------------------- 예전 --------------------------------------- -->
		<table>
			<tr height="100">
				<td colspan="5">
					*<b>5만원 미만 결제</b>시 3,000원의 배송비가 추가됩니다.
				</td>
			</tr>
			<tr>
				<td id="preview" colspan="5">
					총 상품가격 <span id="p_price">0</span> 원 +
					총 배송비 <span id="ship">0</span> 원 =
					총 주문금액 <span id="total">0</span> 원
				</td>
			</tr>
			<tr>
				<td id="buy" colspan="5">
					<input type="submit" value="buy">
				</td>
			</tr>
		</table>	
	</form>
</div>
