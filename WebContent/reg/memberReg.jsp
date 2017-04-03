<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String fbKey = request.getParameter("fbKey");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Style Follow</title>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<link rel="stylesheet" href="/StyleFollow/css/memberReg.css">
<script src="/StyleFollow/js/memberReg.js"></script>
</head>
<body>
	<form action="/StyleFollow/MemberRegServlet" method="post" name="regForm">
		<input type="hidden" name="fbKey" value="<%= fbKey %>">
		<h1>Style Follow - 회원가입</h1>
		<fieldset>
			<legend>로그인 정보</legend>
			<ol>
			
				<li>
					<label for="userid">아이디</label>
				 	<input id="userid"name="userid" type="text"  autofocus required>
				 	
					 <button id="idCheck" >중복확인 </button>  <!-- ajax로 중복된 아이디 확인 -->
				</li>
				<li class="alert" id="idAlert"></li>
				<li>
					<label for="pwd1">비밀번호</label> 
					<input id="pwd" name="pwd" type="password"  >
				</li>
				<li class="alert" id="pwdAlert"></li>
				<li>
					<label pwd="pwd2">비밀번호 확인</label> 
					<input id="checkPwd" name="checkPwd" type="password" > 
				</li>
				<li class="alert" id="pwdCheckAlert"></li>
			</ol>
			
		</fieldset>
		<br>
		
		<fieldset>
			<legend>성별 선택</legend>
				<ol>
  					<li>
   					 남성&nbsp;<input type="radio" name="gender" value="male" checked="checked">
					여성&nbsp;<input type="radio" name="gender" value="female">
  					</li>  
				</ol>
		</fieldset>
		<fieldset>
			<legend>Style</legend>
				<ol>
  					<li>
  						<input type="checkbox" name="style" value="casual">캐쥬얼
						<input type="checkbox" name="style" value="classic">클래식
						<input type="checkbox" name="style" value="street">스트릿
						<input type="checkbox" name="style" value="office">오피스
  					</li>  
  					<li class="alert" id="checkBoxAlert"></li>
				</ol>
		</fieldset>
		<fieldset>
 			 <button class="center" type="submit" > 회원가입 </button> 
  			<button class="center" id="reset" > 가입취소 </button> 
		</fieldset>
	</form>
	<div class="bottom_cp_zone"><strong>&copy; copyright 2017 by DevDig</strong></div>
	</body>
</html>