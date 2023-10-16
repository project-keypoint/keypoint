package com.keypoint.main;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/main/*")
public class mainController {

//	가상주소 http://localhost:8080/FunWeb/member/main
	@GetMapping("/main")
	public String main() {

		// /main.jsp
		// WEB-INF/views/main.jsp
		return "main";
	}//

//	가상주소 http://localhost:8080/FunWeb/member/main
	@GetMapping("/main_test")
	public String main_test() {

		// /main.jsp
		// WEB-INF/views/main.jsp
		return "main_test";
	}//
	

	// -------------------------------------------------
	
	@GetMapping("/login")
	public String login() {

		// /main.jsp
		// WEB-INF/views/tables.jsp
		return "member/login";
	}//


//	가상주소 http://localhost:8080/FunWeb/member/logout
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		//세션값 초기화 
		session.invalidate();
		// 주소변경하면서 이동 /main/main
		return "redirect:/member/login";
	}//
} // class