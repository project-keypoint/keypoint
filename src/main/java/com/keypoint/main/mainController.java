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


	// ------------------------------------------
	

	@GetMapping("/testpage")
	public String testpage() {

		// /main.jsp
		// WEB-INF/views/tables.jsp
		return "testpage";
	}//

	// -------------------------------------------------
	
	@GetMapping("/notice")
	public String notice() {

		// /main.jsp
		// WEB-INF/views/tables.jsp
		return "/notice/notice";
	}//

	// -------------------------------------------------
	
	@GetMapping("/login")
	public String login() {

		// /main.jsp
		// WEB-INF/views/tables.jsp
		return "member/login";
	}//


	// -------------------------------------------------
	
//	//가상주소 http://localhost:8080/FunWeb/member/loginPro
//		@PostMapping("/loginPro")
//		public String loginPro(MemberDTO memberDTO,HttpSession session) {
//			System.out.println("MemberController loginPro()");
//			//로그인 처리
//			System.out.println(memberDTO);
//			
//			memberDTO = memberService.userCheck(memberDTO);
//			
//			if(memberDTO != null) {
//				//아이디 비밀번호 일치 => 세션값 생성 => /member/main이동
//				session.setAttribute("id", memberDTO.getId());
//				// 주소변경하면서 이동 /main/main
//				return "redirect:/member/main";
//			}else {
//				//아이디 비밀번호 틀림 => member/msg.jsp 이동
//				return "member/msg";
//			}
//		}//	현재 funweb기반 수정안됨 멤버 파일 만들어지고 나서 수정작업 요
//		
//		
//	// -------------------------------------------------
		
	
//	가상주소 http://localhost:8080/FunWeb/member/logout
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		//세션값 초기화 
		session.invalidate();
		// 주소변경하면서 이동 /main/main
		return "redirect:/member/login";
	}//
} // class