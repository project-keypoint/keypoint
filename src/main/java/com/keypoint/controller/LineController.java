package com.keypoint.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.keypoint.dto.LineDTO;
import com.keypoint.service.LineService;

@Controller
@RequestMapping("/line/*")
public class LineController {

	@Inject
	private LineService lineService;
	
	@GetMapping("/lineList")
	public String linelist(Model model) {
		System.out.println("LineController line/lineList");
		List<LineDTO> lineList = lineService.getLineList();
		
		model.addAttribute("lineList", lineList);
		System.out.println("lineList");
		return "line/lineList";
	}//linelist
	
	
	
	
	
	
	
}
