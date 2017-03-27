package com.controller;

import java.io.IOException;
import java.util.HashMap;

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
 * Servlet implementation class UploadLikeServlet
 */
@WebServlet("/UploadLikeServlet")
public class UploadLikeServlet extends HttpServlet {

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		
		String userid = ((UserInfoDTO)session.getAttribute("UserInfo")).getUserid();
		String idx = request.getParameter("idx");
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("idx", Integer.parseInt(idx));
		map.put("userid", userid);
		
		Service service = new Service();
		service.uploadLike(map);
		int likes = service.countLikes(Integer.parseInt(idx));
		System.out.println("like count: " + likes + "\n");
		
		JSONObject json = new JSONObject();
		json.put("likes", likes);
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
