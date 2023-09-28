package com.keypoint.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.keypoint.service.WorkOrderService;

@Controller
@RequestMapping("/workOrder/*")
public class WorkOrderController {
	
	@Inject
	private WorkOrderService workOrderService;
	
	
	@GetMapping("/workOrder")
	public String workOrder() {
		System.out.println("WorkOrderController workOrder/workOrder");
		return "workOrder/workOrder";
	}// workOrder [작업지시]
	
	
	
	
}
