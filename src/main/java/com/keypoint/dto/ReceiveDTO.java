package com.keypoint.dto;

import com.google.protobuf.Timestamp;

public class ReceiveDTO {
	
	private String testCode;
	private String testString;
	private int testInt;
	private Timestamp testDate;
	
	@Override
	public String toString() {
		return "MemberDTO [testCode=" + testCode + ", testString=" + testString +
				", testInt=" + testInt + ", testDate=" + testDate + "]";
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
	}
	

}
