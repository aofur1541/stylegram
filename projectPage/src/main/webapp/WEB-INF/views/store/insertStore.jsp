<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.0.min.js"></script>
<script type="text/javascript">
	/*
	파일 업로드 시 미리보기를 제공하는 코드입니다.
	*/
	
	//표시할 이미지를 관리할 변수 지정
	//이미지를 다중 표시하고 싶을 경우 변수를 배열로 지정
	var imageDetail;
	var imageDetails = [];
	var imageDetailsSec = [];
	var imageDetailsThd = [];

	//단일 이미지 표시 : img태그 생성 후 이벤트 연결
	//다중 이미지 표시 : div태그 생성 후 이벤트 연결
	$(document).ready(function(){
		$("#upload").on("change",handleImgFileSelect);
		$("#dupload").on("change",handleImgsFilesSelect);   
		$("#dupload2").on("change",handleImgsFilesSelectSec);   
		$("#dupload3").on("change",handleImgsFilesSelectThd);   		
	});
	
	//단일 이미지 표시용 함수
	function handleImgFileSelect(e){
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		filesArr.forEach(function(f){
			if(!f.type.match("image.*")){
				alert("이미지 파일만 열람 가능합니다.");
				return;
			}
			
			imageDetail = f;
			
			var reader = new FileReader();
			reader.onload = function(e){
				//.attr 속성을 이용하여 img 태그의 src 속성에 읽어온 데이터를 연결
				$("#img").attr("src",e.target.result);
			}
			reader.readAsDataURL(f);		
		});
	}
	
	//다중 이미지 표시용 함수
	function handleImgsFilesSelect(e){
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		filesArr.forEach(function(f){
			if(!f.type.match("image.*")){
				alert("이미지 파일만 열람 가능합니다.");
				return;
			}
			
			imageDetails.push(f);
			
			var reader = new FileReader();
			reader.onload = function(e){
				//이미지 주소를 저장할 변수 지정
				var imgs_html = "<img src=\"" + e.target.result +"\"/>";
				//이미지를 선택할 때마다 .append 속성을 통해 div태그에 주소를 붙여줌
				$(".imgs").append(imgs_html);
				//붙여넣은 이미지 파일의 크기를 조절하기 위한 코드(자유롭게 조절 가능)
				$(".imgs").find("img").attr('width','50px');
			}
			reader.readAsDataURL(f);		
		});
	}
	
	function handleImgsFilesSelectSec(e){
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		filesArr.forEach(function(f){
			if(!f.type.match("image.*")){
				alert("이미지 파일만 열람 가능합니다.");
				return;
			}
			
			imageDetailsSec.push(f);
			
			var reader = new FileReader();
			reader.onload = function(e){
				var imgs_html = "<img src=\"" + e.target.result +"\"/>";
				$(".imgs2").append(imgs_html);
				$(".imgs2").find("img").attr('width','50px');
			}
			reader.readAsDataURL(f);		
		});
	}
	
	function handleImgsFilesSelectThd(e){
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		filesArr.forEach(function(f){
			if(!f.type.match("image.*")){
				alert("이미지 파일만 열람 가능합니다.");
				return;
			}
			
			imageDetailsThd.push(f);
			
			var reader = new FileReader();
			reader.onload = function(e){
				var imgs_html = "<img src=\"" + e.target.result +"\"/>";
				$(".imgs3").append(imgs_html);
				$(".imgs3").find("img").attr('width','50px');
			}
			reader.readAsDataURL(f);		
		});
	}

</script>
<div id="body">
	<form:form action="insertProduct.do" enctype="multipart/form-data" commandName="storeVO">
		<ul>
			<li>
				<img id="img" width="300"><!-- 단일 이미지 표시를 위한 img태그 -->
			</li>
			<li>
				<label for="upload">사진업로드</label>
				<input type="file" name="upload" id="upload">
			</li>
			<li>
				<label for="s_title">상품명</label>
				<form:input path="s_title"/>
				<form:errors path="s_title"/>
			</li>
			<li>
				<label for="s_price">상품가격</label>
				<form:input path="s_price"/>
				<form:errors path="s_price"/>
			</li>
			<li>
				<label for="s_discount">할인율</label>
				<form:input path="s_discount"/>
				<form:errors path="s_discount"/>
			</li>
			<li>
				<label for="s_ship">배송비 여부</label>
				<input type="radio" name="s_ship" id="s_ship" value="1"/>배송비 있음
				<input type="radio" name="s_ship" id="s_ship" checked value="0"/>무료배송
				<form:errors path="mdpick"/>
			</li>
			<li>
				<label for="s_shipcost">배송비</label>
				<form:input path="s_shipcost"/>
				<form:errors path="s_shipcost"/>
			</li>
			<li>                 
				<label for="s_content">상품 상세</label>
				<form:textarea path="s_content"/>
				<form:errors path="s_content"/>
			</li>
			<li>
				<div class="imgs"></div><!-- 다중 이미지 표시를 위한 div태그 -->
			</li>
			<li>
				<label for="dupload">상품배너</label>
				<input type="file" name="dupload" id="dupload">
			</li>
			<li>
				<div class="imgs2"></div><!-- 다중 이미지 표시를 위한 div태그 -->
			</li>
			<li>
				<label for="dupload2">상품설명</label>
				<input type="file" name="dupload2" id="dupload2">
			</li>
			<li>
				<div class="imgs3"></div><!-- 다중 이미지 표시를 위한 div태그 -->
			</li>
			<li>
				<label for="dupload3">상품제원</label>
				<input type="file" name="dupload3" id="dupload3">
			</li>
			<li>
				<label for="radio">MD추천 여부</label>
				<input type="radio" name="mdpick" id="radio" value="1"/>MD추천	
				<input type="radio" name="mdpick" id="radio" checked value="0"/>일반상품
				<form:errors path="mdpick"/>
			</li>
		</ul>
		<div class="align-center">
			<input type="submit" id="submitBtn" value="등록하기">
			<input type="button" value="목록으로" onclick="location.href='list.do'">
		</div>	
	</form:form>
</div>

