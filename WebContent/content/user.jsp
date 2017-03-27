<%@page import="java.util.List"%>
<%@page import="com.entity.PostDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("utf-8");
	List<PostDTO> postList = (List<PostDTO>)request.getAttribute("postList");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	if(postList.size() == 0){
%>
<p>등록된 글이 없습니다.</p>
<p>당신의 스타일을 공유하세요!</p>
<%}
	else{
		for(PostDTO postDTO: postList){
%>
<p>Writer: <%= postDTO.getUserid() %>
<p>Style: <%= postDTO.getStyle() %></p>
<p><img src="<%= "/StyleFollow/uploadFiles/"+postDTO.getPhoto() %>"></p>
<p>Content:</p>
<p><%= postDTO.getContent() %></p>
<%		} 
	}
%>
</body>
</html>