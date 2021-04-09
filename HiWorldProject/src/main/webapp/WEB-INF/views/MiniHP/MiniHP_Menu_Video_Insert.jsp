<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
#menuVideoInsert {
  border-collapse: collapse;
  line-height: 1.5;
  border-left: 1px solid #ccc;
  margin: 20px 10px;
  height: 400px;
}

#menuVideoInsert thead th {
  font-weight: bold;
  border-top: 1px solid #ccc;
  border-right: 1px solid #ccc;
  background: #E6E6E6;
}
#menuVideoInsert tbody th {
  font-weight: bold;
  border-right: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
  background: #ececec;
}
#menuVideoInsert td {
  width: 350px;
  vertical-align: top;
  border-right: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
}
#content{
	resize: none;
	width: 450px;
	height: 240px;
}
</style>
<body>
	<form id="insertForm" name="insertForm" enctype="multipart/form-data">
		<table id="menuVideoInsert">
			<thead>
				<tr>
					<th scope="cols" colspan="2">동영상 업로드</th>
				</tr>
			</thead>
			<tbody>
				<tr height="20">
					<th width="20%" scope="row">제목</th>
					<td><input type="text" name="title" id="title" style="width: 300px"></td>
				</tr>
				<tr>
					<td colspan="2">
					<font size="1">내용</font><br>
						<textarea name="content" id="content"></textarea>
					</td>
				</tr>
				<tr>
					<!-- 사진만 업로드 -->
					<th scope="row">동영상</th>
					<td>&nbsp;<input type="file" name="file1" id="file" onchange="fileCheck(this)" accept="video/*"></td>
				</tr>
				<tr style="text-align: right">
					<td colspan="2">
						<input type="hidden" value="${folderSerial}" name="folderSerial">
						<input type="button" value="작성완료" onclick="insertVideo();">
						<input type="reset" value="취소">
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
<script>
//동영상만 업로드할수 있게
function fileCheck(obj) {
	pathpoint = obj.value.lastIndexOf('.');
	filepoint = obj.value.substring(pathpoint+1,obj.length);
	filetype = filepoint.toLowerCase();
	console.log(filetype);//뭐가 찍히는지 보고 설정하기
	if(filetype!='mp4' && filetype!='avi' && filetype!='mkv' && filetype!='wmv'){
		alert('동영상 파일만 선택할 수 있습니다.');
		$("#file").val("");
	}
}

function insertVideo(){
	
	 var form = $("form")[0];       
     var formData = new FormData(form);

     $.ajax({
         cache : false,
         url : "MiniHpVideoInsert.do", // 요기에
         processData: false,
         contentType: false,
         type : 'POST', 
         data : formData, 
         success : function(data) {
       			var ajaxMain = {
       		            url : 'miniHpVideo.do?folderSerial='+data,
       		            async : true,
       		            type : "GET",
       		            dataType : "html",
       		            cache : false
       		    };
       		    
       		    $.ajax(ajaxMain).done(function(data){
       		        $('#bodyContents').children().remove();
       		        $('#bodyContents').html(data);
       		    });
         }, 
         error : function(xhr, status) {
             alert(xhr + " : " + status);
         }
     });
}
</script>