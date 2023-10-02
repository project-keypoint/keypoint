package com.keypoint.dto;

import java.sql.Timestamp;

public class ReceiveDTO {
	
	private String testCode;
	private String testString;
	private int testInt;
	private Timestamp testDate; // 테스트용
	
	private String roCode;
	private String cusCode;
	// private String cusName; //join
	private String productCode;
	// private String productName; //join
	private int roEmpId;
	private int roCount;
	private int roPrice;
	private String roDate; // string
	private String shipSdate; // string
	private String shipDate; // string
	private String roStatus; // 등록
	
	
	@Override
	public String toString() {
		return "ReceiveDTO [roCode="+roCode+",cusCode="+cusCode+",productCode="+productCode+
				", roEmpId="+roEmpId+",roCount"+roCount+",roPrice"+roPrice+",roDate"+roDate+
				",shipSdate"+shipSdate+",shipDate"+shipDate+",roStatus"+roStatus+"]";
	}

//	public String toString() {
//		return "ReceiveDTO [testCode=" + testCode + ", testString=" + testString +
//				", testInt=" + testInt + ", testDate=" + testDate + "]";
//	}
	
	public String getTestCode() {
		return testCode;
	}
	public void setTestCode(String testCode) {
		this.testCode = testCode;
	}
	public String getTestString() {
		return testString;
	}
	public void setTestString(String testString) {
		this.testString = testString;
	}
	public int getTestInt() {
		return testInt;
	}
	public void setTestInt(int testInt) {
		this.testInt = testInt;
	}
	public Timestamp getTestDate() {
		return testDate;
	}
	public void setTestDate(Timestamp testDate) {
		this.testDate = testDate;
	} // 테스트용 

	public String getRoCode() {
		return roCode;
	}

	public void setRoCode(String roCode) {
		this.roCode = roCode;
	}

	public String getCusCode() {
		return cusCode;
	}

	public void setCusCode(String cusCode) {
		this.cusCode = cusCode;
	}

	public String getProductCode() {
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}

	public int getRoEmpId() {
		return roEmpId;
	}

	public void setRoEmpId(int roEmpId) {
		this.roEmpId = roEmpId;
	}

	public int getRoCount() {
		return roCount;
	}

	public void setRoCount(int roCount) {
		this.roCount = roCount;
	}

	public int getRoPrice() {
		return roPrice;
	}

	public void setRoPrice(int roPrice) {
		this.roPrice = roPrice;
	}

	public String getRoDate() {
		return roDate;
	}

	public void setRoDate(String roDate) {
		this.roDate = roDate;
	}
	public String getShipSdate() {
		return shipSdate;
	}

	public void setShipSdate(String shipSdate) {
		this.shipSdate = shipSdate;
	}

	public String getShipDate() {
		return shipDate;
	}
	public void setShipDate(String shipDate) {
		this.shipDate = shipDate;
	}

	public String getRoStatus() {
		return roStatus;
	}
	public void setRoStatus(String roStatus) {
		this.roStatus = roStatus;
	}
	

}
