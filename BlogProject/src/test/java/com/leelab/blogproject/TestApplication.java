package com.leelab.blogproject;

import javax.mail.MessagingException;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.leelab.blogproject.category.dao.MainCategoryDAO;
import com.leelab.blogproject.category.dao.SubCategoryDAO;
import com.leelab.blogproject.category.dto.MainCategoryDTO;
import com.leelab.blogproject.category.dto.SubCategoryDTO;
import com.leelab.blogproject.category.service.CategoryService;
import com.leelab.blogproject.post.dao.PostDAO;
import com.leelab.blogproject.post.dto.PostDTO;
import com.leelab.blogproject.user.dao.UserDAO;
import com.leelab.blogproject.user.dto.UserDTO;
import com.leelab.blogproject.utils.CollectionUtils;
import com.leelab.blogproject.utils.json.SimpleHashMap;
import com.leelab.blogproject.utils.mail.MailTemplate;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={
		"classpath:config/spring/context-*.xml"
})
public class TestApplication {

	@Autowired
	private SqlSessionTemplate session;
	
	@Autowired
	private MailTemplate mail;

	CategoryService service;
	
	private UserDAO userDao;
	
	private MainCategoryDAO mCateDao;
	
	private SubCategoryDAO sCateDao;
	
	private PostDAO postDao;
	
	@Before
	public void applicationSetup() {
		userDao = session.getMapper(UserDAO.class);
		mCateDao = session.getMapper(MainCategoryDAO.class);
		sCateDao = session.getMapper(SubCategoryDAO.class);
		postDao = session.getMapper(PostDAO.class);
	}
	
	@Test
	public void test() throws MessagingException {
		
		for(int i=1;i<=50;i++)
		{
			postDao.insert(new PostDTO(0, "admin", i+"번째제목", 16, 2, 0, "내용", null));
			try {
				Thread.sleep(500);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
		
	}
	
	
}
