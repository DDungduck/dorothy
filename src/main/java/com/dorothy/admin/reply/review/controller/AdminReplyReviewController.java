package com.dorothy.admin.reply.review.controller;

import java.util.List;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.dorothy.admin.reply.review.service.AdminReplyReviewService;
import com.dorothy.admin.reply.review.vo.AdminReplyReviewVO;
import com.dorothy.member.reply.free.vo.ReplyFreeVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping(value="/admin/replies/review")
@RestController
@Log4j
@AllArgsConstructor
public class AdminReplyReviewController {
	
	private AdminReplyReviewService adminReplyReviewService;
	
	/**************************************************************
	 * 댓글 목록 구현
	 * @return List<AdminReplyReviewVO>
	 **************************************************************/
	@GetMapping(value="/all/{r_num}", produces = MediaType.APPLICATION_JSON_VALUE)
	public List<AdminReplyReviewVO> replyReviewList(@PathVariable("r_num") Integer r_num) {
		log.info("admin replyReviewList 호출 성공");
		
		List<AdminReplyReviewVO> replyList = null;
		replyList = adminReplyReviewService.replyReviewList(r_num);
		return replyList;
		
	}
	
	@PostMapping(value = "/replyReviewInsert", consumes = "application/json", produces = MediaType.TEXT_PLAIN_VALUE)
	public String replyReviewInsert(@RequestBody AdminReplyReviewVO rrvo) {
		log.info("replyInsert 호출 성공");
		log.info("AdminReplyReviewVO : " + rrvo);
		
		int result = 0;
		result = adminReplyReviewService.replyReviewInsert(rrvo);
		return (result == 1) ? "SUCCESS" : "FAILURE";
	}
}
