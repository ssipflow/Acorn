package com.controller;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.Enumeration;

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
		Enumeration<String> parameterClass = request.getParameterNames();
		//encodeURIComponent 파라미터를 인코딩하고 url에 직접 전달할 때 key-value가 아닌 key만으로 넘어오기 때문에
		//getParameterNames()로 파라미터 이름에서 직접 value를 추출
		
		String[] paramObjects = null;
		while(parameterClass.hasMoreElements()){
			paramObjects = parameterClass.nextElement().split("&");
		}
		String idx = paramObjects[0].split("=")[1];
		String modifiedStyle = paramObjects[1].split("=")[1];
		String modifiedContent = paramObjects[2].split("=")[1];
		
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
