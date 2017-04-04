<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Style Follow</title>
<link rel="stylesheet" href="/StyleFollow/css/login.css">
<script src="/StyleFollow/js/login.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
</head>
<body>

	<script>
		// This is called with the results from from FB.getLoginStatus().
		function statusChangeCallback(response) {
			console.log('statusChangeCallback');
			console.log(response);
			// The response object is returned with a status field that lets the
			// app know the current login status of the person.
			// Full docs on the response object can be found in the documentation
			// for FB.getLoginStatus().
			if (response.status === 'connected') {
				// Logged into your app and Facebook.
				// 페북 로그인 허용한 유저
				testAPI();
			} else {
				// The person is not logged into your app or we are unable to tell
				// 처음 사용하는 유저
				/* document.getElementById('status').innerHTML = 'Please log '
						+ 'into this app.'; */
			}
		}
		// This function is called when someone finishes with the Login
		// Button.  See the onlogin handler attached to it in the sample
		// code below.
		function checkLoginState() {
			FB.getLoginStatus(function(response) {
				statusChangeCallback(response);
			});
		}
		window.fbAsyncInit = function() {
			FB.init({
				appId : '613531818852008',
				cookie : true, // enable cookies to allow the server to access 
				// the session
				xfbml : true, // parse social plugins on this page
				version : 'v2.8' // use graph api version 2.8
			});
			// Now that we've initialized the JavaScript SDK, we call 
			// FB.getLoginStatus().  This function gets the state of the
			// person visiting this page and can return one of three states to
			// the callback you provide.  They can be:
			//
			// 1. Logged into your app ('connected')
			// 2. Logged into Facebook, but not your app ('not_authorized')
			// 3. Not logged into Facebook and can't tell if they are logged into
			//    your app or not.
			//
			// These three cases are handled in the callback function.
			FB.getLoginStatus(function(response) {
				statusChangeCallback(response);
			});
		};
		// Load the SDK asynchronously
		(function(d, s, id) {
				var js, fjs = d.getElementsByTagName(s)[0];
				if (d.getElementById(id)) return;
				js = d.createElement(s); js.id = id;
				js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.8&appId=613531818852008";
				fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
		// Here we run a very simple test of the Graph API after login is
		// successful.  See statusChangeCallback() for when this call is made.
		function testAPI() {
			console.log('Welcome!  Fetching your information.... ');
			FB.api('/me', function(response) {
				console.log('Successful login for: ' + response.name);
				/* document.getElementById('status').innerHTML = 'Thanks for logging in, '
						+ response.name + '!<br>ID: ' + response.id; */
				console.log( JSON.stringify(response));
						
				var isFbRegistered = "";
				$.ajax({
					url: "/StyleFollow/FBLoginServlet?fbKey="+response.id,
					type: "get",
					dataType: "json",
					success:function(data){					

						isFbRegistered = data.isFbRegistered;
						if(isFbRegistered == "false"){
							window.location.assign("/StyleFollow/reg/memberReg.jsp?fbKey="+response.id);
						}else{
							window.location.assign("/StyleFollow/LoginServlet?fbKey="+response.id);
						}
					}
				})
				console.log(isFbRegistered);
			});
		}
	</script>
	
	<div class="wrapper">
	<form action="/StyleFollow/LoginServlet" method="post" onsubmit="check(event)">
		<div class="login">
			<div class="login_form">
				<div class="logo">
					<strong>Style Follow</strong>
				</div>
				<span>아이디</span> 
				<span class="userid">
					<input type="text" name="userid" id="userid">
				</span><br> 
				<span>비밀번호</span> 
				<span class="pwd">
					<input type="password" name="pwd" id="pwd">
				</span>
				<br>
				<span class="register">
					<a href="/StyleFollow/reg/memberReg.jsp">회원가입</a>&nbsp;&nbsp;&nbsp;
				</span>
				<br><br>
				<button class="login_btn">로그인</button>
				<div class="fb-login-button" scope="public_profile,email" onlogin="checkLoginState();" 
					data-max-rows="1" data-size="large" data-show-faces="false" data-auto-loagout-link="false">
				</div>
			</div>
		</div>
	</form>
	</div>

	<footer id="footer">
		<div class="bottom_cp_zone"><strong>&copy; copyright 2017 by DevDig</strong></div>
	</footer>
</body>
</html>