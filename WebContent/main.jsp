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
		var state = $("#topSearchBar").css("display");

		if(state == "block")
			$("#topSearchBar").hide();
		
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
	
	//상단고정바, 스크롤 이벤트
	//다음 변수는 페이징 처리를 위한 구분자 및 파라미터 변수
	var curPage = "home";
	var curPageNum = 1;
	var gender = "";
	var searchBy = "";
	var searchFor = "";
	var tag = "";
	var style = "";
	var userid = "";
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
			console.log("curPage: " + curPage + ", curPageNum: " + curPageNum);
			
			console.log("끝");
			
			
			//다음 분기문은 스크롤 로딩을 위한 코드
			if(curPage == "home"){
				//home 메뉴 스크롤 로딩
				curPageNum += 1;
				
				$.ajax({
					url: "/StyleFollow/HomeServlet?curPageNum="+curPageNum,
					type: "get",
					dataType: "html",
					success:function(html){					
						var recievedHTML = $.parseHTML(html);
						$("#fixNextTag").append(recievedHTML);
					}
				})
			} else if(curPage == "user"){
				//user 메뉴 스크롤 로딩
				curPageNum += 1;
				
				$.ajax({
					url: "/StyleFollow/UserPostingServlet?curPageNum="+curPageNum,
					type: "get",
					dataType: "html",
					success:function(html){					
						var recievedHTML = $.parseHTML(html);
						$(".user-post-zone").append(recievedHTML);
					}
				})
			} else if(curPage == "recommended"){
				//recommended 메뉴 스크롤 로딩
				curPageNum += 1;
				
				$.ajax({
					url: "/StyleFollow/RecommendServlet?curPageNum="+curPageNum,
					type: "get",
					dataType: "html",
					success:function(html){					
						var recievedHTML = $.parseHTML(html);
						$(".user-post-zone").append(recievedHTML);
					}
				})
			} else if(curPage == "search"){
				//검색결과 스크롤 로딩
				curPageNum += 1;
				
				$.ajax({
					url: "/StyleFollow/SearchServlet?gender="+gender+"&searchBy="+searchBy+"&searchFor="+searchFor+"&curPageNum="+curPageNum,
					type: "get",
					dataType: "html",
					success:function(html){					
						var recievedHTML = $.parseHTML(html);
						$(".user-post-zone").append(recievedHTML);
					}
				})
			} else if(curPage == "searchByClickHashTag"){
				//해시태그 클릭 결과 스크롤 로딩
				curPageNum += 1;
				
				$.ajax({
					url: "/StyleFollow/SearchByClickServlet?searchBy=hashtag&searchFor="+tag+"&curPageNum="+curPageNum,
					type: "get",
					dataType: "html",
					success:function(html){					
						var recievedHTML = $.parseHTML(html);
						$(".user-post-zone").append(recievedHTML);
					}
				})
			} else if(curPage == "searchByClickStyle"){
				//스타일 클릭 결과 스크롤 로딩
				curPageNum += 1;
				
				$.ajax({
					url: "/StyleFollow/SearchByClickServlet?searchBy=style&searchFor="+style+"&curPageNum="+curPageNum,
					type: "get",
					dataType: "html",
					success:function(html){					
						var recievedHTML = $.parseHTML(html);
						$(".user-post-zone").append(recievedHTML);
					}
				})
			} else if(curPage == "searchForUserPostingbyHashTag"){
				//사용자 페이지 해시태그 검색 결과 스크롤 로딩
				curPageNum += 1;
				
				$.ajax({
					url: "/StyleFollow/SearchForUserPostingServlet?searchBy=hashtag&searchFor="+searchFor+"&userid="+userid+"&curPageNum="+curPageNum,
					type: "get",
					datatype: "html",
					success: function(html){
						var recievedHTML = $.parseHTML(html);
						$(".user-post-zone").append(recievedHTML);
					}
				})
			} else if(curPage == "searchForUserPostingbyStyle"){
				//사용자 페이지 스타일 검색 결과 스크롤 로딩
				curPageNum += 1;
				
				$.ajax({
					url: "/StyleFollow/SearchForUserPostingServlet?searchBy=style&searchFor="+searchFor+"&userid="+userid+"&curPageNum="+curPageNum,
					type: "get",
					datatype: "html",
					success: function(html){
						var recievedHTML = $.parseHTML(html);
						$(".user-post-zone").append(recievedHTML);
					}
				})
			}
			$("#bottomBar").css("display", "block");
		}
	});

	//페이지 로딩에 관련된 jQuery
	$("#fixNextTag").load('/StyleFollow/HomeServlet').fadeIn();
	$('#weather').load('/StyleFollow/weather/weather.jsp').fadeIn();
						
	$(document).on("click", "#user", function(e) {
		e.preventDefault();
		
		curPage = "user";
		curPageNum = 1;
		
		var state = $("#topSearchBar").css("display");

		if(state == "block")
			$("#topSearchBar").hide();
		
		$("#fixNextTag").load('/StyleFollow/UserPostingServlet').fadeIn();
		$("body").scrollTop(0);
	});
	
	$(document).on("click", "#home", function(e) {
		e.preventDefault();
		
		curPage = "home";
		curPageNum = 1;
		
		var state = $("#topSearchBar").css("display");

		if(state == "block")
			$("#topSearchBar").hide();
		
		$("#fixNextTag").load('/StyleFollow/HomeServlet').fadeIn();
		$("body").scrollTop(0);
	});
	
	/* facebook api sdk */
	function statusChangeCallback(response) {
		console.log('statusChangeCallback');
		console.log(response);
	}
	
	function checkLoginState() {
		FB.getLoginStatus(function(response) {
			statusChangeCallback(response);
		});
	}
	
	window.fbAsyncInit = function() {
		FB.init({
			appId : '613531818852008',
			cookie : true, 
			xfbml : true,
			version : 'v2.8'
		});
		FB.getLoginStatus(function(response) {
			statusChangeCallback(response);
		});
	};
	
	(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id)) return;
		js = d.createElement(s); js.id = id;
		js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.8&appId=613531818852008";
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));
	
	//로그아웃
	$(document).on("click", "#logout", function(e){
		e.preventDefault();
		
		//facebook 로그인 했을 떄
		FB.logout(function(response){
			window.location.assign("/StyleFollow/LogOutServlet");
		});
		
		//일반 로그인을 했을 때
		//facebook access token 이 없음을 확인할때까지 1.5초 대기 후 로그아웃 실행
		setTimeout(function(){
			window.location.assign("/StyleFollow/LogOutServlet");
		}, 1500);
	});

	//추천게시물
	$(document).on("click", "#recommended", function(e) {
		e.preventDefault();
		
		curPage = "recommended";
		curPageNum = 1;
		
		var state = $("#topSearchBar").css("display");

		if(state == "block")
			$("#topSearchBar").hide();
		
		$.ajax({
			url: "/StyleFollow/RecommendServlet",
			type: "get",
			dataType: "html",
			success:function(html){					
				var recievedHTML = $.parseHTML(html);
				$("#fixNextTag").html(recievedHTML);
			}
		})
		$("body").scrollTop(0);
	});
	
	/* 검색창 관련 jQuery */
	//검색창 보이기
	$(document).on("click", "#search", function(e) {
		e.preventDefault();
		
		var state = $("#topSearchBar").css("display");

		if(state == "block")
			$("#topSearchBar").hide();
		else
			$("#topSearchBar").show();
	});
	
	//검색창이 열려있을때 검색창 닫기
	$(document).on("mousedown", ".top_con_zone", function(){
		var state = $("#topSearchBar").css("display");

		if(state == "block")
			$("#topSearchBar").hide();
	});
	
	//Style - HashTag 선택시 검색창 변경
	$(document).on("change", "#searchBy", function(){
		var searchBy = $("#searchBy").val();
		
		if(searchBy == 'style'){
			$("#searchFor").html(
					"<select id='style' name='style'>"
					+ "<option value='classic'>Classic</option>"
					+ "<option value='casual'>Casual</option>"
					+ "<option value='street'>Street</option>"
					+ "<option value='office'>Office</option>"
					+ "</select>"
			);
		} else if(searchBy == 'hashtag'){
			$("#searchFor").html(
				"<input type='text' name='hashtag' placeholder='#' size='5'>"
			);
		}
	});
	
	//검색버튼 클릭
	$(document).on("click", ".search-button", function(){
		curPage = "search";
		curPageNum = 1;
		gender = "";
		searchBy = "";
		searchFor = "";
		
		gender = $(this).siblings("input[type=radio]:checked").val();
		searchBy = $(this).siblings("#searchBy").val();
		
		if(searchBy == 'hashtag'){
			//text 읽어오기
			searchFor = $(this).siblings().children("input").val();
		} else{
			searchFor = $(this).siblings().children("select").val();
		}
		console.log(searchBy);
		$.ajax({
			url: "/StyleFollow/SearchServlet?gender="+gender+"&searchBy="+searchBy+"&searchFor="+searchFor,
			type: "get",
			dataType: "html",
			success:function(html){					
				var recievedHTML = $.parseHTML(html);
				$("#fixNextTag").html(recievedHTML);
			}
		})
		$("body").scrollTop(0);
	});
	
	
	// 해시태그 클릭 검색을 위한 jQuery
	$(document).on("click", ".hashtag", function(){
		curPage = "searchByClickHashTag";
		curPageNum = 1;

		tag = $(this).attr("id");
		tag = tag.substring(1);
		
		console.log(tag);
		
		$.ajax({
			url: "/StyleFollow/SearchByClickServlet?searchBy=hashtag&searchFor="+tag,
			type: "get",
			datatype: "html",
			success: function(html){
				var recievedHTML = $.parseHTML(html);
				$("#fixNextTag").html(recievedHTML);
			}
		})
		$("body").scrollTop(0);
	});
	
	// 스타일 클릭 검색을 위한 jQuery
	$(document).on("click", ".style", function(){
		curPage = "searchByClickStyle";
		curPageNum = 1;
		
		style = $(this).text();
		
		console.log(style);
		
		$.ajax({
			url: "/StyleFollow/SearchByClickServlet?searchBy=style&searchFor="+style,
			type: "get",
			datatype: "html",
			success: function(html){
				var recievedHTML = $.parseHTML(html);
				$("#fixNextTag").html(recievedHTML);
			}
		})
		$("body").scrollTop(0);
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
			var params = encodeURIComponent("postIdx="+postIdx+"&commented="+commented);
			$.ajax({
				url: "/StyleFollow/UploadCommentsServlet?"+params,
				type: "get",
				dataType: "html",
				success:function(html){
					
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
		
		originComment = $(this).siblings(".comment").html();
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
			//특수문자를 전송하기 위한 encodeURLComponent()
			var params = encodeURIComponent("cmntIdx="+cmntIdx+"&modifiedComment="+modifiedComment);
			$.ajax({
				url: "/StyleFollow/ModifyCommentServlet?"+params,
				type: "get",
				dataType: "html",
				success:function(html){
					
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
					"<span class='writer-id' id="+writerID+">"+writerID+"</span>" 
					+ "<span class='comment' id="+cmntIdx+">"+originComment+"</span>" 
					+ "<span class='commentdelete' id="+cmntIdx+">삭제</span>"
					+ "<span class='commentmodify' id="+cmntIdx+">수정</span>"		
			);
			$(this).siblings(".comment").children(".hashtag").css("color", "blue").css("cursor", "pointer");
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
				url: "/StyleFollow/DeleteCommentServlet?cmntIdx="+cmntIdx,
				type: "post",
				dataType: "json",
				success:function(html){
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
		
		$(this).parent().prev().hide();
		
		var content = $(this).parent().siblings(".content");
		//특수문자를 전송하기 위한 encodeURLComponent()
		var params = encodeURIComponent("idx="+idx+"&modifiedStyle="+modifiedStyle+"&modifiedContent="+modifiedContent);
		$.ajax({
			//해시태그 전달 시 
			//if hashtag -> url: &modifiedContent=#시계 -> 공백으로 인식한다.
			url: "/StyleFollow/ModifyContentServlet?"+params,
			type: "post",
			dataType: "html",
			success:function(html){
				var recievedHTML = $.parseHTML(html);
				content.html(recievedHTML);
			}
		})
		content.show();
		$(this).parent().html(
				"<span class='delete' id="+idx+">삭제</span>"
				+ "<span class='modify' id="+idx+">수정</span>"
		);
	});
	
	//글 삭제
	$(document).on("click", ".delete", function(){
		var isOk = confirm("정말 삭제하시겠습니까?");
		
		if(isOk){
			var idx = $(this).attr("id");
			
			$.ajax({
				url: "/StyleFollow/DeleteContentServlet?idx="+idx,
				type: "post",
				dataType: "json",
				success:function(data){

				}
			})
		}
		
		$(".postWrapper[id="+idx+"]").hide();
	});
	
	/*
	 * 좋아요 관련 jQuery 
	 */
	$(document).on("click", ".like", function(){
		var idx = $(this).attr("id");
		
		var curPosition = "";
		curPosition = $(this);
		$.ajax({
			//추천 충복여부 확인, userid는 서버에 접속한 session에서 얻는다.
			url: "/StyleFollow/CheckLikeServlet?idx="+idx,
			type: "post",
			dataType: "json",
			success:function(data){
				console.log(data.result);
				if(data.result == "available"){
					//alert("추천 가능한 게시물");
					//likes table에 글 번호, 로그인 사용자 입력
					//증가된 좋아요 수를 받아 동적으로 화면 변환
					$.ajax({
						url: "/StyleFollow/UploadLikeServlet?idx="+idx,
						type: "post",
						dataType: "json",
						success:function(data){
							//$(this).text("추천: " + data.result);
							console.log("like count: " + data.likes);
							curPosition.text("추천: " + data.likes + "개");
						}
					})
				}else{
					alert("이미 추천한 게시물 입니다!");
				}
			}
		})
	});
	
	/* 사용자 페이지로 이동하기 위한 jQuery */
	//글 작성자
	$(document).on("click", ".writer", function(){
		var userid = $(this).attr("id");
		console.log(userid);
		$("#fixNextTag").load('/StyleFollow/UserLinkServlet?userid='+userid).fadeIn();
		$("body").scrollTop(0);
	});
	
	//댓글 작성자
	$(document).on("click", ".writer-id", function(){
		var userid = $(this).attr("id");
		console.log(userid);
		$("#fixNextTag").load('/StyleFollow/UserLinkServlet?userid='+userid).fadeIn();
		$("body").scrollTop(0);
	});
	
	/* 사용자 페이지의 검색 jQuery */
	//스타일 검색
	$(document).on("click", ".user-style", function(){
		curPage = "searchForUserPostingbyStyle";
		curPageNum = 1;
		
		userid = $(this).parent().attr("id");
		searchFor = $(this).text();
		console.log(userid + " : " + searchFor);
		
		$.ajax({
			url: "/StyleFollow/SearchForUserPostingServlet?searchBy=style&searchFor="+searchFor+"&userid="+userid,
			type: "get",
			datatype: "html",
			success: function(html){
				var recievedHTML = $.parseHTML(html);
				$("#fixNextTag").html(recievedHTML);
			}
		})
		$("body").scrollTop(0);
	});
	
	//해시태그 검색
	$(document).on("click", ".search-userpost-btn", function(){
		curPage = "searchForUserPostingbyHashTag";
		curPageNum = 1;
		
		userid = $(this).parent().attr("id");
		searchFor = $(this).prev().val();
		console.log(userid + " : " + searchFor);
		
		$.ajax({
			url: "/StyleFollow/SearchForUserPostingServlet?searchBy=hashtag&searchFor="+searchFor+"&userid="+userid,
			type: "get",
			datatype: "html",
			success: function(html){
				var recievedHTML = $.parseHTML(html);
				$("#fixNextTag").html(recievedHTML);
			}
		})
		$("body").scrollTop(0);
	});
	
	/*
	 * 사용자 메뉴(탈퇴/수정) 관련 jQuery
	 */
	//팔로우 수정 화면 보이기
	$(document).on("click", ".button-member-modify", function(){
		$(".member-modify").show();
	});
	
	//팔로우 수정 취소
	$(document).on("click", ".button-member-modify-cancel", function(){
		$(".member-modify").hide();
	});
	
	//팔로우 수정
	$(document).on("click", ".button-member-modify-ok", function(){
		var userid = $(this).attr("id");
		
		var checked = new Array();
		$(this).siblings(":checkbox[name='modify-style']").each(function(){
			if($(this).is(":checked"))
				checked.push($(this).val());
		});
		
		var params = "";
		for(var i = 0; i < checked.length; i++)
			params += ("0"+checked[i]);
		
		$.ajax({
			url: "/StyleFollow/ModifyMemberStyleServlet?userid="+userid+"&params="+params,
			type: "get",
			datatype: "html",
			success: function(html){
				var recievedHTML = $.parseHTML(html);
				$(".style-box").html(recievedHTML);
			}
		})
		
		$(".member-modify").hide();
	});
	
	/*
	 * 업로드 유효성 검사
	 * 내용, 이미지 유효성 확인
	 */
	$(document).on("submit", "#uploadForm", function(e){
		var uploadArticle = "";
		uploadArticle = $("#uploadArtice").val();
		
		if(uploadArticle == ""){
			e.preventDefault();
			alert("내용을 입력하세요.");
		}else{
			if($("#file").val() != ""){
				var ext = $("#file").val().split(".").pop().toLowerCase();
				
				if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1){
					e.preventDefault();
					alert("이미지파일만 업로드 할수 있습니다.");
				}
			}else{
				e.preventDefault();
				alert("이미지 파일을 포함시켜야 합니다.");
			}
		}
	});
})
</script>
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