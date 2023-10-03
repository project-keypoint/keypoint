package com.keypoint.dto;

import java.sql.Timestamp;

public class CustomerDTO {

	
	
	
	private String cusCode;
	private String cusName;
	private String cusCategory;
	private String cusType;
	private String cusNumber;
	private String cusRep;
	private String cusTel;
	private String cusHome;
	private String cusAddress;
	private String cusResp;
	private String cusPhone;
	private String cusEmail;
	private String cusFax;
	private String cusMemo;
	private String cusStatus;
	private Timestamp cusDate;		// 거래처 등록일
	
	
	
	
	
	@Override
	public String toString() {
		return "CustomerDTO [cusCode=" + cusCode + ", cusName=" + cusName + ", cusCategory=" + cusCategory
				+ ", cusType=" + cusType + ", cusNumber=" + cusNumber + ", cusRep=" + cusRep + ", cusTel=" + cusTel
				+ ", cusHome=" + cusHome + ", cusAddress=" + cusAddress + ", cusResp=" + cusResp + ", cusPhone="
				+ cusPhone + ", cusEmail=" + cusEmail + ", cusFax=" + cusFax + ", cusMemo=" + cusMemo + ", cusStatus="
				+ cusStatus + ", cusDate=" + cusDate + "]";
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
	public String getCusCategory() {
		return cusCategory;
	}
	public void setCusCategory(String cusCategory) {
		this.cusCategory = cusCategory;
	}
	public String getCusType() {
		return cusType;
	}
	public void setCusType(String cusType) {
		this.cusType = cusType;
	}
	public String getCusNumber() {
		return cusNumber;
	}
	public void setCusNumber(String cusNumber) {
		this.cusNumber = cusNumber;
	}
	public String getCusRep() {
		return cusRep;
	}
	public void setCusRep(String cusRep) {
		this.cusRep = cusRep;
	}
	public String getCusTel() {
		return cusTel;
	}
	public void setCusTel(String cusTel) {
		this.cusTel = cusTel;
	}
	public String getCusHome() {
		return cusHome;
	}
	public void setCusHome(String cusHome) {
		this.cusHome = cusHome;
	}
	public String getCusAddress() {
		return cusAddress;
	}
	public void setCusAddress(String cusAddress) {
		this.cusAddress = cusAddress;
	}
	public String getCusResp() {
		return cusResp;
	}
	public void setCusResp(String cusResp) {
		this.cusResp = cusResp;
	}
	public String getCusPhone() {
		return cusPhone;
	}
	public void setCusPhone(String cusPhone) {
		this.cusPhone = cusPhone;
	}
	public String getCusEmail() {
		return cusEmail;
	}
	public void setCusEmail(String cusEmail) {
		this.cusEmail = cusEmail;
	}
	public String getCusFax() {
		return cusFax;
	}
	public void setCusFax(String cusFax) {
		this.cusFax = cusFax;
	}
	public String getCusMemo() {
		return cusMemo;
	}
	public void setCusMemo(String cusMemo) {
		this.cusMemo = cusMemo;
	}
	public String getCusStatus() {
		return cusStatus;
	}
	public void setCusStatus(String cusStatus) {
		this.cusStatus = cusStatus;
	}
	public Timestamp getCusDate() {
		return cusDate;
	}
	public void setCusDate(Timestamp cusDate) {
		this.cusDate = cusDate;
	}
	
	
	

	
	
	
	
	
	
	
	
}
