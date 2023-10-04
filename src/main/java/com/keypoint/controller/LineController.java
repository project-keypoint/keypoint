package com.keypoint.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.keypoint.dto.LineDTO;
import com.keypoint.dto.ReceiveDTO;
import com.keypoint.service.LineService;

@Controller
@RequestMapping("/line/*")
public class LineController {

	@Inject
	private LineService lineService;

	@GetMapping("/lineList")
	public String lineList(Model model) {
		System.out.println("LineController line/lineList");
		List<LineDTO> lineList = lineService.getLineList();
		model.addAttribute("lineList", lineList);
		System.out.println("lineList");
		return "line/lineList";
	}// 라인목록조회

	@GetMapping("/lineInsert")
	public String lineInsert (){
		System.out.println("LineController line/lineInsert");
		return "line/lineInsert";
	}// 라인등록

	@PostMapping("/lineInsertPro")
	public String lineInsertPro(LineDTO lineDTO) {
		System.out.println("LineController line/lineInsertPro");
		System.out.println(lineDTO);
		lineService.lineInsertPro(lineDTO);

		if (lineDTO != null) {
			return "line/msgSuccess"; // 등록완료
		} else {
			return "line/msgFailed"; // 등록실패
		}
	}// 라인등록Pro

	@GetMapping("/lineDetails")
	public String lineDetails(Model model, @RequestParam("lineCode") String lineCode) {
		System.out.println("LineController line/lineDetails");
		LineDTO lineDTO = lineService.getlineDetails(lineCode);
		System.out.println("lineCode"+lineCode);
		System.out.println("LineDTO"+lineDTO);
		model.addAttribute("lineDTO", lineDTO);
		return "line/lineDetails";
	}// receiveDetails [수주상세]
	
	@GetMapping("/lineUpdate")
	public String lineUpdate(Model model, @RequestParam("lineCode") String lineCode) {
		System.out.println("LineController line/lineUpdate");
		LineDTO lineDTO = lineService.getlineDetails(lineCode);
		model.addAttribute("lineDTO", lineDTO);
		return "line/lineUpdate";
	}// receiveUpdate [수주수정]
	
	
	@PostMapping("/lineUpdatePro")
	public String lineUpdatePro(LineDTO lineDTO) {
		System.out.println("LIneController line/lineUpdatePro");
		System.out.println(lineDTO);
		lineService.lineUpdatePro(lineDTO);
		
		if(lineDTO != null) {
			return "line/msgSuccess"; // 등록완료
		}else {
			return "line/msgFailed"; // 등록실패
		}
	}// receiveUpdatePro [수주수정Pro]
	
	
	
	
	
}
