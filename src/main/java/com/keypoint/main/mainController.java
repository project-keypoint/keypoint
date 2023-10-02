package com.keypoint.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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

	@GetMapping("/tables")
	public String tables() {

		// /main.jsp
		// WEB-INF/views/tables.jsp
		return "tables";
	}//

	@GetMapping("/workOrder")
	public String workOrder() {

		// /workOrder.jsp
		// WEB-INF/views/workOrder.jsp
		return "workOrder/workOrderList";
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
		return "notice";
	}//

	// -------------------------------------------------
	@GetMapping("/login")
	public String login() {

		// /main.jsp
		// WEB-INF/views/tables.jsp
		return "member/login";
	}//

	// -------------------------------------------------

} // class