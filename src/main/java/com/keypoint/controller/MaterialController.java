package com.keypoint.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.keypoint.dto.MaterialDTO;
import com.keypoint.service.MaterialService;

@Controller
@RequestMapping("/material/*")
public class MaterialController {
	
	//materialService 객체생성
	@Inject
	private MaterialService materialService;

	
	
	
//	가상주소 http://localhost:8080/keypoint/material/materialList
	@GetMapping("/materialList")
	public String materialList(Model model) {
		List<MaterialDTO> materialList = materialService.getMaterialList();
		model.addAttribute("materialList", materialList);
		// WEB-INF/views/material/materialList.jsp
		return "material/materialList";
	}// materialList [자재목록]
	
	@GetMapping("/materialInsert")
	public String materialInsert() {
		return "material/materialInsert";
	}// materialInsert [자재등록]	
	
	@PostMapping("/materialInsertPro")
	public String materialInsertPro(MaterialDTO materialDTO) {
		System.out.println("MaterialController materialInsertPro()");
		//회원가입 처리
		System.out.println(materialDTO);
		
		materialService.insertMaterial(materialDTO);
		
		return "material/close";
	}// materialInsertPro [자재등록]	
	
	@GetMapping("/materialUpdate")
	public String materialUpdate() {
		return "material/materialUpdate";
	}// materialUpdate [자재수정]
	
	
	
	
	
	
	
	
	
	
	
}// class
