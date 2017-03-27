package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.entity.CommentsDTO;
import com.entity.UserInfoDTO;
import com.service.Service;

/**
 * Servlet implementation class UploadCommentsServlet
 */
@WebServlet("/UploadCommentsServlet")
public class UploadCommentsServlet extends HttpServlet {

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		UserInfoDTO userInfoDTO = (UserInfoDTO)session.getAttribute("UserInfo");
		request.setCharacterEncoding("utf-8");
		
		String userId = userInfoDTO.getUserid();
		String postIdx = request.getParameter("postIdx");
		String commented = request.getParameter("commented");
		
		CommentsDTO commentsDTO = new CommentsDTO();
		commentsDTO.setUserId(userId);
		commentsDTO.setPostIdx(Integer.parseInt(postIdx));
		commentsDTO.setCommented(commented);
		
		
		Service service = new Service();
		service.uploadComment(commentsDTO);
		List<CommentsDTO> commentList = service.selectPostedComment(userId);
		commentsDTO = commentList.get(0);
		System.out.println("uploaded comment info: " + commentsDTO.toString());
		
		request.setAttribute("commentsDTO", commentsDTO);
		RequestDispatcher dis = request.getRequestDispatcher("ajax/uploadComment.jsp");
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
