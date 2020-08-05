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
		
		var inputs = document.getElementsByName('goods');
		for(var i=0;i<inputs.length;i++){
			inputs[i].onclick=function(){
				//상품을 선택하게 되면 해당 상품의 가격을 읽어들여 
				//배송비를 계산하고, 전체 지불 금액을 표시
				//이벤트가 발생한 태그의 id -> this.id			
				//선택한 상품의 가격 -> product[this.id]
				if(this.checked){//체크박스 선택시
					sum += product[this.id];//선택시 가격 누적
				}else{//체크박스 해제시
					sum -= product[this.id];//선택을 해제하면 가격을 차감
				}
				
				//sum이 0이면 배송비도 0이어야 하기 때문에 sum>0 조건 필요
				if(sum>0 && sum< 300000){
					ship = 50000;
				}else{
					ship = 0;
				}
				
				var spans = document.getElementsByTagName('span');
				//지불금액 미리보고
				spans[0].innerHTML = sum;
				spans[1].innerHTML = ship;
				spans[2].innerHTML = sum+ship;
			};
		}
		
	}
</script>
</head>
<div id="body">
<!-- 구매 물건 : 가방(20만원),코트(10만원),청바지(5만원),식사권(15만원),신발(10만원) -->
	<h2>상품 구매</h2>
	<form action="order.jsp" method="post">
		<table border="1">
			<caption>장바구니</caption>
			<tr>
				<td>사진</td>
				<td>상품정보</td>
				<td>상품금액</td>
				<td>배송비</td>
			</tr>
			<c:forEach var="basket" items="${basket }">
				<tr>
					<td>
					<img src="imageView.do?s_num=${basket.s_num}" width="30px">
					</td>
					<td>
					${basket.s_title }<br>
					${basket.s_content }
					</td>
					<td>${basket.s_price} </td>
					<td>3000원</td>
				</tr>
			</c:forEach>
		</table>
		<table>
			<tr>
				<td><img src="../images/bag.jpg"></td>
				<td><img src="../images/coat.jpg"></td>
				<td><img src="../images/jeans.jpg"></td>
				<td><img src="../images/giftCard.jpg"></td>
				<td><img src="../images/shoes.jpg"></td>
			</tr>
			<tr>
				<td>
					<input id="c0" class="select" type="checkbox" name="goods" value="bag"> bag
				</td>
				<td>
					<input id="c1" class="select" type="checkbox" name="goods" value="coat"> coate
				</td>
				<td>
					<input id="c2" class="select" type="checkbox" name="goods" value="jeans"> jeans
				</td>
				<td>
					<input id="c3" class="select" type="checkbox" name="goods" value="giftCard"> giftCard
				</td>								
				<td>
					<input id="c4" class="select" type="checkbox" name="goods" value="shoes"> shoes
				</td>							
			</tr>
			<tr id="price">
				<td>(20만원)</td>
				<td>(10만원)</td>
				<td>( 5만원)</td>
				<td>(15만원)</td>
				<td>(10만원)</td>
			</tr>
			<tr height="100">
				<td colspan="5">
					*<b>30만원 미만 결제</b>시 5,000원의 배송비가 추가됩니다.
				</td>
			</tr>
			<tr>
				<td id="preview" colspan="5">
					총 상품가격 <span>0</span> 원 +
					총 배송비 <span>0</span> 원 =
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
