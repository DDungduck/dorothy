package com.dorothy.member.board.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dorothy.admin.reply.review.dao.AdminReplyReviewDao;
import com.dorothy.member.board.review.dao.BoardReviewDao;
import com.dorothy.member.board.review.vo.BoardReviewVO;

import lombok.Setter;

@Service
public class BoardReviewServiceImpl implements BoardReviewService {
	
	@Setter(onMethod_ = @Autowired)
	private BoardReviewDao boardReviewDao;
	
	@Setter(onMethod_ = @Autowired)
	private AdminReplyReviewDao adminReplyReviewDao;
	
	// 리뷰게시판 글 목록 구현
	@Override
	public List<BoardReviewVO> boardReviewList(BoardReviewVO brvo) {
		List<BoardReviewVO> list = null;
		list = boardReviewDao.boardReviewList(brvo);
		return list;
	}

	// 전체 레코드 수 구현
	@Override
	public int boardReviewListCnt(BoardReviewVO brvo) {
		return boardReviewDao.boardReviewListCnt(brvo);
	}

	// 리뷰게시판 글 상세보기 구현
	@Override
	public BoardReviewVO boardReviewDetail(BoardReviewVO brvo) {
		BoardReviewVO brDetail = null;
		
		brDetail = boardReviewDao.boardReviewDetail(brvo);
		if(brDetail != null) {
			brDetail.setR_content(brDetail.getR_content().toString().replaceAll("\n", "<br />"));
		}
		
		return brDetail;
	}

	

	

}
