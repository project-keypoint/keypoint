package com.keypoint.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.keypoint.service.ReceiveService;

@Controller
@RequestMapping("/receive/*")
public class ReceiveController {
	// 테스트
//	@Inject
//	private ReceiveService receiveService;
	
	@GetMapping("/receiveTest")
	public String receiveTest() {
		System.out.println("ReceiveController receive/receiveTest");
		return "receive/receiveTest";
	}
	
	@GetMapping("/receiveDetails")
	public String receiveDetails() {
		System.out.println("ReceiveController receive/receiveDetails");
		return "receive/receiveDetails";
	}
	
	@GetMapping("/empty") // 빈페이지
	public String empty() {
		System.out.println("ReceiveController receive/empty");
		return "receive/empty";
	}
}
