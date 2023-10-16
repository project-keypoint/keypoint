package com.keypoint.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.keypoint.service.ChartService;

@Controller
public class ChartController {

	@Inject
	private ChartService chartService;

//	@RequestMapping(value = "/main/chart", method = RequestMethod.GET)
//	public String getCalendar() {
//
//		return "/main/chart";
//	}

}