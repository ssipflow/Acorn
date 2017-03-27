<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Style Follow</title>
<link rel="stylesheet" href="../css/login.css">
<script src="../js/login.js"></script>
</head>
<body>
	<section>
	<form action="/LayOut/LoginServlet" method="post" onsubmit="check(event)">
		<div class="login">
			<div class="login_form">
				<div class="logo"><strong>Style Follow</strong></div>
				<span>아이디</span> 
				<span class="userid"><input type="text" name="userid" id="userid"></span><br> 
				<span>비밀번호</span> 
				<span class="pwd"><input type="password" name="pwd" id="pwd"></span><br>
				<br>
				<button class="login_btn">로그인</button><span class="register"><a href="../reg/memberReg.jsp">회원가입</a>&nbsp;&nbsp;&nbsp;</span>
			</div>
		</div>
	</form>
	</section>

	<footer id="footer">
		<div class="bottom_cp_zone"><strong>&copy; copyright 2017 by DevDig</strong></div>
	</footer>
</body>
</html>