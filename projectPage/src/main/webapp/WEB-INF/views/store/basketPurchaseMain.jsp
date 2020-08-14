<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	$(document).ready(function(){
		$('.buyerinfo').change(function(){
			if($('#b').is(":checked")){
				$('#p_name').val('${member.m_name}');
				$('#p_post').val('${member.m_postcode}');
				$('#p_address').val('${member.m_address}');
				$('#p_detailaddress').val('${member.m_detailaddress}');
				$('#p_phone').val('${member.m_phone}');
			}else if($('#a').is(":checked")){
				$('#p_name').val('');
				$('#p_post').val('');
				$('#p_address').val('');
				$('#p_detailaddress').val('');
				$('#p_phone').val('');
			}
		});
		
		$('.basketBuyForm').submit(function(event){
			 var output = '';
			  $('.p_num').each(function(index,item){
			    if(index!=0){
			       output += ',';
			    }
			    output += $(this).val();
			 });
			 $('#p_nums').val(output);
		});
		
	}); 
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
<div id="body">
	<h2>결제정보</h2>
	<form:form action="insertBasketPurchase.do" commandName="storePurchaseVO" class="basketBuyForm">
		<input type="hidden" name="p_nums" id="p_nums">
		<table class="purchasetable">
			<tr>
				<th colspan="2">구매자 정보</th>
			</tr>
			<tr>
				<td>이름</td>
				<td>${member.m_name}</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>${member.m_address}</td>
			</tr>
			<tr>
				<td>연락처</td>
				<td>${member.m_phone}</td>
			</tr>
		</table>
		<table class="purchasetable">
			<tr>
				<th colspan="2">받는사람 정보
					<input type="radio" name="buyerinfo" id="a" class="buyerinfo" checked>직접입력
					<input type="radio" name="buyerinfo" id="b" class="buyerinfo">구매자와 동일
				</th>
			</tr>
			<tr>
				<td>이름</td>
				<td>
					<form:input path="p_name"/>
					<form:errors path="p_name"/>
				</td>
			</tr>
			<tr>
				<td>배송주소</td>
				<td>
					<form:input path="p_post" placeholder="우편번호"/>
					<form:errors path="p_post"/>
					<input type="button" onclick="postSearch()" value="우편번호 찾기"><br>
					<form:input path="p_address" placeholder="주소"/>
					<form:errors path="p_address"/>
					<form:input path="p_detailaddress" placeholder="상세주소"/>
					<form:errors path="p_detailaddress"/>
				</td>
			</tr>
			<tr>
				<td>연락처</td>
				<td>
					<form:input path="p_phone"/>
					<form:errors path="p_phone"/>
				</td>
			</tr>
		</table>
		<c:forEach var="purchase" items="${purchaseList}">
			<input type="hidden" id="p_num" name="p_num" class="p_num" value="${purchase.p_num}">
			<table class="purchasetable">
				<tr>
					<th>상품정보</th>
				</tr>
				<tr>
					<td>배송예정일 : ${purchase.shipdate}</td>
				</tr>
				<tr>
					<td>상품명 : ${purchase.s_title}</td>
				</tr>
				<tr>
					<td>구매수량 : ${purchase.a_num}개</td>
				</tr>
			</table>
		</c:forEach>
		<table class="purchasetable">
			<tr>
				<th colspan="2">결제정보</th>
			</tr>
			<tr>
				<td>총 상품금액</td>
				<td><fmt:formatNumber value="${pa_price}" type="number"/>원</td>
			</tr>
			<tr>
				<td>배송비</td>
				<td>
					<c:if test="${pa_ship != 0}">
					<fmt:formatNumber value="${pa_ship}" type="number"/>원
					</c:if>
					<c:if test="${pa_ship == 0}">
					무료
					</c:if>
				</td>
			</tr>
			<tr>
				<td>총 결제 금액</td>
				<td><fmt:formatNumber value="${total_price}" type="number"/>원</td>
			</tr>
		</table>
		<input type="submit" id="buybtn" value="구매하기">
		<input type="button" id="homebtn" class="homebtn" value="돌아가기" onclick="location.href='storeBasket.do'">
	</form:form>
</div>


