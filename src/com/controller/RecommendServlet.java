package com.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.javassist.expr.Instanceof;

import com.entity.CommentsDTO;
import com.entity.RecommendPageDTO;
import com.entity.UserInfoDTO;
import com.service.Service;

/**
 * Servlet implementation class RecommendServlet
 */
@WebServlet("/RecommendServlet")
public class RecommendServlet extends HttpServlet {

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		
		String curPageNum = request.getParameter("curPageNum");
		if(curPageNum == null)
			curPageNum = "1";
		
		UserInfoDTO userInfo = (UserInfoDTO) session.getAttribute("UserInfo");
		String loginUserId = userInfo.getUserid();
		String gender = userInfo.getGender();
		String weather = (String) session.getAttribute("weather");
		String temp = (String) session.getAttribute("temp");
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("userid", loginUserId);
		map.put("gender", gender);
		map.put("weather", weather);
		map.put("temp", Integer.parseInt(temp));
		
		HashMap<String, Object> pagingMap = new HashMap<>();
		pagingMap.put("map", map);
		pagingMap.put("curPageNum", curPageNum);
		
		Service service = new Service();
		RecommendPageDTO recommendPageDTO = service.recommendPaging(pagingMap);
		
		List<HashMap<String, Object>> resultList = null;
		resultList = recommendPageDTO.getResultList();
		
		HashMap<Integer, List<CommentsDTO>> commentMap = new HashMap<>();
		for(HashMap<String, Object> postDTO: resultList){
			for(String keys: postDTO.keySet()){
				System.out.println(keys);
				System.out.println(postDTO.get(keys).getClass().getName());
			}
			int postIdx = ((BigDecimal)postDTO.get("IDX")).intValue();
			System.out.println(postIdx);
			
			List<CommentsDTO> commentList = service.comments(postIdx);
			commentMap.put(postIdx, commentList);
		}
		List<String> styleList = service.selectStyle(loginUserId);
		
		request.setAttribute("resultList", resultList);
		request.setAttribute("commentMap", commentMap);
		request.setAttribute("styleList", styleList);
		request.setAttribute("weather", weather);
		request.setAttribute("temp", temp);
		
		RequestDispatcher dispatcher = null;
		if(curPageNum.equals("1")){
			dispatcher = request.getRequestDispatcher("content/recommended.jsp");
		} else{
			dispatcher = request.getRequestDispatcher("ajax/recommendAppend.jsp");
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
