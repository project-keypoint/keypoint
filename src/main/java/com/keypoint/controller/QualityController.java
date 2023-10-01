package com.keypoint.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/qc/*")
public class QualityController {
	
	@GetMapping("/qcList")
	public String receiveTest() {
		System.out.println("QualityController qc/qcList");
		return "qc/qcList";
	}// qcList [품질검사]

}
