package com.keypoint.dto;

public class LineDTO {

	private String lineCode;
	private String lineName;
	private String lineMemo;
	private String empName;
//	private String woCode;

	
	@Override
	public String toString() {
		return "LineDTO [lineCode=" + lineCode + ", lineName=" + lineName + ", lineMemo=" + lineMemo + ", empName="
				+ empName + "]";
	}
	

	public String getLineCode() {
		return lineCode;
	}

	public void setLineCode(String lineCode) {
		this.lineCode = lineCode;
	}

	public String getLineName() {
		return lineName;
	}

	public void setLineName(String lineName) {
		this.lineName = lineName;
	}

	public String getLineMemo() {
		return lineMemo;
	}

	public void setLineMemo(String lineMemo) {
		this.lineMemo = lineMemo;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

//	public String getWoCode() {
//		return woCode;
//	}
//
//	public void setWoCode(String woCode) {
//		this.woCode = woCode;
//	}
}