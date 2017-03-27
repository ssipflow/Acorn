window.onload = function(){
	var idTrue = false;
	var idChecked = false;
	var pwdTrue = false;
	var pwdCheckTrue = false;
	
	$("#userid").keyup(function(){
		var reg_id = /^[a-z0-9]{4,12}$/;
		if(!reg_id.test($(this).val())){
			$("#idAlert").css("color", "red").html("3~15자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.");
			idTrue= false;
		}else{
			$("#idAlert").html("사용할수 있는 아이디 입니다.");
			idTrue= true;
		}
	});
	
	$("#pwd").keyup(function(){
		var reg_pwd = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
		if(!reg_pwd.test($(this).val())){
			$("#pwdAlert").css("color", "red").html("비밀번호 형식이 잘못되었습니다.(영문, 숫자를 혼합한 6~20자 이내)");
			pwdTrue = false;
		}else{
			$("#pwdAlert").css("color", "blue").html("사용할수 있는 비밀번호 입니다.");
			pwdTrue = true;
		}
	});
	
	$("#checkPwd").keyup(function(){			
		var pwd = $("#pwd").val();
		
		if(pwd == $(this).val()){
			$("#pwdCheckAlert").css("color", "blue").html("비밀번호가 일치합니다.");
			pwdCheckTrue = true;
		}else{
			$("#pwdCheckAlert").css("color", "red").html("비밀번호가 일치하지 않습니다.");
			pwdCheckTrue = false;
		}
	});
	
	$("#idCheck").click(function(event){
		event.preventDefault();
		$.ajax({
			url: "/LayOut/CheckIdServlet?userid="+$("#userid").val(),
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
					idChecked = false;
				}
			}
		})
	});
	
	$("form").submit(function(e){
		var styleChecked = false;
		styleChecked = $("input[name=style]").is(":checked");
		console.log(styleChecked);
		if(!styleChecked){
			alert("적어도 하나의 스타일을 체크하세요");
			e.preventDefault();
		}
		
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
}