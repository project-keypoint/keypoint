package com.keypoint.dto;

public class ChartDTO {
	
	private String label;
    private int data;
    
    private int totalShipPrice;
    private int totalProductRate;
    private int monthlyShipPrice;
    private int monthlyProductRate;
    
	@Override
	public String toString() {
		return "ChartDTO [label=" + label + ", data=" + data + "]";
	}
	
	public String getLabel() {
		return label;
	}
	public void setLabel(String label) {
		this.label = label;
	}
	public int getData() {
		return data;
	}
	public void setData(int data) {
		this.data = data;
	}
	
	public int getTotalShipPrice() {
		return totalShipPrice;
	}
	public void setTotalShipPrice(int totalShipPrice) {
		this.totalShipPrice = totalShipPrice;
	}
	public int getTotalProductRate() {
		return totalProductRate;
	}
	public void setTotalProductRate(int totalProductRate) {
		this.totalProductRate = totalProductRate;
	}
	public int getMonthlyShipPrice() {
		return monthlyShipPrice;
	}
	public void setMonthlyShipPrice(int monthlyShipPrice) {
		this.monthlyShipPrice = monthlyShipPrice;
	}
	public int getMonthlyProductRate() {
		return monthlyProductRate;
	}
	public void setMonthlyProductRate(int monthlyProductRate) {
		this.monthlyProductRate = monthlyProductRate;
	}
}