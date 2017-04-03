<%@page import="com.util.ExportHashTag"%>
<%@page import="java.util.ArrayList"%>
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
	
	ArrayList<String> contentTags = ExportHashTag.exportHashTag(content);
	for(String tag: contentTags){
		String originTag = tag;
		tag = "<span class='hashtag' id='"+tag+"'>"+tag+"</span>";
		System.out.println("originTag: " + originTag + ", tag: " + tag);
		content = content.replace(originTag, tag);
	}
%>
<html>
<head>
</head>
<body>
<p class="category" id="<%=idx%>">Style: <span class="style"><%=style%></span></p>
<p class="article"><%=content%></p>
</body>
</html>