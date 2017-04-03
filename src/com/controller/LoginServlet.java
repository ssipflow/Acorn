package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.UserInfoDTO;
import com.service.Service;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String fbKey = request.getParameter("fbKey");
		String userid = request.getParameter("userid");
		String pwd = request.getParameter("pwd");
		System.out.println("FB Key: " + fbKey);
		System.out.println("Login id: " + userid);
		System.out.println();
		
		Service service = new Service();
		UserInfoDTO userInfoDto = null;
		if(fbKey == null){
			HashMap<String, String> map = new HashMap<>();
			map.put("userid", userid);
			map.put("pwd", pwd);
			
			
			userInfoDto = service.login(map);
			
			if(userInfoDto == null){
				System.out.println("login fail\n");
				response.sendRedirect("error/loginError.jsp");
			}
		}else{
			userInfoDto = service.fbLogin(fbKey);
		}
		
		System.out.println(userInfoDto.toString());
		HttpSession session = request.getSession();
		session.setAttribute("UserInfo", userInfoDto);
		response.sendRedirect("main.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
