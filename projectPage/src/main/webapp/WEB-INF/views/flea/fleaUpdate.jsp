<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<script type="text/javascript">
	$(document).ready(function(){
		if($('#fb_topcheck').val() != 1){
			$('#fb_topcheck').prop("checked", true);
		}
		if($('#fb_bottomcheck').val() != 1){
			$('#fb_bottomcheck').prop("checked", true);
		}
		if($('#fb_hatcheck').val() != 1){
			$('#fb_hatcheck').prop("checked", true);
		}
		if($('#fb_shoescheck').val() != 1){
			$('#fb_shoescheck').prop("checked", true);
		}
	});
	
	function setThumbnail(event){
		var reader = new FileReader();
		
		reader.onload = function(event){
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			img.setAttribute("width", "300px");
			
			$("div#image_container").empty();
			document.querySelector("div#image_container").appendChild(img);
			$("#addPicture").hide();
			$("#changeFilebtn").show();
			$("#origin_picture").hide();
		};
		reader.readAsDataURL(event.target.files[0]);
	};
	
</script>
<div id="body">
	<h2>물품수정</h2>
	<form:form action="fleaUpdate.do" enctype="multipart/form-data" commandName="fleaVO">
		<form:hidden path="fb_num"/>
		<div class="align-center" id="origin_picture">
			<img src="imageView.do?mb_num=${mainBoardVO.mb_num}" style="max-width:500px">
		</div>
		<div id="image_container">

		</div>
		<ul>
			<li>
				<label for="photo">사진변경</label>
				<input type="file" name="upload" id="upload" onchange="setThumbnail(event)"/>
			</li>
			<li>
				<label for="fb_title">제목</label>
				<form:input path="fb_title" required="required"/>
				<form:errors path="fb_title" cssClass="error-color"/>
			</li>
			<li>
				<label for="fb_price">가격</label>
				<form:input path="fb_price"/>
				<form:errors path="fb_price" cssClass="error-color"/>
			</li>
			<li>
				<label for="fb_content">내용</label>
				<form:textarea path="fb_content"/>
				<form:errors path="fb_content" cssClass="error-color"/>
			</li>
			<li class="category">
				<label>태그선택</label><br>
				<form:checkbox path="fb_topcheck" value="1"/><b>상의</b>
				<form:checkbox path="fb_bottomcheck" value="1"/><b>하의</b>
				<form:checkbox path="fb_hatcheck" value="1"/><b>모자</b>
				<form:checkbox path="fb_shoescheck" value="1"/><b>신발</b>
			</li>
		</ul>
		<div class="align-center">
			<input type="submit" value="전송">
			<input type="button" value="목록" id="homebtn" onclick="location.href='fleaList.do'">
		</div>
	</form:form>
</div>