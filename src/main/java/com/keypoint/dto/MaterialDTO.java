package com.keypoint.dto;

public class MaterialDTO {

	private String materialCode;
	private String materialName;
	private String cusCode;
	private String cusName;
	private String materialPrice;
	private int materialCount;
	private String materialUnit;
	private String materialMemo;
	private int materialDel;
	
	@Override
	public String toString() {
		return "MaterialDTO [materialCode=" + materialCode + ", materialName=" + materialName + ", cusCode=" + cusCode
				+ ", cusName=" + cusName + ", materialPrice=" + materialPrice + ", materialCount=" + materialCount
				+ ", materialUnit=" + materialUnit + ", materialMemo=" + materialMemo + ", materialDel=" + materialDel
				+ "]";
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
	public String getMaterialPrice() {
		return materialPrice;
	}
	public void setMaterialPrice(String materialPrice) {
		this.materialPrice = materialPrice;
	}
	public int getMaterialCount() {
		return materialCount;
	}
	public void setMaterialCount(int materialCount) {
		this.materialCount = materialCount;
	}
	public String getMaterialUnit() {
		return materialUnit;
	}
	public void setMaterialUnit(String materialUnit) {
		this.materialUnit = materialUnit;
	}
	public String getMaterialMemo() {
		return materialMemo;
	}
	public void setMaterialMemo(String materialMemo) {
		this.materialMemo = materialMemo;
	}
	public int getMaterialDel() {
		return materialDel;
	}
	public void setMaterialDel(int materialDel) {
		this.materialDel = materialDel;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
} // class
