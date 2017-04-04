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
<script src="js/main.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<body>
	<div class="wrapper">
		<div class="top_bn_zone">Style Follow</div>
		
		<div class="top_fix_zone" id="topBar">
			<div class="link">
				<span id="weather" class="weather"></span>
				
				<span class="logout">
					<a href="#" id="logout">Log out</a>
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
			</div>
			
			<div class="top_hide_zone" id="topSearchBar">
				성별 : 
				<input type="radio" name="gender" value="male" checked>남
				<input type="radio" name="gender" value="female">여
				&nbsp;
				
				<select id="searchBy" name="searchBy">
					<option value="style">Style</option>
					<option value="hashtag">HashTag</option>
					</select> 
				<span id="searchFor">
					<select name="style">
						<option value="classic">Classic</option>
						<option value="casual">Casual</option>
						<option value="street">Street</option>
						<option value="office">Office</option>
					</select>
				</span>
				<button class="search-button">검색</button>
			</div>
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
						<form action="UploadServlet" method="post" enctype="multipart/form-data" id="uploadForm">
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
								<input type=file name="photo" id="file">
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
										.getElementById('file'), holder = document
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
							<textarea name="content" style="width: 550px; height: 90px;" id="uploadArtice"></textarea>
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