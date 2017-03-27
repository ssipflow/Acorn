<%@page import="com.entity.PostDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("utf-8");
	PostDTO postDTO = (PostDTO)request.getAttribute("postDTO");
	
	int idx = postDTO.getIdx();
	String style = postDTO.getStyle();
	String content = postDTO.getContent();
%>
<html>
<head>
</head>
<body>
<p class="style" id="<%=idx%>">style:<%=style%></p>
<p class="article"><%=content%></p>
</body>
</html>