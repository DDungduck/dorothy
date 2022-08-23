package com.dorothy.admin.board.review.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.dorothy.admin.reply.review.dao.AdminReplyReviewDao;
import com.dorothy.member.board.review.dao.BoardReviewDao;
import com.dorothy.member.board.review.vo.BoardReviewVO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class AdminBoardReviewServiceImpl implements AdminBoardReviewService {

	private BoardReviewDao boardReviewDao;
	private AdminReplyReviewDao adminReplyReviewDao;
	@Override
	public List<BoardReviewVO> boardReviewList(BoardReviewVO brvo) {
		List<BoardReviewVO> adminFreeList = null;
		
		adminFreeList = boardReviewDao.boardReviewList(brvo);
		return adminFreeList;
	}

	@Override
	public int boardReviewListCnt(BoardReviewVO brvo) {
		return boardReviewDao.boardReviewListCnt(brvo);
	}

	@Override
	public BoardReviewVO reivewDetail(BoardReviewVO brvo) {
		BoardReviewVO brDetail = null;
		brDetail = boardReviewDao.boardReviewDetail(brvo);
		if(brDetail != null) {
			brDetail.setR_content(brDetail.getR_content().toString().replaceAll("\n", "<br />"));
		}
		
		return brDetail;
	}

	@Override
	public int replyCnt(int r_num) {
		// TODO Auto-generated method stub
		return 0;
	}

}
