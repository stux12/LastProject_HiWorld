<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
#main{
	height: 350px;
	width: 400px;
	overflow-x:hidden
	/* border: 1px solid pink; */
}
.skinImg{
	width: 200px;
}
#exeBtn{
	background-color: white;
	border: 1px solid gray;
	border-radius: 5px;
	cursor: pointer;
	float: right;
	margin-right: 60px;
}
</style>
<body>
	<h3>사용할 스킨을 선택하세요</h3>
	<div id="main">
		<c:forEach items="${list}" var="l">
			<c:choose>
				<c:when test="${l eq usingSkin}">
					<input type="radio" name="skin" value="${l}" checked>
				</c:when>
				<c:otherwise>
					<input type="radio" name="skin" value="${l}">
				</c:otherwise>
			</c:choose>
			<img alt="no found" src="${l}" class="skinImg">
			<br>
		</c:forEach>
	</div>
	<input id="exeBtn" type="button" value="적용" onclick="changeSkin();">
</body>
<script>
function changeSkin() {
	var src = $('input[name="skin"]:checked').val();
	$.ajax({
		type: 'POST',
		url: 'miniHp_skin.do/',
		data: {src:src}
	}).done(function() {
		$("#mainBody").css({"background":"url("+src+")"});
		setUsingBackGound();
	}).fail(function(error) {
		alert(JSON.stringify(error));
	});
}
</script>