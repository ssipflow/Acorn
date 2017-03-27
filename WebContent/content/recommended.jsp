<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <style type="text/css">
/* original */
.postWrapper {
	position: relative;
	margin-top: 25px;
}

#layerPost {
	position: relative;
	top: 10px;
	right: 10px;
	bottom: 10px;
	left: 10px;
	margin: 0 auto;
	width: 650px;
	display: block;
	background-color: grey;
	border: 1px solid black;
	border-radius: 5px;
}

#layerPost .header-post {
	height: 50px;
	line-height: 50px;
	font-size: 20px;
	font-weight: bold;
	text-align: left;
	color: black;
	background-color: #fff;
	border-radius: 5px 5px 0 0;
}

#layerPost .header-post .writer{
	position: absolute;
	top: 5px;
	left: 50px;
}

#layerPost .header-post .writeday {
	position: absolute;
	top: 5px;
	right: 50px;
}

#layerPost .layer-post-containers {
	top: 50px;
	right: 0;
	bottom: 0;
	left: 0;
}

#layerPost .layer-post-containers .inner-post {
	height: 100%;
	background-color: #fff;
	border-radius: 0 0 5px 5px;
}

#layerPost .layer-post-containers .box-post {
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	padding: 20px 0;
	font-size: 20px;
	overflow: hidden;
	overflow-y: auto;
	-webkit-overflow-scrolling: touch;
}

#layerPost .layer-post-containers .box-post img{
	max-width: 100%;
	width: 550px;
}

#layerPost .layer-post-containers .box-post div{
	display: block;
	psition: relative;
	left: 50px;
	right: 50px;
	color: black;
}

#layerPost .layer-post-containers .box-post .img{
	width: 100%;
	height: 100%;
	margin-left: 0;
}

#layerPost .layer-post-containers .box-post .content{
	width: 550px;
	height: 100%;
	margin-top: 20px;
	margin-bottom: 10px;
	margin-left: 50px;
	margin-right: 50px;
	padding: 0;
	text-align: left;
	font-size: 20px;
}

#layerPost .layer-post-containers .box-post .content p{
	margin: 0px;
	padding: 0px;
	font-size: 18px;
}

#layerPost .layer-post-containers .box-post .content .style{
	text-align: right;
	font-size: 20px;
}

#layerPost .layer-post-containers .box-post .postmenu{
	width: 550px;
	height: 20px;
	margin-top: 0;
	margin-bottom: 5px;
	margin-left: 50px;
	margin-right: 50px;
	padding: 0;
}

#layerPost .layer-post-containers .box-post .postmenu span{
	font-size: 16px;
	cursor: pointer;
}

#layerPost .layer-post-containers .box-post .postmenu .modify{
	float: right;
	margin-right: 5px;
}

#layerPost .layer-post-containers .box-post .postmenu .delete{
	float: right;
}

#layerPost .layer-post-containers .box-post .submenu{
	width: 550px;
	height: 20px;
	margin-top: 0;
	margin-bottom: 10px;
	margin-left: 50px;
	margin-right: 50px;
	padding: 0;
}

#layerPost .layer-post-containers .box-post .submenu > span{
	cursor: pointer;
}

#layerPost .layer-post-containers .box-post .submenu span{
	font-size: 15px;
}

#layerPost .layer-post-containers .box-post .submenu .like{
	float: left;
}

#layerPost .layer-post-containers .box-post .submenu .showComments{
	float: right;
}

#layerPost .layer-post-containers .box-post .box-comment{
	width: 550px;
	height: 100%;
	margin-top: 0;
	margin-bottom: 10px;
	margin-left: 50px;
	margin-right: 50px;
	padding: 0;
	display: none;
}

#layerPost .layer-post-containers .box-post .box-comment .comments{
	list-style: none;
	margin: 0px;
	padding-left: 0px;
	height: 100%;
}

#layerPost .layer-post-containers .box-post .box-comment .comments .list-comment{
	margin-top: 0;
	margin-bottom: 2px;
	margin-left: 0;
	margin-right: 0;
	height: 22px;
	text-align: left;
	border: 0.1px dotted black;
	width:382;
}

#layerPost .layer-post-containers .box-post .box-comment .comments .list-comment span{
	font-size: 15px;
}

#layerPost .layer-post-containers .box-post .box-comment .comments .list-comment .writer-id{
	margin-right: 25px;
}

#layerPost .layer-post-containers .box-post .box-comment .comments .list-comment .commentdelete{
	float: right;
	margin-right: 5px;
	font-size: 10px;
	cursor: pointer;
}

#layerPost .layer-post-containers .box-post .box-comment .comments .list-comment .commentmodify{
	float: right;
	margin-right: 5px;
	font-size: 10px;
	cursor: pointer;
}

#layerPost .layer-post-containers .box-post .box-comment .comments .list-comment input[type="text"]{
	position: relative;
	width: 380px;
	heiht: 20px;
	border: 0.1px solid black;
	margin: 0px;
	padding: 0px;
	font-size: 16px;
}

#layerPost .layer-post-containers .box-post .box-comment .comments .list-comment .button-commentmodify{
	border-radius: 5px;
	border: 0;
	margin: 0;
	padding: 0;
	width: 50px; 
	height: 20px;
	float: right;
	margin-right: 2px;
	font-size: 9px;
	cursor: pointer;
}

#layerPost .layer-post-containers .box-post .box-comment .comments .list-comment .button-commentmodifycancel{
	border-radius: 5px;
	border: 0;
	margin: 0;
	padding: 0;
	width: 25px; 
	height: 20px;
	float: right;
	margin-right: 2px;
	font-size: 9px;
	cursor: pointer;
}

#layerPost .layer-post-containers .box-post .box-form{
	width: 550px;
	height: 100%;
	margin-top: 0;
	margin-bottom: 10px;
	margin-left: 50px;
	margin-right: 50px;
	padding: 0;
	text-align: left;
}

#layerPost .layer-post-containers .box-post .box-form .textarea-comment{
	border: 0.1px solid black;
	margin: 0;
	padding: 0;
	width: 550px;
	height: 50px;
}

#layerPost .layer-post-containers .box-post .box-form button{
	border-radius: 10px;
	border: 0;
	margin-top: 10px;
	margin-right: 0;
	padding: 0;
	width: 70px; 
	height: 30px;
	float: right;
	font-size: 13px;
	cursor: pointer;
}

</style>

<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		//댓글보기 스크립트
		$(document).on("click", ".showComments", function(){
			var postIdx = $(this).attr("id");
			var state = $(".box-comment").css("display");
			if(state == "none"){
				//댓글 보이기
				$(".box-comment").show();
				$(".showComments").html("댓글닫기");
			}else{
				//댓글 닫기
				$('.box-comment').hide();
				$(".showComments").html("댓글보기");
			}
		});
			
		//댓글달기 스크립트
		$(document).on("click", ".button-comment", function(e){
			var postIdx = "";
			postIdx = $(this).attr("id");
			console.log("포스팅인덱스: " + postIdx);
			
			var comment = "";
			comment = $(this).prev("#"+postIdx).val();	//textarea 입력값 가져오기.
			console.log("textarea: " + comment);
			
			//ajax 전송, 저장정보 수신
			
			//화면에 입력
			$(".box-comment").children("#"+postIdx).append(
				"<li class='list-comment' id='댓글 인덱스'><span class='writer-id' id='댓글작성자 아이디'>test2</span><span class='comment' id='댓글인덱스'>"
				+comment+"</span><span class='commentdelete' id='댓글인덱스'>삭제</span><span class='commentmodify' id='댓글인덱스'>수정</span></li>"
			);
		});
		
		//수정 취소시 다시 쓸 정보
		var writerID = "";
		var originComment = "";
		var cmntIdx = "";
		
		$(document).on("click", ".commentmodify", function(){
			//댓글수정
			cmntIdx = $(this).attr("id");
			console.log("댓글인덱스: " + cmntIdx);
			
			originComment = $(this).siblings(".comment").text();
			console.log("기존 댓글: " + originComment);
			

			writerID = $(this).siblings(".writer-id").attr("id");
			console.log("writerID: " + writerID);
			
			$(this).parent().html(
					"<span class='writer-id' id='writerID'>" + writerID + "</span>"
					+ "<input type='text'>"
					+ "<button class='button-commentmodifycancel'>취소</button>"
					+ "<button class='button-commentmodify' id='댓글인덱스'>댓글수정</button>"		
			);
		});
		
		//댓글수정 완료 스크립트
		$(document).on("click", ".button-commentmodify", function(){
			var cmntIdx = "";
			cmntIdx = $(this).attr("id");
			console.log("댓글인덱스: " + cmntIdx);
			
			var modifiedComment = $(this).siblings("input").val();
			console.log("수정된 댓글: " + modifiedComment);
			
			if(modifiedComment.length == 0){
				alert("댓글을 입력하세요");
			}else{
				//ajax로 수정 댓글 전송, 저장된 정보 수신.
				//$(this).parent().html("수정 댓글 태그");
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
				$(this).parent().hide();
				console.log("삭제완료");
			}else{
				console.log("실패");
			}
		});
			
	})
</script> -->
</head>
<body>
	<div class="postWrapper" id="1"><!-- 글의 인덱스 -->
		<div class="layer-post" id="layerPost">
			<div class="header-post">
				<span class="writer" id="test">test</span><!-- 글쓴이 아이디 -->
				<span class="writeday">write day</span>
			</div>
			<div class="layer-post-containers">
				<div class="inner-post">
					<div class="box-post">
						<div class="image"><img src="content/test.jpg"></div>
						<div class="content">
							<p class="style" id="1">style:xxx</p><!-- 글의 인덱스 -->
							<p>adsfqewr</p>
						</div>
						<div class="submenu">
							<span class="like" id="1">추천하기: x개</span><!-- 글의 인덱스 -->
							<span class="showComments" id="1">댓글보기</span><!-- 글의 인덱스 -->
						</div>
						<div class="box-comment" id="1"><!-- 글의 인덱스 -->
							<ul class="comments" id="1"><!-- 글의 인덱스 -->
								<li class="list-comment" id="3"><!-- 댓글 인덱스 -->
									<span class="writer-id" id="test2">test2</span><!-- 댓글작성자 아이디 -->
									<span class="comment" id="3">댓글</span><!-- 댓글 인덱스 -->
									<span class="commentdelete" id="3">삭제</span><!-- 댓글 인덱스 -->
									<span class="commentmodify" id="3">수정</span><!-- 댓글 인덱스 -->
								</li>
								<li class="list-comment" id="4"><!-- 댓글 인덱스 -->
									<span class="writer-id" id="test1">test1</span><!-- 댓글작성자 아이디 -->
									<span class="comment" id="4"><!-- 댓글작성자 아이디 -->
										<input type="text" id="4"><!-- 댓글 인덱스 -->
										<button class="button-commentmodifycancel">취소</button>
										<button class="button-commentmodify" id="4">댓글수정</button><!-- 댓글 인덱스 -->
									</span>
								</li>
							</ul>
						</div>
						<div class="box-form">
							<textarea name="comment" class="textarea-comment" id="1"></textarea><!-- 글의 인덱스 -->
							<button class="button-comment" id="1">댓글달기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="postWrapper" id="2"><!-- 글의 인덱스 -->
		<div class="layer-post" id="layerPost">
			<div class="header-post">
				<span class="writer" id="test1">test1</span><!-- 글쓴이 아이디 -->
				<span class="writeday">write day</span>
			</div>
			<div class="layer-post-containers">
				<div class="inner-post">
					<div class="box-post">
						<div class="image"><img src="content/test.jpg"></div>
						<div class="content">
							<p class="style" id="2">style:yyy</p><!-- 글의 인덱스 -->
							<p>adsfqewr</p>
						</div>
						<div class="postmenu">
							<span class="delete" id="2">삭제</span><!-- 글의 인덱스 -->
							<span class="modify" id="2">수정</span><!-- 글의 인덱스 -->
						</div>
						<div class="submenu">
							<span class="like" id="2">추천하기: x개</span><!-- 글의 인덱스 -->
							<span class="showComments" id="2">댓글보기</span><!-- 글의 인덱스 -->
						</div>
						<div class="box-comment" id="2"><!-- 글의 인덱스 -->
							<ul class="comments" id="2"><!-- 글의 인덱스 -->
								<li class="list-comment" id="1"><!-- 댓글 인덱스 -->
									<span class="writer-id" id="test1">test1</span><!-- 댓글작성자 아이디 -->
									<span class="comment" id="1">댓글</span><!-- 댓글 인덱스 -->
									<span class="commentdelete" id="1">삭제</span><!-- 댓글 인덱스 -->
									<span class="commentmodify" id="1">수정</span><!-- 댓글 인덱스 -->
								</li>
								<li class="list-comment" id="2"><!-- 댓글 인덱스 -->
									<span class="writer-id" id="test2">test2</span><!-- 댓글작성자 아이디 -->
									<span class="comment" id="2">댓글</span><!-- 댓글 인덱스 -->
									<span class="commentdelete" id="2">삭제</span><!-- 댓글 인덱스 -->
									<span class="commentmodify" id="2">수정</span><!-- 댓글 인덱스 -->
								</li>
							</ul>
						</div>
						<div class="box-form">
							<textarea name="comment" class="textarea-comment" id="2"></textarea><!-- 글의 인덱스 -->
							<button class="button-comment" id="2">댓글달기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>