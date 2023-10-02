package com.keypoint.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/qc/*")
public class QualityController {
	
	@GetMapping("/qcList")
	public String qcList() {
		System.out.println("QualityController qc/qcList");
		return "qc/qcList";
	}// qcList [품질검사현황List]
	
	@GetMapping("/qcTargetList")
	public String qcTargetList() {
		System.out.println("QualityController qc/qcTargetList");
		return "qc/qcTargetList";
	}// qcList [품질검사대상List]
	
	@GetMapping("/qcDetails")
	public String qcDetails() {
		System.out.println("QualityController qc/qcDetails");
		return "qc/qcDetails";
	}// qcDetails [품질검사상세]
	
	@GetMapping("/qcUpdate")
	public String qcUpdate() {
		System.out.println("QualityController qc/qcUpdate");
		return "qc/qcUpdate";
	}// qcUpdate [품질검사 진행(수정)]
	
}
