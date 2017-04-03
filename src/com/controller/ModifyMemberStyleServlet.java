package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.entity.UserStyleDTO;
import com.service.Service;

/**
 * Servlet implementation class ModifyMemberStyleServlet
 */
@WebServlet("/ModifyMemberStyleServlet")
public class ModifyMemberStyleServlet extends HttpServlet {

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String userid = request.getParameter("userid");
		String params = request.getParameter("params");
		
		String[] styles = params.split("0");
		
		Service service = new Service();
		service.styleDelete(userid);
		for(int i = 1; i < styles.length; i++){
			UserStyleDTO userStyleDTO = new UserStyleDTO(userid, styles[i]);
			//mapper id: styleReg
			service.styleReg(userStyleDTO);
		}
		List<String> styleList = service.selectStyle(userid);
		request.setAttribute("styleList", styleList);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("ajax/modifyStyle.jsp");
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
