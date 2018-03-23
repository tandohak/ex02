package com.dgit.ex02;

import org.aspectj.bridge.Message;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dgit.domain.MessageVO;
import com.dgit.service.MessageService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class MessageSerivceTest {

	@Autowired
	MessageService service;
	
//	@Test
	public void test() throws Exception{
		MessageVO vo = new MessageVO();
		vo.setSender("user00");
		vo.setTargetid("user03");
		vo.setMessage("테스트 메시지");
		
		service.addMessage(vo); 
	}
	
	@Test
	public void read() throws Exception{
		service.readMessage("user03", 1);
	}
}
