package com.keypoint.dto;

import java.sql.Timestamp;

public class ReceiptDTO {

	private String grCode; // 입고코드
    private String poCode; // 발주코드
    private String grSdate; // 입고등록날짜
    private int grCount; // 입고예정수량
    private String grDate; // 입고예정날짜
    private int grEcount; // 입고완료수량
    private String grEdate; // 입고완료날짜
    private int grOwner; // 입고담당자
    private String grStatus; // 입고현황 (enum)
    
    
	public String getGrCode() {
		return grCode;
	}
	public void setGrCode(String grCode) {
		this.grCode = grCode;
	}
	public String getPoCode() {
		return poCode;
	}
	public void setPoCode(String poCode) {
		this.poCode = poCode;
	}
	public String getGrSdate() {
		return grSdate;
	}
	public void setGrSdate(String grSdate) {
		this.grSdate = grSdate;
	}
	public int getGrCount() {
		return grCount;
	}
	public void setGrCount(int grCount) {
		this.grCount = grCount;
	}
	public String getGrDate() {
		return grDate;
	}
	public void setGrDate(String grDate) {
		this.grDate = grDate;
	}
	public int getGrEcount() {
		return grEcount;
	}
	public void setGrEcount(int grEcount) {
		this.grEcount = grEcount;
	}
	public String getGrEdate() {
		return grEdate;
	}
	public void setGrEdate(String grEdate) {
		this.grEdate = grEdate;
	}
	public int getGrOwner() {
		return grOwner;
	}
	public void setGrOwner(int grOwner) {
		this.grOwner = grOwner;
	}
	public String getGrStatus() {
		return grStatus;
	}
	public void setGrStatus(String grStatus) {
		this.grStatus = grStatus;
	}
	
	@Override
	public String toString() {
		return "ReceiptDTO [grCode=" + grCode + ", poCode=" + poCode + ", grSdate=" + grSdate + ", grCount=" + grCount
				+ ", grDate=" + grDate + ", grEcount=" + grEcount + ", grEdate=" + grEdate + ", grOwner=" + grOwner
				+ ", grStatus=" + grStatus + "]";
	}
	
	
	
} // class
