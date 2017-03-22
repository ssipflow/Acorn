package com.service;

import org.apache.ibatis.session.SqlSession;

import com.dao.MySqlSessionFactory;

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
