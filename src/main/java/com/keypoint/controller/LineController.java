package com.keypoint.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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

}
