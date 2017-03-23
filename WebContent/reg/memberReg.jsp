<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<style type="text/css">
.alert{
	font-size: 2px;
	color: red;
}
</style>
<script>
	$(document).ready(function(){
		var idTrue = false;
		var idChecked = false;
		var pwdTrue = false;
		var pwdCheckTrue = false;
		
		$("#userid").keyup(function(){
			var reg_id = /^[a-z0-9]{4,12}$/;
			if(!reg_id.test($(this).val())){
				$("#idAlert").html("아이디는 특수문자를 제외한 영대문자,소문자, 3-15이여야 하며 특수문자는 사용하실 수 없습니다.");
				idTrue= false;
			}else{
				$("#idAlert").html("사용할수 있는 아이디 입니다.");
				idTrue= true;
			}
		});
		
		$("#pwd").keyup(function(){
			var reg_pwd = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
			if(!reg_pwd.test($(this).val())){
				$("#pwdAlert").html("비밀번호 형식이 잘못되었습니다.(영문, 숫자를 혼합하여 6~20자 이내)");
				pwdTrue = false;
			}else{
				$("#pwdAlert").html("사용할수 있는 비밀번호 입니다.");
				pwdTrue = true;
			}
		});
		
		$("#checkPwd").keyup(function(){			
			var pwd = $("#pwd").val();
			
			if(pwd == $(this).val()){
				$("#pwdCheckAlert").html("비밀번호가 일치합니다.");
				pwdCheckTrue = true;
			}else{
				$("#pwdCheckAlert").html("비밀번호가 일치하지 않습니다.");
				pwdCheckTrue = false;
			}
		});
		
		$("#idCheck").click(function(event){
			event.preventDefault();
			$.ajax({
				url: "../IdCheckServlet?userid="+$("#userid").val(),
				type: "post",
				dataType: "json",
				success:function(data){
					console.log(data.result);
					if(data.result == "available"){
						$("#idAlert").css("color", "blue").html("사용할수 있는 아이디 입니다.");
						idChecked = true;
						$("form").attr("action","../MemberRegServlet");
					}else{
						alert("사용할수 없는 아이디 입니다.");
						$("#idAlert").html("사용할수 없는 아이디 입니다.").css("color", "red");
					}
				}
			})
		});
		
		$("form").submit(function(e){			
			console.log(idTrue + " " + pwdTrue + " " + pwdCheckTrue);
			
			if(!idChecked){
				alert("아이디 중복확인을 하세요.");
				e.preventDefault();
			}
			else{
				if(!(idTrue && pwdTrue && pwdCheckTrue)){
					e.preventDefault();
					alert("회원 정보를 정확히 입력하세요.");
				}
			}
		});
	})
</script>
</head>
<body>
<form action="../MemberRegServlet" method="post" name="regForm">
	<table id="regform" border="1">
		<tr>
			<th>아이디</th>
			<td>
				<input type="text" name="userid" id="userid" required>
				<button id="idCheck">아이디 확인</button><!-- ajax로 중복된 아이디 확인 -->
				<span class="alert" id="idAlert"></span>
			</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>
				<input type="password" name="pwd" id="pwd" required>
				<span class="alert" id="pwdAlert"></span>
			</td>
		</tr>
		<tr>
			<th>비밀번호 확인</th>
			<td>
				<input type="password" name="checkPwd" id="checkPwd">
				<span class="alert" id="pwdCheckAlert"></span> 
			</td>
		</tr>
		<tr>
			<th>성별</th>
			<td>
				남성&nbsp;<input type="radio" name="gender" value="male" checked>
				여성&nbsp;<input type="radio" name="gender" value="female">
			</td>
		</tr>
		<tr>
			<th>Style</th>
			<td>
				<input type="checkbox" name="style" value="casual">캐쥬얼
				<input type="checkbox" name="style" value="classic">클래식
				<input type="checkbox" name="style" value="street">스트릿
				<input type="checkbox" name="style" value="office">오피스
			</td>
		</tr>
	</table>
	<input type="submit" id="submit" value="회원가입">
	<input type="reset" value="취소">
</form>
</body>
</html>