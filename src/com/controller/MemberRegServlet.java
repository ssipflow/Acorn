package com.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.UserInfoDTO;
import com.entity.UserStyleDTO;
import com.service.Service;

/**
 * Servlet implementation class MemberRegServlet
 */
@WebServlet("/MemberRegServlet")
public class MemberRegServlet extends HttpServlet {

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String userid = request.getParameter("userid");
		String pwd = request.getParameter("pwd");
		String gender = request.getParameter("gender");
		String[] styles = request.getParameterValues("style");
		
		System.out.println("userid: " + userid);
		System.out.println("pwd: " + pwd);
		System.out.println("gender: " + gender);
		
		Service service = new Service();
		UserInfoDTO userInfoDto = new UserInfoDTO(userid, pwd, gender);
		
		service.memberReg(userInfoDto);
		for(String style: styles){
			System.out.println("checked style: " + style);
			UserStyleDTO userStyleDto = new UserStyleDTO(userid, style);
			service.styleReg(userStyleDto);
		}
		
		HttpSession session = request.getSession();
		session.setAttribute("UserInfo", userInfoDto);
		
		response.sendRedirect("home.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
