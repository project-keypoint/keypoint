package com.keypoint.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.keypoint.dto.ReceiveDTO;
import com.keypoint.service.ReceiveService;

@Controller
@RequestMapping("/receive/*")
public class ReceiveController {
	
	@Inject
	private ReceiveService receiveService;
	
	@GetMapping("/receiveList")
	public String receiveTest(Model model) {
		System.out.println("ReceiveController receive/receiveList");
		List<ReceiveDTO> receiveList = receiveService.getReceiveList();
		model.addAttribute("receiveList", receiveList);
		return "receive/receiveList";
	}// receiveTest [수주목록] // 페이징은 나중에
	
	@GetMapping("/receiveInsert")
	public String receiveInsert() {
		System.out.println("ReceiveController receive/receiveInsert");
		return "receive/receiveInsert";
	}// receiveInsert [수주등록]
	
	@PostMapping("/receiveInsertPro")
	public String receiveInsertPro(ReceiveDTO receiveDTO) {
		System.out.println("ReceiveController receive/receiveInsertPro");
		System.out.println(receiveDTO);
		receiveService.receiveInsertPro(receiveDTO);
		
		if(receiveDTO != null) {
			return "receive/msgSuccess"; // 등록완료
		}else {
			return "receive/msgFailed"; // 등록실패
		}
	}// receiveInsertPro [수주등록Pro]
	
	@GetMapping("/receiveDetails")
	public String receiveDetails(Model model, @RequestParam("roCode") String roCode) {
		System.out.println("ReceiveController receive/receiveDetails");
		ReceiveDTO receiveDTO = receiveService.getReceiveDetails(roCode);
		model.addAttribute("receiveDTO", receiveDTO);
		return "receive/receiveDetails";
	}// receiveDetails [수주상세]
	
	@GetMapping("/receiveUpdate")
	public String receiveUpdate(Model model, @RequestParam("roCode") String roCode) {
		System.out.println("ReceiveController receive/receiveUpdate");
		ReceiveDTO receiveDTO = receiveService.getReceiveDetails(roCode);
		model.addAttribute("receiveDTO", receiveDTO);
		return "receive/receiveUpdate";
	}// receiveUpdate [수주수정]
	
	@PostMapping("/receiveUpdatePro")
	public String receiveUpdatePro(ReceiveDTO receiveDTO) {
		System.out.println("ReceiveController receive/receiveUpdatePro");
		System.out.println(receiveDTO);
		receiveService.receiveUpdatePro(receiveDTO);
		
		if(receiveDTO != null) {
			return "receive/msgSuccess"; // 등록완료
		}else {
			return "receive/msgFailed"; // 등록실패
		}
	}// receiveUpdatePro [수주수정Pro]
	
	@GetMapping("/receiveDelete")
	public String receiveDeletePro(ReceiveDTO receiveDTO) {
		System.out.println("ReceiveController receive/receiveDelete");
		System.out.println(receiveDTO);
		receiveService.receiveDelete(receiveDTO);
		
		if(receiveDTO != null) {
			return "receive/msgSuccess"; // 등록완료
		}else {
			return "receive/msgFailed"; // 등록실패
		}
	}// receiveDelete [수주삭제]
	
	
	
	
	/////////////////////////////////////////////////////////////////////
	
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
	
}//class
