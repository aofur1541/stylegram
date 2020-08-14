<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script type="text/javascript">
	$(document).ready(function(){
		
		/* 사진 미리보기 기능 */
		$("#changeFilebtn").hide();
		$("#addPicture").click(function(){
			$("#upload").click();
		});
		$("#changeFilebtn").click(function(){
			$("#image_container").empty();
			$("#changeFilebtn").hide();	
			$("#addPicture").show();
			$("#upload").click();
		});
		
	});
	
	function setThumbnail(event){
		var reader = new FileReader();
		
		reader.onload = function(event){
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			img.setAttribute("width", "300px");
			
			document.querySelector("div#image_container").appendChild(img);
			$("#addPicture").hide();
			$("#changeFilebtn").show();
		};
		reader.readAsDataURL(event.target.files[0]);
	};
	
</script>
<div id="body">
	<h2>글쓰기</h2>
	<form:form action="fleaWrite.do" enctype="multipart/form-data" commandName="fleaVO">
		<ul>
			<li>
				<label for="upload">사진</label>
				<a id="addPicture" href="#">
					<img src="${pageContext.request.contextPath }/resources/images/addpicture.png" class="addimg">
				</a>
				<input type="file" name="upload" id="upload" onchange="setThumbnail(event)" hidden/>
				<!-- 사진 미리보기창 -->
				<div id="image_container">

				</div>
				<a id="changeFilebtn" href="#">다른사진으로 변경</a>
			</li>
			<li>
				<label for="fb_title">제목</label>
				<form:input path="fb_title" required="required"/>
				<form:errors path="fb_title" cssClass="error-color"/>
			</li>
			<li class="category">
				<form:checkbox path="fb_topcheck" value="checked"/><b>상의</b>
				<form:checkbox path="fb_bottomcheck" value="checked"/><b>하의</b>
				<form:checkbox path="fb_hatcheck" value="checked"/><b>모자</b>
				<form:checkbox path="fb_shoescheck" value="checked"/><b>신발</b>
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
		</ul>
		<div class="align-center">
			<input type="submit" value="전송">
			<input type="button" value="목록" onclick="location.href='fleaList.do'">
		</div>
	</form:form>
</div>