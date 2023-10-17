package com.keypoint.dto;

public class ChartDTO {
	private String label;
    private int data;
    
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

}