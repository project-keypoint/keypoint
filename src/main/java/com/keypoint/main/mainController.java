package com.keypoint.main;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.keypoint.dto.ChartDTO;
import com.keypoint.service.ChartService;


@Controller
@RequestMapping("/main/*")
public class mainController {
	
	@Inject
	private ChartService chartService;
	
	@GetMapping("/chart_test")
	public String chart_test() {
		return "chart_test";
	}
	
	@GetMapping("/monthlyShip")
	@ResponseBody
	public List<ChartDTO> chart_test(Model model) {
		System.out.println("컨트롤러 chart_test");

        List<ChartDTO> fetchedData = chartService.getMonthlyShip();
        System.out.println(model);
        return fetchedData;
	}
	
	
//  model.addAttribute("chartData", fetchedData);
	
	
	
	
	
	@GetMapping("/main")
	public String main() {

		return "main";
	}

	@GetMapping("/main_test")
	public String main_test() {
		return "main_test";
	}
	
	@GetMapping("/chart")
	public String getCalendar() {
		System.out.println("컨트롤러 chart");
		return "chart";
	}
	
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