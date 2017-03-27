package com.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.entity.CommentsDTO;
import com.entity.PostDTO;
import com.service.Service;

/**
 * Servlet implementation class HomeServlet
 * 작성된 모든 글을 보여주는 서블릿
 */
@WebServlet("/HomeServlet")
public class HomeServlet extends HttpServlet {

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		
		Service service = new Service();
		List<PostDTO> postList = service.allPosts();
		
		HashMap<Integer, List<CommentsDTO>> commentMap = new HashMap<>();
		for(PostDTO postDto: postList){
			int postIdx = postDto.getIdx();
			List<CommentsDTO> commentList = service.comments(postIdx);
			commentMap.put(postIdx, commentList);
		}
		
		request.setAttribute("postList", postList);
		request.setAttribute("commentMap", commentMap);
		System.out.println("number of posts: " + postList.size());
		System.out.println("group of comments: " + commentMap.size());
		System.out.println();
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("content/home.jsp");
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
