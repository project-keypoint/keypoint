package com.keypoint.dto;

public class ProductDTO {

	private String productCode;
	private String productName;
	private String cusCode;
	private int productPrice;
	private int productCount;
	private String productUnit;
	private String productMemo;
	
	@Override
	public String toString() {
		return "ProductDTO [productCode=" + productCode + ", productName=" + productName + ", cusCode=" + cusCode
				+ ", productPrice=" + productPrice + ", productCount=" + productCount + ", productUnit=" + productUnit
				+ ", productMemo=" + productMemo + "]";
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
	public String getCusCode() {
		return cusCode;
	}
	public void setCusCode(String cusCode) {
		this.cusCode = cusCode;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public int getProductCount() {
		return productCount;
	}
	public void setProductCount(int productCount) {
		this.productCount = productCount;
	}
	public String getProductUnit() {
		return productUnit;
	}
	public void setProductUnit(String productUnit) {
		this.productUnit = productUnit;
	}
	public String getProductMemo() {
		return productMemo;
	}
	public void setProductMemo(String productMemo) {
		this.productMemo = productMemo;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
} // class
