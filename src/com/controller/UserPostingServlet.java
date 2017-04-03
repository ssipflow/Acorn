package com.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.DispatcherType;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.CommentsDTO;
import com.entity.CommonPageDTO;
import com.entity.PostDTO;
import com.entity.UserInfoDTO;
import com.service.Service;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/UserPostingServlet")
public class UserPostingServlet extends HttpServlet {

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		UserInfoDTO userInfo = (UserInfoDTO)session.getAttribute("UserInfo");
		String userid = userInfo.getUserid();
		
		String curPageNum = request.getParameter("curPageNum");
		if(curPageNum == null)
			curPageNum = "1";
		
		HashMap<String, Object> pagingMap = new HashMap<>();
		pagingMap.put("userid", userid);
		pagingMap.put("curPageNum", curPageNum);
		
		Service service = new Service();
		CommonPageDTO commonPageDTO = service.postsPaging(pagingMap);
		
		List<PostDTO> postList = null;
		postList = commonPageDTO.getList();
		
		HashMap<Integer, List<CommentsDTO>> commentMap = new HashMap<>();
		HashMap<Integer, Integer> likeMap = new HashMap<>();
		for(PostDTO postDto: postList){
			int postIdx = postDto.getIdx();
			
			List<CommentsDTO> commentList = service.comments(postIdx);
			commentMap.put(postIdx, commentList);
			
			int likes = service.countLikes(postIdx);
			likeMap.put(postIdx, likes);
		}
		List<String> styleList = service.selectStyle(userid);
		
		request.setAttribute("userid", userid);
		request.setAttribute("postList", postList);
		request.setAttribute("commentMap", commentMap);
		request.setAttribute("likeMap", likeMap);
		request.setAttribute("styleList", styleList);
		
		System.out.println("search user: " + userid);
		System.out.println("number of posts: " + postList.size());
		System.out.println("group of comments: " + commentMap.size());
		System.out.println("group of likes: " + likeMap.size());
		System.out.println("number of user style: " + styleList.size());
		System.out.println();
		
		RequestDispatcher dispatcher = null;
		if(curPageNum.equals("1")){
			dispatcher = request.getRequestDispatcher("content/user.jsp");
		}else{
			dispatcher = request.getRequestDispatcher("ajax/append.jsp");
		}
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
