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
						
						console.log(data.name);
						console.log(data.weather[0].main);
						var temp = data.main.temp / 100;
						temp = Math.round(temp);
						console.log(temp);
						$("#icon").html("<img src='http://openweathermap.org/img/w/"+data.weather[0].icon+".png' border='0' width='40'>");	//아이콘추가
						$.ajax({
							url:"http://localhost:8090/LayOut/WeatherPostServlet?weather="+data.weather[0].main+"&temp="+temp,
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
						
						console.log(data.weather[0].main);
						console.log("기본위치 : " + data.name);
						var temp = data.main.temp / 100;
						temp = Math.round(temp);
						console.log(temp);
						$("#icon").html("<img src='http://openweathermap.org/img/w/"+data.weather[0].icon+".png' border='0' width='40'>");	//아이콘추가
						$.ajax({
							url:"http://localhost:8090/LayOut/WeatherPostServlet?weather="+data.weather[0].main+"&temp="+temp,
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
<span id="icon" style="float:left; margin-top: 18px; margin-left: 50px; font-size:15px;"></span>
</body>
</html>