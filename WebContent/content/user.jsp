<%@page import="com.util.ExportHashTag"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.entity.CommentsDTO"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.entity.UserInfoDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.PostDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	UserInfoDTO loginUser = (UserInfoDTO)session.getAttribute("UserInfo");
	String loginUserId = loginUser.getUserid();
	
	String userid = (String) request.getAttribute("userid");
	List<PostDTO> postList = (List<PostDTO>) request.getAttribute("postList");
	HashMap<Integer, List<CommentsDTO>> commentMap = 
			(HashMap<Integer, List<CommentsDTO>>) request.getAttribute("commentMap");
	HashMap<Integer, Integer> likeMap =
			(HashMap<Integer, Integer>) request.getAttribute("likeMap");
	List<String> styleList = (List<String>) request.getAttribute("styleList");
%>
<html>
<head>
</head>
<body>
<div class="user-info-zone">
	<div class="postWrapper">
		<div class="layer-post" id="layerUser">
			<div class="user-menu">
				<span>@<%= userid %></span>
			<% if(loginUserId.equals(userid)){ %>
				<strong class="button-member-exit" id="<%= userid %>">회원탈퇴</strong>
				<strong class="button-member-modify" id="<%= userid %>">팔로우 수정&nbsp;</strong>
			<% } %>
			</div>
			<% if(loginUserId.equals(userid)){ %>
			<div class="member-modify">
				<% if(styleList.contains("casual")){ %>
				<input type="checkbox" name="modify-style" value="casual" checked>캐쥬얼
				<% } else { %>
				<input type="checkbox" name="modify-style" value="casual">캐쥬얼
				<% } %>
				<% if(styleList.contains("classic")){ %>
				<input type="checkbox" name="modify-style" value="classic" checked>클래식
				<% } else { %>
				<input type="checkbox" name="modify-style" value="classic">클래식
				<% } %>
				<% if(styleList.contains("street")){ %>
				<input type="checkbox" name="modify-style" value="street" checked>스트릿
				<% } else { %>
				<input type="checkbox" name="modify-style" value="street" >스트릿
				<% } %>
				<% if(styleList.contains("office")){ %>
				<input type="checkbox" name="modify-style" value="office" checked>오피스
				<% } else { %>
				<input type="checkbox" name="modify-style" value="office">오피스
				<% } %>
				<button class="button-member-modify-ok" id="<%= userid %>">수정</button>
				<button class="button-member-modify-cancel" id="<%= userid %>">취소</button>
			</div>
			<% } %>
			<% if(loginUserId.equals(userid)){ %>
			<div class="member-exit">
				<input type="pwd"><br>
				<input type="pwd">  
			</div>
			<% } %>
			<div class="user-info" id="<%= userid %>">
				<% if(loginUserId.equals(userid)){ %>
				<span>My Style: </span>
				<% }else{ %>
				<span><%= userid %>'s style: </span>
				<% } %>
				<span class="style-box">
					<% for(String style: styleList){ %>
					<span class="user-style"><%= style %></span>
					<% } %>
				</span>
				<span class="search-user-post" id="<%= userid %>">
				<% if(loginUserId.equals(userid)){ %>
					나의 게시글 검색
				<% } else{ %>
					@<%= userid %>의 게시글 검색
				<% } %>
					<input type="text" name="searchfor" size="4" placeholder="#">
					<button class="search-userpost-btn">검색</button>
				</span>
			</div>
		</div>
	</div>
</div>

<div class="user-post-zone">
	<%
		if (postList.size() == 0) {
			if(loginUserId.equals(userid)){
	%>
	<p>등록된 글이 없습니다.</p>
	<p>당신의 스타일을 공유하세요!</p>
	<%		}else { %>
	<p>@<%= userid %>님의 글이 없습니다.</p>
	<%		} %>
	<%
		} else {
			for (PostDTO postDTO : postList) {
				int idx = postDTO.getIdx();
				String weather = postDTO.getWeather();
				String style = postDTO.getStyle();
				String photo = postDTO.getPhoto();
				String content = postDTO.getContent();
				String writeday = postDTO.getWriteday();
				String year = writeday.substring(0, 4);
				String month = writeday.substring(4, 6);
				String day = writeday.substring(6, 8);
				writeday = year + "/" + month + "/" + day;
				int temp = postDTO.getTemp();

				System.out.println("post idx: " + idx);
				System.out.println("login user: " + loginUserId + ", posting writer: " + userid);
				
				List<CommentsDTO> commentList = commentMap.get(idx);
				System.out.println("comment size: " + commentList.size());
				
				int likes = likeMap.get(idx);
				System.out.println("likes: " + likes);
				
				ArrayList<String> contentTags = ExportHashTag.exportHashTag(content);
				for(String tag: contentTags){
					String originTag = tag;
					tag = "<span class='hashtag' id='"+tag+"'>"+tag+"</span>";
					System.out.println("originTag: " + originTag + ", tag: " + tag);
					content = content.replace(originTag, tag);
				}
				System.out.println("content: " + content);
	%>
	<div class="postWrapper" id="<%=idx%>">
		<div class="layer-post" id="layerPost">
			<div class="header-post">
				<span class="writer" id="<%=userid%>">@<%=userid%></span> <span
					class="writeday"><%=writeday%></span>
			</div>
			<div class="layer-post-containers">
				<div class="inner-post">
					<div class="box-post">
						<div class="image">
							<img src="<%="/StyleFollow/uploadFiles/" + photo%>">
						</div>
						<div class="content">
							<p class="category" id="<%=idx%>">Style: <span class="style"><%=style%></span></p>
							<p class="article"><%=content%></p>
						</div>
						<%
							if(loginUserId.equals(userid)){
						%>
						<div class="content-modify" id="<%= idx %>">
							<p>Style: 
								<select name="style">
									<option value="casual">캐쥬얼</option>
									<option value="classic">클래식</option>
									<option value="street">스트릿</option>
									<option value="office">오피스</option>
								</select>
							</p>
							<textarea name="comment" class="textarea-modify-content" id="<%=idx%>"></textarea>
						</div>
						<div class="postmenu">
							<%-- <button class="close-modify-content" id="<%=idx%>">취소</button> --%>
							<%-- <button class="button-modify-content" id="<%=idx%>">수정</button> --%>
							<span class="delete" id="<%=idx%>">삭제</span><!-- 글의 인덱스 -->
							<span class="modify" id="<%=idx%>">수정</span><!-- 글의 인덱스 -->
						</div>
						<%	} %>
						<div class="submenu">
							<span class="like" id="<%=idx%>">추천: <%= likes %>개</span> 
							<span class="showComments" id="<%=idx%>">댓글보기</span>
						</div>
						<%
							if (commentList.size() == 0) {
						%><!-- no comments -->
						<div class="no-comment" id="<%=idx%>">작성된 댓글이 없습니다.</div>
						<%
							} else {
						%>
						<!-- has comments -->
						<div class="box-comment" id="<%=idx%>">
							<ul class="comments" id="<%=idx%>">
						<%
									for (CommentsDTO commentsDTO : commentList) {
										int cmntIdx = commentsDTO.getCmntIdx();
										String cmntWriter = commentsDTO.getUserId();
										String commented = commentsDTO.getCommented();
										
										ArrayList<String> commentTags = ExportHashTag.exportHashTag(commented);
										for(String tag: commentTags){
											String originTag = tag;
											tag = "<span class='hashtag' id='"+tag+"'>"+tag+"</span>";
											System.out.println("origin comment Tag: " + originTag + ", comment tag: " + tag);
											commented = commented.replace(originTag, tag);
										}
						%>
							
								<li class="list-comment" id="<%=cmntIdx%>"><span
									class="writer-id" id="<%=cmntWriter%>"><%=cmntWriter%></span> 
									<span class="comment" id="<%=cmntIdx%>"><%=commented%></span> 
								<%
										if(loginUserId.equals(cmntWriter)){
								%>
									<span class="commentdelete" id="<%=cmntIdx%>">삭제</span> 
									<span class="commentmodify" id="<%=cmntIdx%>">수정</span>
									<%	} %>
								</li>
						<%			} %>
							</ul>
						</div>
						<%
								}
								System.out.println();
						%>
						<div class="box-form">
							<textarea name="comment" class="textarea-comment" id="<%=idx%>"></textarea>
							<!-- 글의 인덱스 -->
							<button class="button-comment" id="<%=idx%>">댓글달기</button>
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
</div>
</body>
</html>