package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.service.Service;

/**
 * Servlet implementation class FBLoginServlet
 */
@WebServlet("/FBLoginServlet")
public class FBLoginServlet extends HttpServlet {

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		
		String fbKey = request.getParameter("fbKey");
		
		Service service = new Service();
		int fbUserCount = service.isFbRegistered(fbKey);
		
		JSONObject json = new JSONObject();
		if(fbUserCount == 0){
			json.put("isFbRegistered", "false");
		}else{
			json.put("isFbRegistered", "true");
		}
		json.put("fbKey", fbKey);
		
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
