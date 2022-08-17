package com.dorothy.admin.login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dorothy.admin.login.service.AdminLoginService;
import com.dorothy.admin.login.vo.AdminLoginVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Controller
@SessionAttributes("adminLogin")
@Log4j
@RequestMapping("/admin/*")
@AllArgsConstructor
class AdminLoginController {
	
	private AdminLoginService adminLoginService;
	
	
	public AdminLoginVO adminLogin() {
		return new AdminLoginVO();
	}
	
	/*로그인 화면*/
	@GetMapping("/login")
	public String loginForm() {
		log.info("admin 로그인 화면 호출");
		
		return "admin/adminLogin"; //WEB-INF/views/admin/adminLogin.jsp로 포워드
	}
	/*로그인 처리*/
	@RequestMapping(value = "/adminMain", method = RequestMethod.GET)
	public void getLogin() throws Exception {
		log.info("get login");

	}
	@PostMapping("/login")
	public String loginProcess(AdminLoginVO login, Model model, RedirectAttributes ras) {
		String url = "";
		AdminLoginVO adminLogin = adminLoginService.loginProcess(login);
		
		if(adminLogin != null) {
			model.addAttribute("adminLogin", adminLogin);
			url = "/admin/adminMain";
		}else {
			ras.addFlashAttribute("errorMsg", "로그인 실패");
			url = "/admin/adminLogin";
		}
		return "redirect:"+url;
	}
	
	/* 로그 아웃*/
	@RequestMapping("/adminMain")
	public String logout(SessionStatus sessionStatus) {
		log.info("admin 로그아웃 처리");
		sessionStatus.setComplete();
		return "redirect:/admin/login";
	}

}