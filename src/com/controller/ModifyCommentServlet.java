package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.entity.CommentsDTO;
import com.service.Service;

/**
 * Servlet implementation class ModifyCommentServlet
 */
@WebServlet("/ModifyCommentServlet")
public class ModifyCommentServlet extends HttpServlet {

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String cmntIdx = request.getParameter("cmntIdx");
		String modifiedComment = request.getParameter("modifiedComment");
		System.out.println("recieved cmntIdx: " + cmntIdx + ", recieved modified comment: " + modifiedComment);
		System.out.println();
		
		CommentsDTO commentsDTO = new CommentsDTO();
		commentsDTO.setCmntIdx(Integer.parseInt(cmntIdx));
		commentsDTO.setCommented(modifiedComment);
		
		Service service = new Service();
		service.modifyComment(commentsDTO);
		commentsDTO = service.selectModifiedComment(Integer.parseInt(cmntIdx));
		System.out.println("modified info: " + commentsDTO.toString() + "\n");
		
		request.setAttribute("commentsDTO", commentsDTO);
		RequestDispatcher dis = request.getRequestDispatcher("ajax/modifyComment.jsp");
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
