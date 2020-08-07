<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script type="text/javascript">
	$(document).ready(function(){

		$('#topinfo').change(function(){
			if($('#topinfo').is(":checked")){
				$('#mb_topinfo').prop('type', 'text');
			}else{
				$('#mb_topinfo').prop('type', 'hidden');
			}
		});
		$('#pantsinfo').change(function(){
			if($('#pantsinfo').is(":checked")){
				$('#mb_pantsinfo').prop('type', 'text');
			}else{
				$('#mb_pantsinfo').prop('type', 'hidden');
			}
		});
		$('#capinfo').change(function(){
			if($('#capinfo').is(":checked")){
				$('#mb_capinfo').prop('type', 'text');
			}else{
				$('#mb_capinfo').prop('type', 'hidden');
			}
		});
		$('#shoesinfo').change(function(){
			if($('#shoesinfo').is(":checked")){
				$('#mb_shoesinfo').prop('type', 'text');
			}else{
				$('#mb_shoesinfo').prop('type', 'hidden');
			}
		});
		
		/* 사진 미리보기 기능 */
		$("#changeFilebtn").hide();
		$("#addPicture").click(function(){
			$("#upload").click();
		});
		$("#changeFilebtn").click(function(){
			$("#image_container").empty();
			$("#changeFilebtn").hide();	
			$("#addPicture").show();
		});
		
	});
	function setThumbnail(event){
		var reader = new FileReader();
		
		reader.onload = function(event){
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			
			document.querySelector("div#image_container").appendChild(img);
			$("#addPicture").hide();
			$("#changeFilebtn").show();
		};
		reader.readAsDataURL(event.target.files[0]);
	};

	
	
</script>
<div id="body">
	<div id="main-form">
		<h2>글쓰기</h2>
		<form:form action="write.do" id="mainwriteForm" enctype="multipart/form-data" commandName="mainBoardVO">
			<form:hidden path="m_num" value="${m_num }"/>
			<ul>  
				<li>
					<label for="photo">사진추가</label>
					<a id="addPicture" href="#">
						<img src="${pageContext.request.contextPath }/resources/images/addpicture.png" >
					</a>
					<input type="file" name="upload" id="upload" onchange="setThumbnail(event)" hidden/>
					<!-- 사진 미리보기창 -->
					<div id="image_container">
						
					</div>
					<a id="changeFilebtn" href="#">다른사진으로 변경</a>
				</li>
				<li>
					<label for="title">제목</label>
					<form:input path="mb_title" required="required"/><form:errors path="mb_title" cssClass="error-color"/>
				</li>
				<li>
					<label for="content">내용</label>
					<form:textarea path="mb_content"/><form:errors path="mb_content" cssClass="error-color"/>
				</li>
				<li class="category">
					<label for="tag">태그선택</label><br>
					<input type="checkbox" id="topinfo" value="상의"><b>상의</b>
					<input type="checkbox" id="pantsinfo" value="하의"><b>하의</b>
					<input type="checkbox" id="capinfo" value="모자"><b>모자</b>
					<input type="checkbox" id="shoesinfo" value="신발"><b>신발</b>
				</li>
				<li>
					<form:hidden path="mb_topinfo" placeholder="상의정보 (ex: https://smartstore.naver.com/store/products/4101500072)" required="required"/>
					<form:hidden path="mb_pantsinfo" placeholder="하의정보 (ex: https://smartstore.naver.com/store/products/4101500072)" required="required"/>
					<form:hidden path="mb_capinfo" placeholder="모자정보 (ex: https://smartstore.naver.com/store/products/4101500072)" required="required"/>
					<form:hidden path="mb_shoesinfo" placeholder="신발정보 (ex: https://smartstore.naver.com/store/products/4101500072)" required="required"/>
				</li>
			</ul>
			<div class="align-center">
				<input type="submit" value="전송">
				<input type="button" value="홈으로" id="homebtn" onclick="location.href='main.do'">
			</div>
		</form:form>
	
	</div>
</div>