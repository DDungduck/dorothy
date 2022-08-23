package com.dorothy.admin.board.review.service;

import java.util.List;

import com.dorothy.member.board.review.vo.BoardReviewVO;

public interface AdminBoardReviewService {

	public List<BoardReviewVO> boardReviewList(BoardReviewVO brvo);
	public int boardReviewListCnt(BoardReviewVO brvo);
	public BoardReviewVO reivewDetail(BoardReviewVO brvo);
	public int replyCnt(int r_num);

}
