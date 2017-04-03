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
import com.entity.CommonPageDTO;
import com.entity.PostDTO;
import com.service.Service;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/SearchByClickServlet")
public class SearchByClickServlet extends HttpServlet {

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String searchBy = request.getParameter("searchBy");
		String searchFor = request.getParameter("searchFor");
		String curPageNum = request.getParameter("curPageNum");
		
		if(curPageNum == null)
			curPageNum = "1";
		
		HashMap<String, String> pagingMap = new HashMap<>();
		pagingMap.put("curPageNum", curPageNum);
		
		List<PostDTO> postList = null;
		Service service = new Service();
		CommonPageDTO commonPageDTO = null;
		if(searchBy.equals("hashtag")){
			searchFor = "#" + searchFor;
			pagingMap.put("searchFor", searchFor);
			commonPageDTO = service.searchByHashTagPaging(pagingMap);
			postList = commonPageDTO.getList();
		}else{
			//스타일로 검색
			pagingMap.put("searchFor", searchFor);
			commonPageDTO = service.searchByStylePaging(pagingMap);
			postList = commonPageDTO.getList();
		}
		
		HashMap<Integer, List<CommentsDTO>> commentMap = new HashMap<>();
		HashMap<Integer, Integer> likeMap = new HashMap<>();
		for(PostDTO postDto: postList){
			int postIdx = postDto.getIdx();
			
			List<CommentsDTO> commentList = service.comments(postIdx);
			commentMap.put(postIdx, commentList);
			
			int likes = service.countLikes(postIdx);
			likeMap.put(postIdx, likes);
		}
		
		request.setAttribute("postList", postList);
		request.setAttribute("commentMap", commentMap);
		request.setAttribute("likeMap", likeMap);
		request.setAttribute("searchFor", searchFor);
		System.out.println("serarch for " + searchFor);
		System.out.println("number of posts: " + postList.size());
		System.out.println("group of comments: " + commentMap.size());
		System.out.println("group of likes: " + likeMap.size());
		System.out.println();
		
		RequestDispatcher dispatcher = null;
		if(curPageNum.equals("1")){
			dispatcher = request.getRequestDispatcher("ajax/searchResult.jsp");
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
