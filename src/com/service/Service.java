package com.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dao.MySqlSessionFactory;
import com.entity.PostDTO;
import com.entity.UserInfoDTO;
import com.entity.UserStyleDTO;

public class Service {

	String namespace = "com.styleFollow.SqlMapper.";

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
	
	public void memberReg(UserInfoDTO userInfoDTO){
		SqlSession session = MySqlSessionFactory.openSession();
		
		System.out.println("recieved userInfo: " + userInfoDTO.toString());
		
		try{
			session.insert(namespace+"memberReg", userInfoDTO);
			session.commit();
			System.out.println("memberReg complete");
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			session.close();
		}
	}
	
	public void styleReg(UserStyleDTO userStyleDto){
		SqlSession session = MySqlSessionFactory.openSession();
		
		System.out.println("recieved userStyle: " + userStyleDto.toString());
		
		try{
			session.insert(namespace+"styleReg", userStyleDto);
			session.commit();
			System.out.println("styleReg complete");
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			session.close();
		}
	}
	
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
	
	public void upload(PostDTO postDTO){
		SqlSession session = MySqlSessionFactory.openSession();
		
		System.out.println("recieved post: " + postDTO.toString());
		
		try{
			session.insert(namespace+"upload", postDTO);
			session.commit();
			System.out.println("post upload complete");
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
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
