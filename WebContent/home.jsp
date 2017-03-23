<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="css/popup.css">
<link rel="stylesheet" href="css/html5demos.css">
<script src="js/h5utils.js"></script>
<script type="text/javascript" src="js/popup.js"></script>
<style type="text/css">
.wrapper {}

.wrapper div {
	width: 100%;
	text-align: center;
	font-size: 20px;
	color: #fff;
}

.top_bar_fix {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
}

.pd_bar_80 {
	padding-top: 80px;
}

.wrapper .top_bn_zone{
	font: monospace;
	color: #F2F2F2;
	font-size: 40px;
	height: 100px;
	line-height: 100px;
	background: url(images/bnBackground.jpg) no-repeat center center fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
	text-shadow: 0 0 5px black;
	-moz-text-shadow: 0 0 5px black;
	-webkit-text-shadow: 0 0 5px black;
}

.wrapper .top_fix_zone {
	height: 80px;
	background: #DEDEDE;
	line-height: 80px;text-shadow: 0 0 5px black;
	-moz-text-shadow: 0 0 5px black;
	-webkit-text-shadow: 0 0 5px black;
}

.wrapper .top_con_zone {
	height: 1500px;
	background: #ededed;
	color: #888;
	text-align: center;
	font-size: 70px;
	padding-top: 50px;
}

.wrapper .bottom_cp_zone {
	background: #ededed;
	color: #888;
}

.post,.search,.recommended,.user{
	float: right;
	margin-right: 10px;
}

.user{
	margin-right: 50px;
}

.link a{
	color: #fff;
	text-decoration: none;
}

.user .hide{
	display: none;
	border: 1px solid black;
	z-index: 5;
}

#holder img{
	max-width: 100%;
	width: 550px;
}
</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		//상단 고정바 jQuery
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
		});

		$("#fixNextTag").load('http://localhost:8090/LayOut/UserPostingServlet').fadeIn();
		$('#weather').load('http://localhost:8090/LayOut/weather/weather.jsp').fadeIn();
						
		$("#user>a").click(function() {
			e.preventDefault();
			var submenu = $(this).next("ul");
			
			if(submenu.is(":visible")){
				submenu.slideUp();
			}else{
				submenu.slideDown();
			}
		});

		$("#recommended").click(function(e) {
			e.preventDefault();
			$("#fixNextTag").load('http://localhost:8090/LayOut/content/recommended.jsp').fadeIn();
		});
		
		$("#search").click(function(e) {
			e.preventDefault();
			$("#fixNextTag").load('http://localhost:8090/LayOut/content/search.jsp').fadeIn();
		});
	})

</script>
<body>
	<div class="wrapper">
		<div class="top_bn_zone">Style Follow</div>
		<nav>
		<div class="top_fix_zone" id="topBar">
			<span class="link">
				<span id="weather" class="weather"></span>
				<span class="user">
					<a href="#" id="user">User</a>
					<ul class="hide">
						<li>My Post</li>
						<li>User Setting</li>
						<li>Log Out</li>
					</ul>
				</span>
				<span class="recommended">
					<a href="#" id="recommended">Recommended</a>
				</span>
				<span class="search">
					<a href="#" id="search">Search</a>
				</span>
				<span id="post" class="post">
					<a class="btn_layerpopup" href="#layerPopup">Post</a>
				</span> 
			</span>
		</div>
		</nav>
		<section>
			<div class="top_con_zone" id="fixNextTag"></div>
		</section>
		<footer>
		<div class="bottom_cp_zone">&copy; copyright 2017 by DevDig</div>
		</footer>
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