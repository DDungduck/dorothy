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
	 * ����Խ��� �� ��� �����ϱ�(����¡ ó�� ���� ��� ��ȸ)
	 * ��û URL : http://localhost:8081/board/review/boardReviewList
	 ***********************************************************/
	@RequestMapping(value="/boardReviewList", method = RequestMethod.GET)
	public String boardReviewList(@ModelAttribute("data") BoardReviewVO brvo, Model model) {
		log.info("boardReviewList ȣ�� ����");
		
		// ��ü ���ڵ� ��ȸ
		List<BoardReviewVO> boardReviewList = boardReviewService.boardReviewList(brvo);
		model.addAttribute("boardReviewList", boardReviewList);
		
		// ��ü ���ڵ� ��
		int total = boardReviewService.boardReviewListCnt(brvo);
		
		// ����¡ ó��
		model.addAttribute("pageMaker", new PageDTO(brvo, total));
		
		return "member/board/review/boardReviewList"; // /WEB-INF/views/member/board/review/boardReviewList.jsp
	}
	
	/***********************************************************
	 * ����Խ��� �� �󼼺��� ����
	 * ��û URL : http://localhost:8081/board/review/boardReviewDetail
	 ***********************************************************/
	@RequestMapping(value="/boardReviewDetail", method = RequestMethod.GET)
	public String boardReviewDetail(@ModelAttribute("data") BoardReviewVO brvo, Model model) {
		log.info("boardReviewDetail ȣ�� ����");
		
		BoardReviewVO brDetail = boardReviewService.boardReviewDetail(brvo);
		model.addAttribute("brDetail", brDetail);
		
		return "member/board/review/boardReviewDetail"; // /WEB-INF/views/member/board/review/boardReviewDetail.jsp
	}
	
	

}
