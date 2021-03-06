package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.UserInfoDTO;

/**
 * Servlet implementation class WeatherPostServlet
 */
//Session에 날씨정보 저장하는 Servlet
@WebServlet("/WeatherPostServlet")
public class WeatherPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String weather = request.getParameter("weather");
		String temp = request.getParameter("temp");
		String loc = request.getParameter("loc");
		
		System.out.println("current location: " + loc);
		System.out.println("current weather: " + weather);
		System.out.println("current temperature: " + temp);
		System.out.println();
		
		HttpSession session = request.getSession();
		session.setAttribute("weather", weather);
		session.setAttribute("temp", temp);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
