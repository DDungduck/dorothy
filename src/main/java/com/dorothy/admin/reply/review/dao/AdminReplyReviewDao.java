package com.dorothy.admin.reply.review.dao;

import java.util.List;

import com.dorothy.admin.reply.review.vo.AdminReplyReviewVO;

public interface AdminReplyReviewDao {
	public List<AdminReplyReviewVO> replyReviewList(Integer r_num);
	public int replyReviewInsert(AdminReplyReviewVO rrvo);
}
