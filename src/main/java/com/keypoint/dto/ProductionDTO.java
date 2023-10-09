package com.keypoint.dto;

public class ProductionDTO {
	
	private String poCode; // 실적코드
	private String woCode; // 작업지시코드
	private String roCode; // 수주코드
	private int empId; // 작업지시자
	private String lineCode; // 라인코드
	private String productCode; // 상품코드
	private int poCount; // 생산수량
	private int woCount; // 지시수량
	private String poDate; // 실적일자
	private String productName; //상품이름
	private String cusCode; //거래처 코드
	private String cusName; // 거래처 명
	private String empName; // 사원 명
	private String woStatus; // 지시 상태
	private String qcDefectRate; // 불량률
	private String poGood; // 양품
	private String poErr; // 불량
	private String poCause; // 사유
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@Override
	public String toString() {
		return "ProductionDTO [poCode=" + poCode + ", woCode=" + woCode + ", roCode=" + roCode + ", empId=" + empId
				+ ", lineCode=" + lineCode + ", productCode=" + productCode + ", poCount=" + poCount + ", woCount="
				+ woCount + ", poDate=" + poDate + ", productName=" + productName + ", cusCode=" + cusCode
				+ ", cusName=" + cusName + ", empName=" + empName + ", woStatus=" + woStatus + ", qcDefectRate="
				+ qcDefectRate + ", poGood=" + poGood + ", poErr=" + poErr + ", poCause=" + poCause + "]";
	}
	public String getPoCode() {
		return poCode;
	}
	public void setPoCode(String poCode) {
		this.poCode = poCode;
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
	public String getProductCode() {
		return productCode;
	}
	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
	public int getPoCount() {
		return poCount;
	}
	public void setPoCount(int poCount) {
		this.poCount = poCount;
	}
	public int getWoCount() {
		return woCount;
	}
	public void setWoCount(int woCount) {
		this.woCount = woCount;
	}
	public String getPoDate() {
		return poDate;
	}
	public void setPoDate(String poDate) {
		this.poDate = poDate;
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
	public String getWoStatus() {
		return woStatus;
	}
	public void setWoStatus(String woStatus) {
		this.woStatus = woStatus;
	}
	public String getQcDefectRate() {
		return qcDefectRate;
	}
	public void setQcDefectRate(String qcDefectRate) {
		this.qcDefectRate = qcDefectRate;
	}
	public String getPoGood() {
		return poGood;
	}
	public void setPoGood(String poGood) {
		this.poGood = poGood;
	}
	public String getPoErr() {
		return poErr;
	}
	public void setPoErr(String poErr) {
		this.poErr = poErr;
	}
	public String getPoCause() {
		return poCause;
	}
	public void setPoCause(String poCause) {
		this.poCause = poCause;
	}
	
	
	
	

	
	
	
	
	
	
	
	



	
	
	
	
	
	
	
	
	
	
	
	
}
