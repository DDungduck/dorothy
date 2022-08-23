package com.dorothy.admin.reply.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dorothy.admin.reply.review.dao.AdminReplyReviewDao;
import com.dorothy.admin.reply.review.vo.AdminReplyReviewVO;

import lombok.Setter;

@Service
public class AdminReplyReviewServiceImpl implements AdminReplyReviewService {
	
	@Setter(onMethod_ = @Autowired)
	private AdminReplyReviewDao adminReplyReviewDao;

	@Override
	public List<AdminReplyReviewVO> replyReviewList(Integer r_num) {
		List<AdminReplyReviewVO> replyList = null;
		replyList = adminReplyReviewDao.replyReviewList(r_num);
		return replyList;
	}

	@Override
	public int replyReviewInsert(AdminReplyReviewVO rrvo) {
		int result = 0;
		result = adminReplyReviewDao.replyReviewInsert(rrvo);
		return result;
	}

}
