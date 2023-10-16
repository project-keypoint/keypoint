package com.keypoint.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.keypoint.dto.ChartDTO;

@Repository
public class ChartDAO {
	
	@Inject
	private SqlSession sqlSession;

	private static final String namespace = "com.itwillbs.mappers.chartMapper.";
	
	public List<ChartDTO> getMonthlyShip() {
		return sqlSession.selectList(namespace+"getMonthlyShip");
	}

}