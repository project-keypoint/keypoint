package com.keypoint.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.keypoint.dao.ChartDAO;
import com.keypoint.dto.ChartDTO;


@Service
public class ChartService {
	
	@Inject
	private ChartDAO chartDAO;

	public List<ChartDTO> getMonthlyShip() {
		System.out.println("서비스 차트");
        return chartDAO.getMonthlyShip();
    }
}