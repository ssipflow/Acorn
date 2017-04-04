package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.entity.UserInfoDTO;
import com.service.Service;

/**
 * Servlet implementation class MemberDeragServlet
 */
@WebServlet("/MemberDeragServlet")
public class MemberDeragServlet extends HttpServlet {

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		UserInfoDTO userInfo = (UserInfoDTO) session.getAttribute("UserInfo");
		String loginUserId = userInfo.getUserid();
		String loginUserPwd = userInfo.getPwd();
		String inputPwd = request.getParameter("inputPwd");
		
		JSONObject json = new JSONObject();
		String result = "fail";
		
		Service service = new Service();
		if(loginUserPwd.equals(inputPwd)){
			service.memberDerag(loginUserId);
			result = "success";
		}
		json.put("result", result);
		
		response.setContentType("application/x-json; charset=utf-8");
		response.getWriter().print(json);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
