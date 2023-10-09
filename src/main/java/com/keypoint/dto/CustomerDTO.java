package com.keypoint.dto;

import java.sql.Timestamp;

public class CustomerDTO {

	
	
	
	private String cusCode;					//	거래처코드
	private String cusName;					//	거래처명
	private String cusCategory;				//	거래처구분
	private String cusBusiness;				//	업태
	private String cusType;					//	종목
	private String cusNumber;				//	사업자번호
	private String cusRep;					//	대표자명
	private String cusTel;					//	대표전화번호
	private String cusHome;					//	홈페이지
	private String cusZonecode;				//	우편번호
	private String cusAddress;				//	기본주소
	private String cusAddress_dtail;		//	상세주소
	private String cusResp;					//	담당자명
	private String cusPhone;				//	담당자전화번호
	private String cusEmail;				//	담당자이메일
	private String cusFax;					//	팩스
	private String cusMemo;					//	적요
	private String cusStatus;				//	거래상태
	
	
	
	@Override
	public String toString() {
		return "CustomerDTO [cusCode=" + cusCode + ", cusName=" + cusName + ", cusCategory=" + cusCategory
				+ ", cusBusiness=" + cusBusiness + ", cusType=" + cusType + ", cusNumber=" + cusNumber + ", cusRep="
				+ cusRep + ", cusTel=" + cusTel + ", cusHome=" + cusHome + ", cusZonecode=" + cusZonecode
				+ ", cusAddress=" + cusAddress + ", cusAddress_dtail=" + cusAddress_dtail + ", cusResp=" + cusResp
				+ ", cusPhone=" + cusPhone + ", cusEmail=" + cusEmail + ", cusFax=" + cusFax + ", cusMemo=" + cusMemo
				+ ", cusStatus=" + cusStatus + "]";
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
	public String getCusBusiness() {
		return cusBusiness;
	}
	public void setCusBusiness(String cusBusiness) {
		this.cusBusiness = cusBusiness;
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
	public String getCusZonecode() {
		return cusZonecode;
	}
	public void setCusZonecode(String cusZonecode) {
		this.cusZonecode = cusZonecode;
	}
	public String getCusAddress() {
		return cusAddress;
	}
	public void setCusAddress(String cusAddress) {
		this.cusAddress = cusAddress;
	}
	public String getCusAddress_dtail() {
		return cusAddress_dtail;
	}
	public void setCusAddress_dtail(String cusAddress_dtail) {
		this.cusAddress_dtail = cusAddress_dtail;
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
