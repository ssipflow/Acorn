package com.controller;

import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.entity.CommentsDTO;
import com.entity.HashTagDTO;
import com.service.Service;
import com.util.ExportHashTag;

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
		Enumeration<String> parameterClass = request.getParameterNames();
		
		String[] paramObjects = null;
		while(parameterClass.hasMoreElements()){
			paramObjects = parameterClass.nextElement().split("&"); 
		}
		String cmntIdx = paramObjects[0].split("=")[1];
		String modifiedComment = paramObjects[1].split("=")[1];
		/*String cmntIdx = request.getParameter("cmntIdx");
		String modifiedComment = request.getParameter("modifiedComment");*/
		System.out.println("recieved cmntIdx: " + cmntIdx + ", recieved modified comment: " + modifiedComment);
		System.out.println();
		
		CommentsDTO commentsDTO = new CommentsDTO();
		commentsDTO.setCmntIdx(Integer.parseInt(cmntIdx));
		commentsDTO.setCommented(modifiedComment);
		
		Service service = new Service();
		service.deleteHashTagByCmnt(Integer.parseInt(cmntIdx));
		
		int idx = service.selectPostIdxByCmnt(Integer.parseInt(cmntIdx));
		List<String> hashTagList = ExportHashTag.exportHashTag(modifiedComment);
		if(hashTagList.size() > 0){
			for(String tag: hashTagList){
				System.out.println("hashtag: " + tag);
				HashTagDTO dto = new HashTagDTO(tag, idx, Integer.parseInt(cmntIdx));
				service.insertHashTagByCmnt(dto);
			}
		}
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
