<%@page import="java.util.List"%>
<%@page import="com.entity.PostDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("utf-8");
	List<PostDTO> postList = (List<PostDTO>) request.getAttribute("postList");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		if (postList.size() == 0) {
	%>
	<p>등록된 글이 없습니다.</p>
	<p>당신의 스타일을 공유하세요!</p>
	<%
		} else {
			for (PostDTO postDTO : postList) {
				int idx = postDTO.getIdx();
				String userid = postDTO.getUserid();
				String weather = postDTO.getWeather();
				String style = postDTO.getStyle();
				String photo = postDTO.getPhoto();
				String content = postDTO.getContent();
				String writeday = postDTO.getWriteday();
				int temp = postDTO.getTemp();
	%>
	<div class="postWrapper" id="<%= idx %>">
		<div class="layer-post" id="layerPost">
			<div class="header-post">
				<span class="writer">@ <%=postDTO.getUserid()%></span><a
					class="btn_close_layer" href="#none"><%=writeday%></a>
			</div>
			<div class="layer-post-containers">
				<div class="inner-post">
					<div class="box-post">
						<div class="image">
							<img
								src="<%="http://localhost:8090/LayOut/uploadFiles/" + photo%>">
						</div>
						<div class="content">
							<p class="style">
								style:<%=style%></p>
							<p><%=content%></p>
						</div>
						<div class="submenu">
							<span id="like">추천하기: x개</span> <span id="showComments">댓글보기</span>
						</div>
						<div class="box-comment">
							<ul class="comments">
								<li class="list-comment"><span class="writer-id">작성자</span>
									<span class="comment">댓글</span> <span class="commentdelete">삭제</span>
									<span class="commentmodify">수정</span></li>
								<li class="list-comment"><span class="writer-id">작성자</span>
									<span class="comment"> <input type="text" value="ㅇㅇㅇ">
										<input type="button" value="댓글수정">
								</span></li>
							</ul>
						</div>
						<div class="box-form">
							<form action="#" method="get">
								<textarea name="comment"></textarea>
								<input type="button" value="댓글달기">
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%
		}
		}
	%>
</body>
</html>