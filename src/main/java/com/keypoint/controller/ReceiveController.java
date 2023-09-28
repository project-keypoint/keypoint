package com.keypoint.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.keypoint.dto.ReceiveDTO;
import com.keypoint.service.ReceiveService;

@Controller
@RequestMapping("/receive/*")
public class ReceiveController {
	// 테스트
	@Inject
	private ReceiveService receiveService;
	
	@GetMapping("/receiveList")
	public String receiveTest() {
		System.out.println("ReceiveController receive/receiveList");
		return "receive/receiveList";
	}// receiveTest [수주목록]
	
	@GetMapping("/receiveInsert")
	public String receiveInsert() {
		System.out.println("ReceiveController receive/receiveUpdate");
		return "receive/receiveInsert";
	}// receiveUpdate [수주등록]
	
	@GetMapping("/receiveDetails")
	public String receiveDetails() {
		System.out.println("ReceiveController receive/receiveDetails");
		return "receive/receiveDetails";
	}// receiveDetails [수주상세]
	
	@GetMapping("/receiveUpdate")
	public String receiveUpdate() {
		System.out.println("ReceiveController receive/receiveUpdate");
		return "receive/receiveUpdate";
	}// receiveUpdate [수주수정]
	
	@GetMapping("/empty") // 빈페이지
	public String empty() {
		System.out.println("ReceiveController receive/empty");
		return "receive/empty";
	}// empty [빈페이지]
	
	@GetMapping("/test") // 테스트페이지
	public String test() {
		System.out.println("ReceiveController receive/test");
		return "receive/test";
	}// test [테스트페이지]
	
	// DB테스트용
	@GetMapping("/testInsert") // 테스트
	public String testInsert() {
		System.out.println("ReceiveController receive/testInsert");
		return "receive/testInsert";
	}// testInsert [테스트]
	
	@PostMapping("/insertPro")
	public String insertPro(ReceiveDTO receiveDTO) {
		System.out.println("ReceiveController insertTest()");
		System.out.println(receiveDTO);
		receiveService.insertTest(receiveDTO);
		return "redirect:/receive/testInsert";
	}//
}
