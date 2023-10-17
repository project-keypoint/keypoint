package com.keypoint.dto;

import java.sql.Timestamp;
import java.util.List;

public class ReceiveDTO {
	
	private String testCode;
	private String testString;
	private int testInt;
	private Timestamp testDate; // 테스트용
	
	private String roCode;
	private String cusCode;
	private String cusName; //join
	private String productCode;
	private String productName; //join
	private int productCount;
	private int roEmpId;
	private String roEmpName; //join
	private int roCount;
	private int roPrice;
	private String roDate; // string
	private String shipSdate; // string
	private String shipDate; // string
	private String roStatus; // 등록
	
	private int shipCount;
	private int shipPrice;
	private String shipMemo;
	private int shipEmpId;
	
	private List<String> roCodes;
	public List<String> getRoCodes() {
        return roCodes;
    }
    public void setRoCodes(List<String> roCodes) {
        this.roCodes = roCodes;
    }
	
	@Override
	public String toString() {
		return "ReceiveDTO [testCode=" + testCode + ", testString=" + testString + ", testInt=" + testInt
				+ ", testDate=" + testDate + ", roCode=" + roCode + ", cusCode=" + cusCode + ", cusName=" + cusName
				+ ", productCode=" + productCode + ", productName=" + productName + ", productCount=" + productCount
				+ ", roEmpId=" + roEmpId + ", roEmpName=" + roEmpName + ", roCount=" + roCount + ", roPrice=" + roPrice
				+ ", roDate=" + roDate + ", shipSdate=" + shipSdate + ", shipDate=" + shipDate + ", roStatus="
				+ roStatus + ", shipCount=" + shipCount + ", shipPrice=" + shipPrice + ", shipMemo=" + shipMemo
				+ ", shipEmpId=" + shipEmpId + ", roCodes=" + roCodes + "]";
	}
	
	public int getShipEmpId() {
		return shipEmpId;
	}
	public void setShipEmpId(int shipEmpId) {
		this.shipEmpId = shipEmpId;
	}
	public int getShipPrice() {
		return shipPrice;
	}
	public void setShipPrice(int shipPrice) {
		this.shipPrice = shipPrice;
	}
	public int getShipCount() {
		return shipCount;
	}
	public void setShipCount(int shipCount) {
		this.shipCount = shipCount;
	}
	public String getShipMemo() {
		return shipMemo;
	}
	public void setShipMemo(String shipMemo) {
		this.shipMemo = shipMemo;
	}
	public int getProductCount() {
		return productCount;
	}
	public void setProductCount(int productCount) {
		this.productCount = productCount;
	}
	public String getCusName() {
		return cusName;
	}
	public void setCusName(String cusName) {
		this.cusName = cusName;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getRoEmpName() {
		return roEmpName;
	}
	public void setRoEmpName(String roEmpName) {
		this.roEmpName = roEmpName;
	}
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
