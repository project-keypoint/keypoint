package com.keypoint.dto;

public class LineDTO {

	private String lineCode;
	private String lineName;
	private String lineMemo;
	private String lineEmp;
	private String woCode;

	@Override
	public String toString() {
		return "LineDTO [lineCode=" + lineCode + ", lineName=" + lineName + ", lineMemo=" + lineMemo + ", lineEmp="
				+ lineEmp + ", woCode=" + woCode + "]";
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

	public String getLineEmp() {
		return lineEmp;
	}

	public void setLineEmp(String lineEmp) {
		this.lineEmp = lineEmp;
	}

	public String getWoCode() {
		return woCode;
	}

	public void setWoCode(String woCode) {
		this.woCode = woCode;
	}
}