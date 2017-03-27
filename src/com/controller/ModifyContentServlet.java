package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.entity.PostDTO;
import com.service.Service;

/**
 * Servlet implementation class ModifyContentServlet
 */
@WebServlet("/ModifyContentServlet")
public class ModifyContentServlet extends HttpServlet {
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String idx = request.getParameter("idx");
		String modifiedStyle = request.getParameter("modifiedStyle");
		String modifiedContent = request.getParameter("modifiedContent");
		System.out.println("recieved idx: " 
				+ idx + ", recieved modified style: " 
				+ modifiedStyle + ", recieved modified content: "
				+ modifiedContent);
		System.out.println();
		
		PostDTO postDTO = new PostDTO();
		postDTO.setIdx(Integer.parseInt(idx));
		postDTO.setStyle(modifiedStyle);
		postDTO.setContent(modifiedContent);
		
		Service service = new Service();
		service.modifyContent(postDTO);
		postDTO = service.selectModifiedContent(Integer.parseInt(idx));
		System.out.println("modified info: " + postDTO.toString() + "\n");
		
		request.setAttribute("postDTO", postDTO);
		RequestDispatcher dis = request.getRequestDispatcher("ajax/modifyContent.jsp");
		dis.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
