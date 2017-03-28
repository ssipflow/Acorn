package com.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dao.MySqlSessionFactory;
import com.entity.CommentsDTO;
import com.entity.PostDTO;
import com.entity.UserInfoDTO;
import com.entity.UserStyleDTO;

public class Service {

	String namespace = "com.styleFollow.SqlMapper.";

	//중복 아이디 확인
	public int idCheck(String userid){
		SqlSession session = MySqlSessionFactory.openSession();
		int count = 0;
		
		try{
			count = session.selectOne(namespace+"idCheck", userid);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return count;
	}
	
	//신규 회원 입력
	public void memberReg(UserInfoDTO userInfoDTO){
		SqlSession session = MySqlSessionFactory.openSession();
		
		System.out.println("recieved userInfo: " + userInfoDTO.toString());
		
		try{
			session.insert(namespace+"memberReg", userInfoDTO);
			session.commit();
			System.out.println("memberReg complete\n");
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			session.close();
		}
	}
	
	//회원 스타일 입력
	public void styleReg(UserStyleDTO userStyleDto){
		SqlSession session = MySqlSessionFactory.openSession();
		
		System.out.println("recieved userStyle: " + userStyleDto.toString());
		
		try{
			session.insert(namespace+"styleReg", userStyleDto);
			session.commit();
			System.out.println("styleReg complete\n");
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			session.close();
		}
	}
	
	//로그인
	public UserInfoDTO login(HashMap<String, String> map){
		SqlSession session = MySqlSessionFactory.openSession();
		UserInfoDTO userInfo = null;
		
		try{
			userInfo = session.selectOne(namespace+"login", map);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return userInfo;
	}
	
	public List<String> selectStyle(String userid){
		SqlSession session = MySqlSessionFactory.openSession();
		List<String> styleList = null;
		
		try{
			styleList = session.selectList(namespace+"selectStyle", userid);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return styleList;
	}
	
	//사용자 포스팅
	public List<PostDTO> posts(String userid){
		SqlSession session = MySqlSessionFactory.openSession();
		List<PostDTO> postList = null;
		
		try{
			postList = session.selectList(namespace+"posts", userid);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return postList;
	}
	
	//DB에 저장된 모든 포스팅
	public List<PostDTO> allPosts(){
		SqlSession session = MySqlSessionFactory.openSession();
		List<PostDTO> postList = null;
		
		try{
			postList = session.selectList(namespace+"allPosts");
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return postList;
	}
	
	//새글 입력
	public void upload(PostDTO postDTO){
		SqlSession session = MySqlSessionFactory.openSession();
		
		System.out.println("recieved post: " + postDTO.toString());
		
		try{
			session.insert(namespace+"upload", postDTO);
			session.commit();
			System.out.println("post upload complete\n");
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			session.close();
		}
	}
	
	//포스팅별 댓글
	public List<CommentsDTO> comments(int postIdx){
		SqlSession session = MySqlSessionFactory.openSession();
		List<CommentsDTO> commentList = null;
		
		try{
			commentList = session.selectList(namespace+"comments", postIdx);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return commentList;
	}
	
	//댓글 입력
	public void uploadComment(CommentsDTO commentsDTO){
		SqlSession session = MySqlSessionFactory.openSession();
		
		System.out.println("recieved comment: " + commentsDTO.toString());
		
		try{
			session.insert(namespace+"uploadComment", commentsDTO);
			session.commit();
			System.out.println("comment upload complete\n");
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			session.close();
		}
	}
	
	//입력한 댓글 확인
	public List<CommentsDTO> selectPostedComment(String userid){
		SqlSession session = MySqlSessionFactory.openSession();
		List<CommentsDTO> commentList = null;
		
		try{
			commentList = session.selectList(namespace+"selectPostedComment", userid);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return commentList;
	}
	
	//댓글 수정
	public void modifyComment(CommentsDTO commentsDTO){
		System.out.println("comment will change to " + commentsDTO);
		SqlSession session = MySqlSessionFactory.openSession();
		
		try {
			session.update(namespace+"modifyComment", commentsDTO);
			session.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}
	}
	
	//수정한 댓글 확인
	public CommentsDTO selectModifiedComment(int cmntIdx){
		SqlSession session = MySqlSessionFactory.openSession();
		CommentsDTO commentsDTO = null;
		
		try{
			commentsDTO = session.selectOne(namespace+"selectModifiedComment", cmntIdx);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return commentsDTO;
	}
	
	//댓글삭제
	public void deleteComment(int cmntIdx){
		SqlSession session = MySqlSessionFactory.openSession();
		
		try {
			session.delete(namespace+"deleteComment", cmntIdx);
			session.commit();
		}catch(Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			session.close();
		}
	}
	
	//글 수정
	public void modifyContent(PostDTO postDTO){
		System.out.println("post will change to " + postDTO.toString());
		SqlSession session = MySqlSessionFactory.openSession();
		
		try {
			session.update(namespace+"modifyContent", postDTO);
			session.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}
	}
	
	//수정한 글 확인
	public PostDTO selectModifiedContent(int idx){
		SqlSession session = MySqlSessionFactory.openSession();
		PostDTO postDTO = null;
		
		try{
			postDTO = session.selectOne(namespace+"selectModifiedContent", idx);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return postDTO;
	}
	
	//글삭제
	public void deleteContent(int idx){
		SqlSession session = MySqlSessionFactory.openSession();
		
		try {
			session.delete(namespace+"deleteContent", idx);
			session.commit();
		}catch(Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			session.close();
		}
	}
	
	//좋아요 개수 추출
	public int countLikes(int idx){
		SqlSession session = MySqlSessionFactory.openSession();
		int likes = 0;
		
		try {
			likes = session.selectOne(namespace+"countLikes", idx);
		}catch(Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			session.close();
		}
		return likes;
	}
	
	//좋아요 중복 체크
	public int checkLikes(HashMap<String, Object> map){
		SqlSession session = MySqlSessionFactory.openSession();
		int likes = 0;
		
		try {
			likes = session.selectOne(namespace+"checkLikes", map);
		}catch(Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			session.close();
		}
		return likes;
	}
	
	//좋아요 입력
	public void uploadLike(HashMap<String, Object> map){
		SqlSession session = MySqlSessionFactory.openSession();
		
		try {
			session.insert(namespace+"uploadLike", map);
			session.commit();
		}catch(Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			session.close();
		}
	}
	
/*	//1. 목록보기
	public List<BoardDTO> boardList() {
		SqlSession session = MySqlSessionFactory.openSession();
		List<BoardDTO> list = null;

		try {
			list = session.selectList(namespace + "boardList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	*/
}
