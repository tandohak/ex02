package com.dgit.ex02;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dgit.domain.Criteria;
import com.dgit.domain.ReplyVO;
import com.dgit.persistence.ReplyDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class ReplyDaoTest {
	@Autowired
	private ReplyDAO dao;
	
	@Test
	public void testCreate() throws Exception{
		ReplyVO vo = new ReplyVO();
		vo.setBno(763);
		vo.setReplyer("테스터");
		vo.setReplytext("reply");
		dao.create(vo);
	}
	
	@Test
	public void testUpdate() throws Exception{
		ReplyVO vo = new ReplyVO();
		vo.setRno(1);
		vo.setBno(763);
		vo.setReplyer("222");
		vo.setReplytext("2222");
		dao.update(vo);
	}

//	@Test
	public void testDelete() throws Exception{
		dao.delete(2);
	}
	
	@Test
	public void testSelect() throws Exception{
		Criteria cri = new Criteria();		
		dao.listPage(763, cri);
	}
}
