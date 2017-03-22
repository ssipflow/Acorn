package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.service.Service;

/**
 * Servlet implementation class IdCheckServlet
 */
@WebServlet("/IdCheckServlet")
public class IdCheckServlet extends HttpServlet {

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		
		String userid = request.getParameter("userid");
		System.out.println(userid);
		String result = "false";
		JSONObject json = new JSONObject();
		
		try {
			Service service = new Service();
			int count = service.idCheck(userid);
			System.out.println(count);
			if(count == 0){
				result = "available";
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		System.out.println(result);
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
