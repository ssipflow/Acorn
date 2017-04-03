<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("utf-8");
	List<String> styleList = (List<String>) request.getAttribute("styleList");
%>
<html>
<head>
</head>
<body>
<% for(String style: styleList){ %>
<span class="user-style"><%= style %></span>
<% } %>
</body>
</html>