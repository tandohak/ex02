package com.dgit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgit.domain.Criteria;
import com.dgit.domain.ReplyVO;
import com.dgit.persistence.ReplyDAO;

@Repository
public class ReplyServiceImpl implements ReplyService {
	
	
	@Autowired
	private ReplyDAO dao;
	
	@Override
	public List<ReplyVO> listReply(int bno) throws Exception {
		return dao.list(bno);
	}

	@Override
	public void addReply(ReplyVO vo) throws Exception {
		dao.create(vo);
	}

	@Override
	public void modifyReply(ReplyVO vo) throws Exception {
		dao.update(vo);
	}

	@Override
	public void removeReply(int no) throws Exception {
		dao.delete(no);
	}

	@Override
	public int count(int bno) throws Exception {
		return dao.count(bno);
	}

	@Override
	public List<ReplyVO> listPage(int bno, Criteria cri) throws Exception {
		return dao.listPage(bno, cri);
	}

}
