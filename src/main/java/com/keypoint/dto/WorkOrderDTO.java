package com.keypoint.dto;

import java.sql.Timestamp;

public class WorkOrderDTO {

	private String woCode; // 작업지시코드
	private String roCode; // 수주코드
	private int empId; // 작업지시자
	private String lineCode; // 라인코드
	private String lineName; // 라인명
	private String mfgCode; // 공정코드
	private String productCode; // 상품코드
	private String materialCode; // 자재코드
	private int woCount; // 지시수량
	private String woStatus; // 지시상태
	private String woDate; // 지시일자
	private String productName; //상품이름
	private String cusCode; //거래처 코드
	private String cusName; // 거래처 명
	private String empName; // 사원 명
	private String shipSdate; // 납품예정일
	
	private String stockCheck;

	@Override
	public String toString() {
		return "WorkOrderDTO [woCode=" + woCode + ", roCode=" + roCode + ", empId=" + empId + ", lineCode=" + lineCode
				+ ", lineName=" + lineName + ", mfgCode=" + mfgCode + ", productCode=" + productCode + ", materialCode="
				+ materialCode + ", woCount=" + woCount + ", woStatus=" + woStatus + ", woDate=" + woDate
				+ ", productName=" + productName + ", cusCode=" + cusCode + ", cusName=" + cusName + ", empName="
				+ empName + ", shipSdate=" + shipSdate + "]";
	}

	
	
	public String getStockCheck() {
		return stockCheck;
	}
	public void setStockCheck(String stockCheck) {
		this.stockCheck = stockCheck;
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

	public String getWoDate() {
		return woDate;
	}

	public void setWoDate(String woDate) {
		this.woDate = woDate;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getCusCode() {
		return cusCode;
	}

	public void setCusCode(String cusCode) {
		this.cusCode = cusCode;
	}

	public String getCusName() {
		return cusName;
	}

	public void setCusName(String cusName) {
		this.cusName = cusName;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getShipSdate() {
		return shipSdate;
	}

	public void setShipSdate(String shipSdate) {
		this.shipSdate = shipSdate;
	}


	public String getLineName() {
		return lineName;
	}

	public void setLineName(String lineName) {
		this.lineName = lineName;
	}
	
	
	
	
	
}
