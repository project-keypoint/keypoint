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
		System.out.println("서비스 차트1");
        return chartDAO.getMonthlyShip();
    }

	public List<ChartDTO> getProductShipRate() {
		System.out.println("서비스 차트2");
		return chartDAO.getProductShipRate();
	}

	public ChartDTO getScores() {
		System.out.println("메인 서비스");
		return chartDAO.getScores();
	}
}