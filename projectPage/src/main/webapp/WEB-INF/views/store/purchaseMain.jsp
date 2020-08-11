<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
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
<style>
    table {
      border-collapse: collapse;
      border-top: 3px solid #168;
      margin:0 0 30 0;
      width:1200px;
    }  
    table th {
      color: #168;
      background: #f0f6f9;
      text-align: center;
    }
    table th, table td {
      padding: 10px;
      border: 1px solid #ddd;
    }
    table th:first-child, table td:first-child {
      border-left: 0;width:200px;text-align:left;
    }
    table th:last-child, table td:last-child {
      border-right: 0;
    }
    table tr td:first-child{
      text-align: center;
    }
    table caption{caption-side: bottom; display: none;}
  </style>
<div id="body">
		<h2>결제정보</h2>
		<table>
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
		<table>
			<tr>
				<th colspan="2">받는사람 정보</th>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text"></td>
			</tr>
			<tr>
				<td>배송주소</td>
				<td>
					<input type="text" id="sample6_postcode" placeholder="우편번호">
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="sample6_address" placeholder="주소"><br>
					<input type="text" id="sample6_detailAddress" placeholder="상세주소">
					<input type="text" id="sample6_extraAddress" placeholder="참고항목">
				</td>
			</tr>
			<tr>
				<td>연락처</td>
				<td><input type="text"></td>
			</tr>
		</table>
		<table>
			<tr>
				<th>상품정보</th>
			</tr>
			<tr>
				<td>배송예정일 : ${store.shipdate}</td>
			</tr>
			<tr>
				<td>상품명 : ${store.s_title}</td>
			</tr>
			<tr>
				<td>구매수량 : ${store.a_num}개</td>
			</tr>
		</table>
		<table>
			<tr>
				<th colspan="2">결제정보</th>
			</tr>
			<tr>
				<td>상품가격</td>
				<td><fmt:formatNumber value="${store.s_price}" type="number"/>원</td>
			</tr>
			<tr>
				<td>할인</td>
				<td><fmt:formatNumber value="${store.s_discount}" type="currency"/>%</td>
			</tr>
			<tr>
				<td>배송비</td>
				<td>
					<c:if test="${store.s_shipcost==0}">무료</c:if>
					<c:if test="${store.s_shipcost>0}"><fmt:formatNumber value="${store.s_shipcost}" type="currency"/></c:if>
				</td>
			</tr>
			<tr>
				<td>총결제금액</td>
				<td><fmt:formatNumber value="${(store.s_price-(store.s_price*(store.s_discount/100))+store.s_shipcost)*store.a_num}" type="currency"/></td>
			</tr>
		</table>
		<input type="button" value="돌아가기">
		<input type="submit" value="구매하기">
</div>


