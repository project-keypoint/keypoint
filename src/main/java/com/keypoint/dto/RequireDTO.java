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
	private List<String> materialCodes;
	private List<String> reqCounts;
	
	private int totalReqCount;
	private String woCode;
	private int materialCount;
	
	@Override
	public String toString() {
		return "RequireDTO [productCode=" + productCode + ", productName=" + productName + ", materialCode="
				+ materialCode + ", materialName=" + materialName + ", reqCount=" + reqCount + ", totalReqCount="
				+ totalReqCount + ", materialUnit=" + materialUnit + ", reqDate=" + reqDate + ", reqUpdate=" + reqUpdate
				+ ", requireCode=" + requireCode + ", requireCodes=" + requireCodes + ", materialCodes=" + materialCodes
				+ ", reqCounts=" + reqCounts + "]";
	}
	
	public String getWoCode() {
		return woCode;
	}
	public void setWoCode(String woCode) {
		this.woCode = woCode;
	}
	public int getMaterialCount() {
		return materialCount;
	}
	public void setMaterialCount(int materialCount) {
		this.materialCount = materialCount;
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
	public int getTotalReqCount() {
		return totalReqCount;
	}
	public void setTotalReqCount(int totalReqCount) {
		this.totalReqCount = totalReqCount;
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
	public List<String> getMaterialCodes() {
		return materialCodes;
	}
	public void setMaterialCodes(List<String> materialCodes) {
		this.materialCodes = materialCodes;
	}
	public List<String> getReqCounts() {
		return reqCounts;
	}
	public void setReqCounts(List<String> reqCounts) {
		this.reqCounts = reqCounts;
	}

}// class
