<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script>
	
	$().ready(function() {
		$.ajax({
			url : "weather.do",
			type : "GET",
			dataType : "json",
			async : true,
			cache : false,
			success : function(data) {
				
				// 서울
				// 비올확률 %
				console.log(data[0])
				// 현재 온도
				console.log(data[1])
				
				// 부산
				// 비올확률 %
				console.log(data[2])
				// 현재 온도
				console.log(data[3])
				
				// 대구
				// 비올확률 %
				console.log(data[4])
				// 현재 온도
				console.log(data[5])
				
				// 인천
				// 비올확률 %
				console.log(data[6])
				// 현재 온도
				console.log(data[7])
				
				// 광주
				// 비올확률 %
				console.log(data[8])
				// 현재 온도
				console.log(data[9])
				
				// 대전
				// 비올확률 %
				console.log(data[10])
				// 현재 온도
				console.log(data[11])
				
				// 울산
				// 비올확률 %
				console.log(data[12])
				// 현재 온도
				console.log(data[13])
				
				// 수원
				// 비올확률 %
				console.log(data[14])
				// 현재 온도
				console.log(data[15])
				
				const seoul = '서울 온도 : '+data[1]+'℃ 비올 확률 : '+data[0]+'%<br>';
				const busan = '부산 온도 : '+data[3]+'℃ 비올 확률 : '+data[2]+'%<br>';
				const daegu = '대구 온도 : '+data[5]+'℃ 비올 확률 : '+data[4]+'%<br>';
				const incheon = '인천 온도 : '+data[7]+'℃ 비올 확률 : '+data[6]+'%<br>';
				const gwangju = '광주 온도 : '+data[9]+'℃ 비올 확률 : '+data[8]+'%<br>';
				const daejeon = '대전 온도 : '+data[11]+'℃ 비올 확률 : '+data[10]+'%<br>';
				const ulsan = '울산 온도 : '+data[13]+'℃ 비올 확률 : '+data[12]+'%<br>';
				const suwon = '수원 온도 : '+data[15]+'℃ 비올 확률 : '+data[14]+'%<br>';
				
				$('#seoul').html(seoul);
				$('#busan').html(busan);
				$('#daegu').html(daegu);
				$('#incheon').html(incheon);
				$('#gwangju').html(gwangju);
				$('#daejeon').html(daejeon);
				$('#ulsan').html(ulsan);
				$('#suwon').html(suwon);
			}
		})
		
	})
	
	$().ready(function() {
		$.ajax({
			type: "GET",
			url: "covid19.do",
			dataType: "json",
			async:true,
            cache:false,
            success: function(data) {            	
            	// 코로나 완치 수
				console.log(data[0])
				
				// 코로나 확진자 수 전체
				console.log(data[1])
				
				// 오늘 코로나 확진자 수
				console.log(data[2])
				
				// 오늘 날짜
				console.log(data[3])
				
				/* 전체완치 오늘완치 전체확진 오늘확진 */
				
            	const allCovid = '현재 확진자 수 : '+data[0]+'명('+data[1]+'↑)';
    			const clearCovid = '현재 완치자 수 : '+data[2]+'명('+data[3]+'↑)';
            	
				$('#allCovid').html(allCovid);
				$('#clearCovid').html(clearCovid);
			}
		})
	})

</script>
</head>

<body>


<div id="menu_slider">
	
	<div id="covid">
		<div id="allCovid"></div>
		<div id="clearCovid"></div>
	</div>
	
	<div id="weather">
		<div id="seoul"></div>
		<div id="busan"></div>
		<div id="daegu"></div>
		<div id="incheon"></div>
		<div id="gawngju"></div>
		<div id="daejeon"></div>
		<div id="ulsan"></div>
		<div id="suwon"></div>
	</div>
	
</div>


</body>
</html>



	