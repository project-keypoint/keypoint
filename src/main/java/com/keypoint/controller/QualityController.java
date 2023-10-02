package com.keypoint.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.keypoint.dto.QualityDTO;
import com.keypoint.service.QualityService;

@Controller
@RequestMapping("/qc/*")
public class QualityController {
	
	@Inject
	private QualityService qualityService;
	
	@GetMapping("/qcList")
	public String qcList(Model model) {
		System.out.println("QualityController qc/qcList");
		List<QualityDTO> qcList = qualityService.getQcList();
		model.addAttribute("qcList", qcList);
		return "qc/qcList";
	}// qcList [품질검사목록(+생산목록)]
	
	@GetMapping("/qcDetails")
	public String qcDetails(Model model, @RequestParam("prodCode") String prodCode) {
		System.out.println("QualityController qc/qcDetails");
		QualityDTO qualityDTO = qualityService.getQcDetails(prodCode);
		model.addAttribute("qualityDTO", qualityDTO);
		return "qc/qcDetails";
	}// qcDetails [품질검사상세]
	
	@PostMapping("/qcStart")
	public String qcStart(QualityDTO qualityDTO) {
		System.out.println("ReceiveController qcStart");
		System.out.println(qualityDTO);
		qualityService.qcStart(qualityDTO);
		
		if(qualityDTO != null) {
			return "receive/msgSuccess"; // 등록완료
		}else {
			return "receive/msgFailed"; // 등록실패
		}
	}// qcStart [품질검사등록(시작)]
	
//	@GetMapping("/qcUpdate")
//	public String qcUpdate() {
//		System.out.println("QualityController qc/qcUpdate");
//		return "qc/qcUpdate";
//	}// qcUpdate [품질검사 진행(수정)]
	
	@GetMapping("/qcUpdate")
	public String qcUpdate(Model model, @RequestParam("prodCode") String prodCode) {
		System.out.println("QualityController qc/qcUpdate");
		QualityDTO  qualityDTO = qualityService.getQcDetails(prodCode);
		model.addAttribute("qualityDTO", qualityDTO);
		return "qc/qcUpdate";
	}// qcUpdate [품질검사수정(진행)]
	
	@PostMapping("/qcUpdatePro")
	public String qcUpdatePro(QualityDTO qualityDTO) {
		System.out.println("QualityController qcUpdatePro");
		System.out.println(qualityDTO);
		qualityService.qcUpdatePro(qualityDTO);
		
		if(qualityDTO != null) {
			return "receive/msgSuccess"; // 등록완료
		}else {
			return "receive/msgFailed"; // 등록실패
		}
	}// qcUpdatePro [품질검사(저장)]
	
	
	
	
	
	
}//class
	
	
	
	
	

