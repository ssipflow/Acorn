<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Style Follow</title>
</head>
<link rel="stylesheet" href="css/layout.css">
<link rel="stylesheet" href="css/postLayout.css">
<link rel="stylesheet" href="css/html5demos.css">
<link rel="stylesheet" href="css/popup.css">
<script src="js/h5utils.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
	/*
	 * window.onload로 여러개의 js파일을 링크할 때
	 * 스크립트가 꼬이기 때문에 하나의 js파일로 합칠것
	 */
	 
	/* popup창(글쓰기) jQuery */
	$('.btn_layerpopup').on('click', function(e) {
		e.preventDefault();
		console.log('Pop up');
		var el = $($(this).attr('href'));
		if (!el.hasClass('open')) {
			el.addClass('open');
		} else {
			el.removeClass('open');
		}
	});

	$('.btn_close_layer').on('click', function(e) {
		$(this).closest('.layer-popup').removeClass('open');
	});
	
	/*layout jQuery */
	var topBar = $("#topBar").offset();
	
	$(window).scroll(function() {
		var docScrollY = $(document).scrollTop();
		var barThis = $("#topBar")
		var fixNext = $("#fixNextTag")

		if (docScrollY > topBar.top) {
			barThis.addClass("top_bar_fix");
			fixNext.addClass("pd_top_80");
		} else {
			barThis.removeClass("top_bar_fix");
			fixNext.removeClass("pd_top_80");
		}	
		
		$("#bottomBar").css("display", "none");
		
		if($(window).scrollTop() == $(document).height()-$(window).height()){
			console.log("끝");
			$("#bottomBar").css("display", "block");
		}
	});

	//페이지 로딩에 관련된 jQuery
	$("#fixNextTag").load('http://localhost:8090/LayOut/HomeServlet').fadeIn();
	$('#weather').load('http://localhost:8090/LayOut/weather/weather.jsp').fadeIn();
						
	$(document).on("click", "#user", function(e) {
		e.preventDefault();
		$("#fixNextTag").load('http://localhost:8090/LayOut/UserPostingServlet').fadeIn();
	});

	$(document).on("click", "#recommended", function(e) {
		e.preventDefault();
		$("#fixNextTag").load('http://localhost:8090/LayOut/content/recommended.jsp').fadeIn();
	});
		
	$(document).on("click", "#search", function(e) {
		e.preventDefault();
		$("#fixNextTag").load('http://localhost:8090/LayOut/content/search.jsp').fadeIn();
	});
	
	$(document).on("click", "#home", function(e) {
		e.preventDefault();
		$("#fixNextTag").load('http://localhost:8090/LayOut/HomeServlet').fadeIn();
	});
		
	$(document).on("click", "#sample", function(e) {
		e.preventDefault();
		$("#fixNextTag").load('http://localhost:8090/LayOut/SampleServlet').fadeIn();
	});
	
	/*
	 * 댓글 관련 jQuery
	 * 댓글달기, 댓글수정, 댓글 삭제 등
	 */
	//댓글보기 스크립트
	$(document).on("click", ".showComments", function(){
		var postIdx = $(this).attr("id");
		console.log(postIdx);
		
		var state = $(this).parent().siblings(".box-comment").css("display");
		console.log(state);
		//var state = $(".box-comment").css("display");
		if(state == "none"){
			//댓글 보이기
			$(this).parent().siblings(".box-comment").show();
			$(this).html("댓글닫기");
		}else{
			//댓글 닫기
			$(this).parent().siblings(".box-comment").hide();
			$(this).html("댓글보기");
		}
	});
		
	//댓글쓰기 스크립트
	$(document).on("click", ".button-comment", function(){
		console.log("댓글달기");
		
		var postIdx = "";
		postIdx = $(this).attr("id");
		console.log("포스팅인덱스: " + postIdx);
		
		var unlceNode = "";
		uncleNode = $(this).parent().prev().attr("class");
		console.log(uncleNode);

		var commented = "";
		commented = $(this).prev().val();	//textarea 입력값 가져오기.
		console.log("textarea: " + commented);
		
		if(commented.length == 0){
			alert('최소 한글자 이상 입력하세요.');
		}else{
			//처음 게시할 때.
			if(uncleNode == "no-comment"){
				$(this).parent().before(
					"<div class='box-comment' id="+postIdx+">"
					+ "<ul class='comments' id="+postIdx+">" 
					+ "</ul></div>"		
				);
				
				$(this).parent().siblings(".no-comment").hide();
				$(this).parent().siblings(".box-comment").css("display", "block");
			}
	
			//ajax 전송(postIdx, commented), 작성자 아이디는 웹서버의 세션에서 추가, 저장정보 수신
			uncleNode = $(this).parent().siblings(".box-comment"); 
			$.ajax({
				url: "http://localhost:8090/LayOut/UploadCommentsServlet?postIdx="+postIdx+"&commented="+commented,
				type: "get",
				dataType: "html",
				success:function(html){
					/* cmntidx = data.cmntidx;
					userid = data.userid;
					commented = data.commented; */
					
					var recievedHTML = $.parseHTML(html);
					console.log(recievedHTML);
					console.log(uncleNode);
					uncleNode.find(".comments").append(recievedHTML);
				}
			})
			uncleNode.show();
			$(this).prev().val("");
		}
	});
	
	//수정 취소시 다시 쓸 정보
	var writerID = "";
	var originComment = "";
	var cmntIdx = "";
	//댓글 수정 버튼 스크립트
	$(document).on("click", ".commentmodify", function(){
		cmntIdx = $(this).attr("id");
		console.log("댓글인덱스: " + cmntIdx);
		
		originComment = $(this).siblings(".comment").text();
		console.log("기존 댓글: " + originComment);
		

		writerID = $(this).siblings(".writer-id").attr("id");
		console.log("writerID: " + writerID);
		
		$(this).parent().html(
				"<span class='writer-id' id="+writerID+">"+writerID+"</span>"
				+ "<input type='text'>"
				+ "<button class='button-commentmodifycancel'>취소</button>"
				+ "<button class='button-commentmodify' id="+cmntIdx+">댓글수정</button>"		
		);
	});
	
	//댓글수정 스크립트
	$(document).on("click", ".button-commentmodify", function(){
		var cmntIdx = "";
		cmntIdx = $(this).attr("id");
		console.log("댓글인덱스: " + cmntIdx);
		
		var modifiedComment = $(this).siblings("input").val();
		console.log("수정된 댓글: " + modifiedComment);
		
		if(modifiedComment.length == 0){
			alert("댓글을 입력하세요");
		}else{
			var parentNode = $(this).parent();
			//ajax로 수정 댓글 전송, 저장된 정보 수신.
			//$(this).parent().html("수정 댓글 태그");
			$.ajax({
				url: "http://localhost:8090/LayOut/ModifyCommentServlet?cmntIdx="+cmntIdx+"&modifiedComment="+modifiedComment,
				type: "get",
				dataType: "html",
				success:function(html){
					/* cmntidx = data.cmntidx;
					userid = data.userid;
					commented = data.commented; */
					
					var recievedHTML = $.parseHTML(html);
					parentNode.html(recievedHTML);
				}
			})
		}
	});
	
	//댓글수정 취소
	$(document).on("click", ".button-commentmodifycancel", function(){
		var isOk = confirm("수정을 취소하시겠습니까?");
		console.log(isOk);
		if(isOk){
			$(this).parent().html(
					"<span class='writer-id' id="+writerID+">" + writerID 
					+ "</span><span class='comment' id="+cmntIdx+">" + originComment 
					+ "</span><span class='commentdelete' id="+cmntIdx+">삭제</span>"
					+ "<span class='commentmodify' id="+cmntIdx+">수정</span>"		
			);
		}
	});
	
	//댓글삭제 스크립트
	$(document).on("click", ".commentdelete", function(){
		var cmntIdx = $(this).attr("id");
		console.log("삭제할 댓글 인덱스: " + cmntIdx);
		
		var isOk = false;			
		isOk = confirm("댓글을 삭제하시겠습니까?");
		console.log(isOk);
		
		if(isOk){
			//삭제 코드
			//ajax로 삭제할 댓글의 인덱스 전송
			//db에서 삭제 후 성공여부 수신
			//$(this).parent().hide();
			console.log("삭제");
			$.ajax({
				url: "http://localhost:8090/LayOut/DeleteCommentServlet?cmntIdx="+cmntIdx,
				type: "post",
				dataType: "json",
				success:function(html){
					/* cmntidx = data.cmntidx;
					userid = data.userid;
					commented = data.commented; */
				}
			})
			$(this).parent().hide();
			console.log("삭제완료");
		}else{
			console.log("삭제취소");
		}
	});
	
	
	/*
	 * 포스팅 관련 jQuery
	 * 글 수정, 글 삭제
	 */
	 //편집창 보이기
	 $(document).on("click", ".modify", function(){
		var idx = "";
		idx = $(this).attr("id");
		
		var contentModify = "";
		contentModify = $(this).parent().prev();
		 
		var originArticle = "";
		originArticle = $(this).parent().siblings(".content").children(".article").text();
		contentModify.children("textarea").text(originArticle);
		contentModify.prev().hide();
		contentModify.show();
		$(this).parent().html(
			"<button class='close-modify-content' id="+idx+">취소</button>"
			+"<button class='button-modify-content' id="+idx+">수정</button>"
		);
	 });
	 
	//수정 취소
	 $(document).on("click", ".close-modify-content", function(){
		var idx = "";
		idx = $(this).attr("id");
		
		var isOk = confirm("수정을 취소하시겠습니까?");
		
		if(isOk){
			$(this).parent().prev().hide();
			$(this).parent().siblings(".content").show();
			
			$(this).parent().html(
				"<span class='delete' id="+idx+">삭제</span>"
				+"<span class='modify' id="+idx+">수정</span>"
			);
		}
	 });
	
	//수정
	$(document).on("click", ".button-modify-content", function(){
		var idx = "";
		idx = $(this).attr("id");
		
		var contentBox= "";
		contentBox = $(this).parent().siblings(".content-modify").children("p");
		
		var select = "";
		select = contentBox.children("select");
		
		var modifiedStyle = "";
		modifiedStyle = select.val();
		
		var modifiedContent = "";
		modifiedContent = $(this).parent().siblings(".content-modify").children("textarea").val();
		console.log(modifiedContent);
		
		var content = $(this).parent().siblings(".content");
		$.ajax({
			//해시태그 전달 시 
			//if hashtag -> url: &modifiedContent=#시계 -> 공백으로 인식한다.
			url: "http://localhost:8090/LayOut/ModifyContentServlet?idx="+idx+"&modifiedStyle="+modifiedStyle+"&modifiedContent="+modifiedContent,
			type: "post",
			dataType: "html",
			success:function(html){
				var recievedHTML = $.parseHTML(html);
				content.html(recievedHTML);
			}
		})
		content.show();
	});
	
	//글 삭제
})
</script>
<body>
	<div class="wrapper">
		<div class="top_bn_zone">Style Follow</div>
		
		<div class="top_fix_zone" id="topBar">
			<span class="link">
				<span id="weather" class="weather"></span>
				<span class="logout">
					<a href="LogOutServlet" id="logout">Log out</a>
				</span>
				<span class="user">
					<a href="#" id="user">User</a>
				</span>
				<span class="recommended">
					<a href="#" id="recommended">Recommended</a>
				</span>
				<span class="search">
					<a href="#" id="search">Search</a>
				</span>
				<span class="home">
					<a href="#" id="home">Home</a>
				</span>
				<span id="post" class="post">
					<a class="btn_layerpopup" href="#layerPopup">Post</a>
				</span> 
				<span class="sample">
					<a href="#" id="sample">sample</a>
				</span> 
			</span>
		</div>
		
		
		<div class="top_con_zone" id="fixNextTag"></div>
		
		
		<div class="bottom_cp_zone" id="bottomBar">&copy; copyright 2017 by DevDig</div>
		
	</div>

	<!-- 파일 업로드 API -->
	<div id="wrap">
		<div class="layer-popup" id="layerPopup">
			<div class="header">
				<span>New Post</span><a class="btn_close_layer" href="#none">닫기</a>
			</div>
			<div class="layer-containers">
				<div class="inner">
					<div class="box">
						<section id="wrapper">
						<form action="UploadServlet" method="post" enctype="multipart/form-data">
							<div id="carbonads-container">
								<div class="carbonad">
									<div id="azcarbon"></div>
									<script type="text/javascript">
										var z = document
												.createElement("script");
										z.type = "text/javascript";
										z.async = true;
										z.src = "http://engine.carbonads.com/z/14060/azcarbon_2_1_0_VERT";
										var s = document
												.getElementsByTagName("script")[0];
										s.parentNode.insertBefore(z, s);
									</script>
								</div>
							</div>

							<article>
							<p id="status">당신의 스타일을 공유하세요!</p>
							<p>
								<input type=file name="photo">
							</p>
							<p>Style:
								<select name="style">
									<option value="casual">캐쥬얼</option>
									<option value="classic">클래식</option>
									<option value="street">스트릿</option>
									<option value="office">오피스</option>
								</select></p>
							<p>사진의 크기는 10MB 이하로 올려주세요.</p>
							<div id="holder"></div>
							</article>
							<script>
								var upload = document
										.getElementsByTagName('input')[0], holder = document
										.getElementById('holder'), state = document
										.getElementById('status');
								if (typeof window.FileReader === 'undefined') {
									state.className = 'fail';
								} else {
									state.className = 'success';
									state.innerHTML = '당신의 스타일을 공유하세요!';
								}
								upload.onchange = function(e) {
									e.preventDefault();
									var file = upload.files[0], reader = new FileReader();
									reader.onload = function(event) {
										var img = new Image();
										img.src = event.target.result;
										// note: no onload required since we've got the dataurl...I think! :)
										if (img.width > 560) { // holder width
											img.width = 560;
										}
										holder.innerHTML = '';
										holder.appendChild(img);
									};
									reader.readAsDataURL(file);
									return false;
								};
							</script>
							<textarea name="content" style="width: 550px; height: 90px;"></textarea>
							<br> <input type="submit" value="글쓰기">
						</form>
						</section>

						<script src="js/prettify.packed.js"></script>
						<script>
							var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl."
									: "http://www.");
							document
									.write(unescape("%3Cscript src='"
											+ gaJsHost
											+ "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
						</script>
						<script>
							try {
								var pageTracker = _gat
										._getTracker("UA-1656750-18");
								pageTracker._trackPageview();
							} catch (err) {
							}
						</script>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>