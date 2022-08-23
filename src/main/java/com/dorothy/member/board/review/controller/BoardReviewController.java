package com.dorothy.member.board.review.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dorothy.common.vo.PageDTO;
import com.dorothy.member.board.review.service.BoardReviewService;
import com.dorothy.member.board.review.vo.BoardReviewVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/review/*")
@AllArgsConstructor
public class BoardReviewController {
	private BoardReviewService boardReviewService;
	
	/***********************************************************
	 * 리뷰게시판 글 목록 구현하기(페이징 처리 제외 목록 조회)
	 * 요청 URL : http://localhost:8081/board/review/boardReviewList
	 ***********************************************************/
	@RequestMapping(value="/boardReviewList", method = RequestMethod.GET)
	public String boardReviewList(@ModelAttribute("data") BoardReviewVO brvo, Model model) {
		log.info("boardReviewList 호출 성공");
		
		// 전체 레코드 조회
		List<BoardReviewVO> boardReviewList = boardReviewService.boardReviewList(brvo);
		model.addAttribute("boardReviewList", boardReviewList);
		
		// 전체 레코드 수
		int total = boardReviewService.boardReviewListCnt(brvo);
		
		// 페이징 처리
		model.addAttribute("pageMaker", new PageDTO(brvo, total));
		
		return "member/board/review/boardReviewList"; // /WEB-INF/views/member/board/review/boardReviewList.jsp
	}
	
	/***********************************************************
	 * 리뷰게시판 글 상세보기 구현
	 * 요청 URL : http://localhost:8081/board/review/boardReviewDetail
	 ***********************************************************/
	@RequestMapping(value="/boardReviewDetail", method = RequestMethod.GET)
	public String boardReviewDetail(@ModelAttribute("data") BoardReviewVO brvo, Model model) {
		log.info("boardReviewDetail 호출 성공");
		
		BoardReviewVO brDetail = boardReviewService.boardReviewDetail(brvo);
		model.addAttribute("brDetail", brDetail);
		
		return "member/board/review/boardReviewDetail"; // /WEB-INF/views/member/board/review/boardReviewDetail.jsp
	}
	
	

}
