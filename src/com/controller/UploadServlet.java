package com.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.entity.PostDTO;
import com.entity.UserInfoDTO;
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
		
		//Create a factory for disk-based file items.
		DiskFileItemFactory factory = new DiskFileItemFactory();
		
		//Configure a repository (to ensure a secure temp location is used)
		ServletContext servletContext = this.getServletConfig().getServletContext();
		File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
		factory.setRepository(repository);
		
		//Create a new file upload handler
		ServletFileUpload upload = new ServletFileUpload(factory);
		
		//Parse the request
		List<FileItem> items = null;
		try{
			items = upload.parseRequest(request);
		}catch(FileUploadException e){
			e.printStackTrace();
		}
		
		///////////////////////////////////////
		//최대 전송 파일 크기 결정 10MB
		int maxSize = 10*1024*1024;
		
		HashMap<String, String> formData = new HashMap<>();	//input type이 file이 아닌 데이터를 저장하기 위한 맵
		String fieldValue = null;
		String fileName = null;
		long fileSize = 0;
		
		Iterator<FileItem> ite = items.iterator();
		while(ite.hasNext()){
			FileItem fileItem = ite.next();
			
			if(fileItem.isFormField()){
				//input의 type이 file이 아닐 때
				String fieldName = fileItem.getFieldName();	//input의 이름
				fieldValue = fileItem.getString("utf-8");
				formData.put(fieldName, fieldValue);
			}else{
				//input의 type이 file일 때
				fileName = fileItem.getName();
				fileSize = fileItem.getSize();
				System.out.println(fileName + ", size: " +fileSize);
				
				if(fileSize > maxSize)
					response.sendRedirect("error/uploadError.jsp");
				
				File file = new File("c:\\Temp\\styleFollow", fileName);
				
				try{
					fileItem.write(file);
				}catch(Exception e){
					e.printStackTrace();
				}
			}// end else
		}//end while
		/////////////////////////////////////////////////////////////////////////
		
		//form으로 받은 데이터
		String style = formData.get("style");
		String content = formData.get("content");
		
		postDTO.setUserid(userid);
		postDTO.setWeather(weather);
		postDTO.setStyle(style);
		postDTO.setPhoto(fileName);
		postDTO.setContent(content);
		postDTO.setTemp(temp);
		
		Service service = new Service();
		service.upload(postDTO);
		
		response.sendRedirect("StartServlet");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
