package com.keypoint.dto;

public class RequireDTO {

	private String productCode;
	private String productName;
	private String materialCode;
	private String materialName;
	private int reqCount;
	private String materialUnit;
	private String requireCode;
	@Override
	public String toString() {
		return "RequireDTO [productCode=" + productCode + ", productName=" + productName + ", materialCode="
				+ materialCode + ", materialName=" + materialName + ", reqCount=" + reqCount + ", materialUnit="
				+ materialUnit + ", requireCode=" + requireCode + "]";
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
	public String getRequireCode() {
		return requireCode;
	}
	public void setRequireCode(String requireCode) {
		this.requireCode = requireCode;
	}
	

}// class
