package com.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.PostDTO;
import com.entity.UserInfoDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.service.Service;

/**
 * Servlet implementation class UploadServlet
 */
@WebServlet("/UploadServlet")
public class UploadServlet extends HttpServlet {

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*
		 * MultiPartRequest 파일업로드로 인해
		 * request의 파라미터를 직접 받아올 수 없다.
		 */
		request.setCharacterEncoding("utf-8");
		
		//uploadFile 이름을 가지는 실제 서버의 경로명 알아내기
		ServletContext context = getServletContext();
		String realFolder = context.getRealPath("uploadFile");
		
		//session에 저장된 날씨데이터, userid
		HttpSession session = request.getSession();
		String userid = ((UserInfoDTO)session.getAttribute("UserInfo")).getUserid();
		String weather = (String)session.getAttribute("weather");
		int temp = Integer.parseInt( (String)session.getAttribute("temp") );
		System.out.println("session stroed info [userid: " + userid + ", weather: " + weather + ", temp" + temp);
		
		PostDTO postDTO = new PostDTO();
		
		//최대 전송 파일 크기 결정 10MB
		int maxsize = 10*1024*1024;
		try {
			//서버에 동일한 파일 이름이 저장되어 있다면, 파일이름 뒤에 숫자를 증가.
			MultipartRequest multi = new MultipartRequest(request, realFolder, maxsize, "utf-8", new DefaultFileRenamePolicy());
			
			//form으로 받은 데이터
			
			String style = multi.getParameter("style");
			String content = multi.getParameter("content");
			String photo = multi.getFilesystemName("photo");
			
			postDTO.setUserid(userid);
			postDTO.setWeather(weather);
			postDTO.setStyle(style);
			postDTO.setPhoto(photo);
			postDTO.setContent(content);
			postDTO.setTemp(temp);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		Service service = new Service();
		service.upload(postDTO);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
