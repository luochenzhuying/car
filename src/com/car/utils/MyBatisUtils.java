package com.car.utils;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyBatisUtils {

	private static SqlSessionFactory sqlSessionFactory;
	private static SqlSession sqlSession;

	public static SqlSession getSqlSession(){
		try {
			//1.加载主配置文件
			InputStream inputStream = Resources.getResourceAsStream("resources/mybatis.xml");
			//2.获取sqlSessionFactory对象（单例模式，模拟多线程）
			if(sqlSessionFactory == null) {
				synchronized (MyBatisUtils.class) {
					if (sqlSessionFactory == null) {
						sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
					}
				}
			}
			//3.获取sqlSession对象
			sqlSession = sqlSessionFactory.openSession();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return sqlSession;
	}
	
	public static void closeAll(){
		if (sqlSession != null) {
			sqlSession.close();
		}
	}
}
