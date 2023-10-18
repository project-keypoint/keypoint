package com.keypoint.dto;

import java.util.List;

public class RequireDTO {

	private String productCode;
	private String productName;
	private String materialCode;
	private String materialName;
	private int reqCount;
	private String materialUnit;
	private String reqDate;
	private String reqUpdate;
	private String requireCode;
	private List<String> requireCodes;
	@Override
	public String toString() {
		return "RequireDTO [productCode=" + productCode + ", productName=" + productName + ", materialCode="
				+ materialCode + ", materialName=" + materialName + ", reqCount=" + reqCount + ", materialUnit="
				+ materialUnit + ", reqDate=" + reqDate + ", reqUpdate=" + reqUpdate + ", requireCode=" + requireCode
				+ ", requireCodes=" + requireCodes + "]";
	}
	public String getProductCode() {
		return productCode;
	}
	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getMaterialCode() {
		return materialCode;
	}
	public void setMaterialCode(String materialCode) {
		this.materialCode = materialCode;
	}
	public String getMaterialName() {
		return materialName;
	}
	public void setMaterialName(String materialName) {
		this.materialName = materialName;
	}
	public int getReqCount() {
		return reqCount;
	}
	public void setReqCount(int reqCount) {
		this.reqCount = reqCount;
	}
	public String getMaterialUnit() {
		return materialUnit;
	}
	public void setMaterialUnit(String materialUnit) {
		this.materialUnit = materialUnit;
	}
	public String getReqDate() {
		return reqDate;
	}
	public void setReqDate(String reqDate) {
		this.reqDate = reqDate;
	}
	public String getReqUpdate() {
		return reqUpdate;
	}
	public void setReqUpdate(String reqUpdate) {
		this.reqUpdate = reqUpdate;
	}
	public String getRequireCode() {
		return requireCode;
	}
	public void setRequireCode(String requireCode) {
		this.requireCode = requireCode;
	}
	public List<String> getRequireCodes() {
		return requireCodes;
	}
	public void setRequireCodes(List<String> requireCodes) {
		this.requireCodes = requireCodes;
	}

}// class
