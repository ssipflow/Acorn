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
						//json�� ��� data�� �Ľ� ���
						
						console.log("������ġ: " + data.name);
						console.log("���糯��: " + data.weather[0].main);
						var temp = data.main.temp;	//�µ����� ����
						temp -= 273.1500;
						temp = Math.round(temp);
						console.log("������: " + temp);
						$("#weather").html("<figure><img src='http://openweathermap.org/img/w/"+data.weather[0].icon+".png' border='0' width='40'><figcaption>������ "+temp+"��</figcaption></figure>");	//�������߰�
						$(".temperature").text("������: " + temp + "��");
						$.ajax({
							url:"/StyleFollow/WeatherPostServlet?weather="+data.weather[0].main+"&temp="+temp+"&loc="+data.name,
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
						//json�� ��� data�� �Ľ� ���
						
						console.log("������ġ: " + data.name);
						console.log("���糯��: " + data.weather[0].main);
						var temp = data.main.temp;	//�µ����� ����
						temp -= 273.1500;
						temp = Math.round(temp);
						console.log("������: " + temp);
						$("#weather").html("<figure><img src='http://openweathermap.org/img/w/"+data.weather[0].icon+".png' border='0' width='40'><figcaption>������ "+temp+"��</figcaption></figure>");	//�������߰�
						$(".temperature").text("������: " + temp + "��");
						$.ajax({
							url:"/StyleFollow/WeatherPostServlet?weather="+data.weather[0].main+"&temp="+temp+"&loc="+data.name,
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