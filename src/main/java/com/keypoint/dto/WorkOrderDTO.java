package com.keypoint.dto;

import java.sql.Timestamp;

public class WorkOrderDTO {
	
	private String woCode;
	private String roCode;
	private int empId;
	private String lineCode;
	private String mfgCode;
	private String productCode;
	private String materialCode;
	private int woCount;
	private String woStatus;
	private Timestamp woDate;
	
	

	
	
	
	@Override
	public String toString() {
		return "WorkOrderDTO [woCode=" + woCode + ", roCode=" + roCode + ", empId=" + empId + ", lineCode=" + lineCode
				+ ", mfgCode=" + mfgCode + ", productCode=" + productCode + ", materialCode=" + materialCode
				+ ", woCount=" + woCount + ", woStatus=" + woStatus + ", woDate=" + woDate + "]";
	}
	
	
	public String getWoCode() {
		return woCode;
	}
	public void setWoCode(String woCode) {
		this.woCode = woCode;
	}
	public String getRoCode() {
		return roCode;
	}
	public void setRoCode(String roCode) {
		this.roCode = roCode;
	}
	public int getEmpId() {
		return empId;
	}
	public void setEmpId(int empId) {
		this.empId = empId;
	}
	public String getLineCode() {
		return lineCode;
	}
	public void setLineCode(String lineCode) {
		this.lineCode = lineCode;
	}
	public String getMfgCode() {
		return mfgCode;
	}
	public void setMfgCode(String mfgCode) {
		this.mfgCode = mfgCode;
	}
	public String getProductCode() {
		return productCode;
	}
	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
	public String getMaterialCode() {
		return materialCode;
	}
	public void setMaterialCode(String materialCode) {
		this.materialCode = materialCode;
	}
	public int getWoCount() {
		return woCount;
	}
	public void setWoCount(int woCount) {
		this.woCount = woCount;
	}
	public String getWoStatus() {
		return woStatus;
	}
	public void setWoStatus(String woStatus) {
		this.woStatus = woStatus;
	}
	public Timestamp getWoDate() {
		return woDate;
	}
	public void setWoDate(Timestamp woDate) {
		this.woDate = woDate;
	}
	
	
	
	
	
	
	
	
	
	
}
