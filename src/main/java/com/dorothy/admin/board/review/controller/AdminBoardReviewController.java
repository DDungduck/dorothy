package com.dorothy.admin.board.review.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dorothy.admin.board.review.service.AdminBoardReviewService;
import com.dorothy.common.vo.PageDTO;
import com.dorothy.member.board.review.vo.BoardReviewVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/board/review/*")
@AllArgsConstructor
public class AdminBoardReviewController {
	
	private AdminBoardReviewService adminBoardReviewService;
	
	@RequestMapping(value="/reviewList", method = RequestMethod.GET)
	public String reviewList(@ModelAttribute("data") BoardReviewVO brvo, Model model) {
		log.info("reviewList 호출 성공");
		
		// 전체 레코드 조회
		List<BoardReviewVO> boardReviewList = adminBoardReviewService.boardReviewList(brvo);
		model.addAttribute("boardReviewList", boardReviewList);
		
		// 전체 레코드 수
		int total = adminBoardReviewService.boardReviewListCnt(brvo);
		
		// 페이징 처리
		model.addAttribute("pageMaker", new PageDTO(brvo, total));
		
		int count = total - (brvo.getPageNum() - 1) * brvo.getAmount();
		model.addAttribute("count", count);
		
		return "admin/board/review/reviewList"; // /WEB-INF/views/member/board/review/boardReviewList.jsp
	}
	
	@RequestMapping(value="/reviewDetail", method = RequestMethod.GET)
	public String reivewDetail(@ModelAttribute("data") BoardReviewVO brvo, Model model) {
		log.info("admin reivewDetail 호출 성공");
		
		BoardReviewVO brDetail = adminBoardReviewService.reivewDetail(brvo);
		model.addAttribute("brDetail", brDetail);
		
		return "admin/board/review/reviewDetail";
	}
	
	@ResponseBody
	@RequestMapping(value="/replyCnt")
	public String replyCnt(@RequestParam("r_num") int r_num) {
		log.info("replyCnt 호출 성공");
		
		int result = 0;
		result = adminBoardReviewService.replyCnt(r_num);
		
		// return result + ""; > 정수형이어서 오류
		return String.valueOf(result);
	}
}
