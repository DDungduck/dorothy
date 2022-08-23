package com.dorothy.member.board.review.dao;

import java.util.List;

import com.dorothy.member.board.review.vo.BoardReviewVO;

public interface BoardReviewDao {
	public List<BoardReviewVO> boardReviewList(BoardReviewVO brvo);
	public int boardReviewListCnt(BoardReviewVO brvo);
	public BoardReviewVO boardReviewDetail(BoardReviewVO brvo);
	
}
