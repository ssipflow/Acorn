package com.dao;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

// Mybatis 에서 사용하는 SqlSession 리턴
public class MySqlSessionFactory {
	private static SqlSessionFactory sqlSessionFactory;
	
	static {
		String resource = "com/config/Configuration.xml";
		InputStream inputStream = null;
		try {
			inputStream = Resources.getResourceAsStream(resource);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
	}// end static

	public static SqlSession openSession() {
		return sqlSessionFactory.openSession();
	}
}// end class
