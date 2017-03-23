package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.DispatcherType;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.PostDTO;
import com.entity.UserInfoDTO;
import com.service.Service;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/UserPostingServlet")
public class UserPostingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		UserInfoDTO userInfo = (UserInfoDTO)session.getAttribute("UserInfo");
		String userid = userInfo.getUserid();
		
		Service service = new Service();
		List<PostDTO> postList = service.posts(userid);
		request.setAttribute("postList", postList);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("content/user.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
