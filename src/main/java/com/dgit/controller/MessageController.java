package com.dgit.controller;



import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.dgit.domain.MessageVO;
import com.dgit.service.MessageService;

@RestController
@RequestMapping("/message")
public class MessageController {
	private static final Logger logger = LoggerFactory.getLogger(MessageController.class);
	
	@Autowired
	private MessageService service;
	
	@RequestMapping(value="", method=RequestMethod.POST)
	public ResponseEntity<String> addMessage(@RequestBody MessageVO vo){
		ResponseEntity<String> entity = null;
		logger.info("infoMessage");
		logger.info(vo.toString());
		
		try {
			service.addMessage(vo);
			
			entity = new ResponseEntity<>("success",HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>("fail",HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value="",method=RequestMethod.GET)
	public ResponseEntity<MessageVO> readMessage(String uid, int mno){
		ResponseEntity<MessageVO> entity = null;
		logger.info("infoMessage");
		logger.info("user : "+ uid + " messsageNum : " + mno);
		try {
			MessageVO vo = service.readMessage(uid, mno);
			
			entity = new ResponseEntity<>(vo,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
}