function check(e){
		var id = document.getElementById("userid").value;
		var pwd = document.getElementById("pwd").value;
		
		console.log(id + " " +pwd);
		
		if(id == "" || pwd == ""){
			alert("ID 혹은 비밀번호를 작성해 주세요");
			e.preventDefault();
		}
	}