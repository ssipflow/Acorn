<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		if(navigator.geolocation){
			navigator.geolocation.getCurrentPosition(function(location){
				var lat = location.coords.latitude;
				var lon = location.coords.longitude;
				$.ajax({
					url:"http://api.openweathermap.org/data/2.5/weather?lat=" + lat + "&lon=" + lon + "&APPID=923fac2cce4ba3c256062de4b713ac3c",
					dataType:"json",
					success:function(data){
						//json의 경우 data는 파싱 결과
						
						console.log("현재위치: " + data.name);
						console.log("현재날씨: " + data.weather[0].main);
						var temp = data.main.temp;	//온도단위 변경
						temp -= 273.1500;
						temp = Math.round(temp);
						console.log("현재기온: " + temp);
						$("#weather").html("<figure><img src='http://openweathermap.org/img/w/"+data.weather[0].icon+".png' border='0' width='40'><figcaption>현재기온 "+temp+"℃</figcaption></figure>");	//아이콘추가
						$(".temperature").text("현재기온: " + temp + "℃");
						$.ajax({
							url:"/LayOut/WeatherPostServlet?weather="+data.weather[0].main+"&temp="+temp+"&loc="+data.name,
							type:"post",
							datatype:"json",
							success:function(data){}
						});
					}
				});	
			},
			function(error){
				console.log(error.code);
				var lat = 37.555227;
				var lon = 126.970057;
				$.ajax({
					url:"http://api.openweathermap.org/data/2.5/weather?lat=" + lat + "&lon=" + lon + "&APPID=923fac2cce4ba3c256062de4b713ac3c",
					dataType:"json",
					success:function(data){
						//json의 경우 data는 파싱 결과
						
						console.log("현재위치: " + data.name);
						console.log("현재날씨: " + data.weather[0].main);
						var temp = data.main.temp;	//온도단위 변경
						temp -= 273.1500;
						temp = Math.round(temp);
						console.log("현재기온: " + temp);
						$("#weather").html("<figure><img src='http://openweathermap.org/img/w/"+data.weather[0].icon+".png' border='0' width='40'><figcaption>현재기온 "+temp+"℃</figcaption></figure>");	//아이콘추가
						$(".temperature").text("현재기온: " + temp + "℃");
						$.ajax({
							url:"/LayOut/WeatherPostServlet?weather="+data.weather[0].main+"&temp="+temp+"&loc="+data.name,
							type:"post",
							datatype:"json",
							success:function(data){}
						});
					}
				});
			});
		}		
	});
</script>
</head>
<body>
<span id="icon"></span>
</body>
</html>