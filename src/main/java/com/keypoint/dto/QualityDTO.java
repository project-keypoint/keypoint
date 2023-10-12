package com.keypoint.dto;

import java.util.List;

public class QualityDTO {
	
	private String prodCode;
	private String poCode;
	private String woCode;
	private String productCode;
	private String productName;
	private String lineCode;
	private int prodEmpId;
	private String prodEmpName;
	private int prodCount;
	private int poCount;
	private String prodDate;
//	private String qcDefectRate; 보류
	
	private String qcCode;
	private int qcEmpId;
	private String qcEmpName;
	private int qcPass;
	private int qcDefect;
	private String qcDefectRate;
	private String qcStartDate;
	private String qcEndDate;
	private String qcStatus;
	private String qcTest1;
	private String qcTest2;
	private String qcTest3;
	private String qcTransfer;
	
	private String shipSdate;
	
	private List<String> poCodes;
	public List<String> getPoCodes() {
        return poCodes;
    }
    public void setRoCodes(List<String> poCodes) {
        this.poCodes = poCodes;
    }
	
    private String disCode;
    private String disItemCode;
    private int disCount;
    private String disEmpId;
    private String disEmpName;
    private String disMemo;
    private String disDate;
    private int disSum;
    private String materialCode;
    private String materialName;
    
    
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
	public int getDisSum() {
		return disSum;
	}
	public void setDisSum(int disSum) {
		this.disSum = disSum;
	}
	public String getDisEmpName() {
		return disEmpName;
	}
	public void setDisEmpName(String disEmpName) {
		this.disEmpName = disEmpName;
	}
	public String getDisCode() {
		return disCode;
	}
	public void setDisCode(String disCode) {
		this.disCode = disCode;
	}
	public String getDisItemCode() {
		return disItemCode;
	}
	public void setDisItemCode(String disItemCode) {
		this.disItemCode = disItemCode;
	}
	public int getDisCount() {
		return disCount;
	}
	public void setDisCount(int disCount) {
		this.disCount = disCount;
	}
	public String getDisEmpId() {
		return disEmpId;
	}
	public void setDisEmpId(String disEmpId) {
		this.disEmpId = disEmpId;
	}
	public String getDisMemo() {
		return disMemo;
	}
	public void setDisMemo(String disMemo) {
		this.disMemo = disMemo;
	}
	public String getDisDate() {
		return disDate;
	}
	public void setDisDate(String disDate) {
		this.disDate = disDate;
	}
	public void setPoCodes(List<String> poCodes) {
		this.poCodes = poCodes;
	}
	public String getQcTransfer() {
		return qcTransfer;
	}
	public void setQcTransfer(String qcTransfer) {
		this.qcTransfer = qcTransfer;
	}
	public String getPoCode() {
		return poCode;
	}
	public void setPoCode(String poCode) {
		this.poCode = poCode;
	}
	public int getPoCount() {
		return poCount;
	}
	public void setPoCount(int poCount) {
		this.poCount = poCount;
	}
	public String getQcStartDate() {
		return qcStartDate;
	}
	public void setQcStartDate(String qcStartDate) {
		this.qcStartDate = qcStartDate;
	}
	public String getQcEndDate() {
		return qcEndDate;
	}
	public void setQcEndDate(String qcEndDate) {
		this.qcEndDate = qcEndDate;
	}
	public int getProdEmpId() {
		return prodEmpId;
	}
	public void setProdEmpId(int prodEmpId) {
		this.prodEmpId = prodEmpId;
	}
	public String getProdEmpName() {
		return prodEmpName;
	}
	public void setProdEmpName(String prodEmpName) {
		this.prodEmpName = prodEmpName;
	}
	public String getQcEmpName() {
		return qcEmpName;
	}
	public void setQcEmpName(String qcEmpName) {
		this.qcEmpName = qcEmpName;
	}
	public int getQcEmpId() {
		return qcEmpId;
	}
	public void setQcEmpId(int qcEmpId) {
		this.qcEmpId = qcEmpId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getShipSdate() {
		return shipSdate;
	}
	public void setShipSdate(String shipSdate) {
		this.shipSdate = shipSdate;
	}
	public String getProdCode() {
		return prodCode;
	}
	public void setProdCode(String prodCode) {
		this.prodCode = prodCode;
	}
	public String getWoCode() {
		return woCode;
	}
	public void setWoCode(String woCode) {
		this.woCode = woCode;
	}
	public String getProductCode() {
		return productCode;
	}
	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
	public String getLineCode() {
		return lineCode;
	}
	public void setLineCode(String lineCode) {
		this.lineCode = lineCode;
	}
	public int getProdCount() {
		return prodCount;
	}
	public void setProdCount(int prodCount) {
		this.prodCount = prodCount;
	}
	public String getProdDate() {
		return prodDate;
	}
	public void setProdDate(String prodDate) {
		this.prodDate = prodDate;
	}
	public String getQcCode() {
		return qcCode;
	}
	public void setQcCode(String qcCode) {
		this.qcCode = qcCode;
	}
	public int getQcPass() {
		return qcPass;
	}
	public void setQcPass(int qcPass) {
		this.qcPass = qcPass;
	}
	public int getQcDefect() {
		return qcDefect;
	}
	public void setQcDefect(int qcDefect) {
		this.qcDefect = qcDefect;
	}
	public String getQcDefectRate() {
		return qcDefectRate;
	}
	public void setQcDefectRate(String qcDefectRate) {
		this.qcDefectRate = qcDefectRate;
	}
	public String getQcStatus() {
		return qcStatus;
	}
	public void setQcStatus(String qcStatus) {
		this.qcStatus = qcStatus;
	}
	public String getQcTest1() {
		return qcTest1;
	}
	public void setQcTest1(String qcTest1) {
		this.qcTest1 = qcTest1;
	}
	public String getQcTest2() {
		return qcTest2;
	}
	public void setQcTest2(String qcTest2) {
		this.qcTest2 = qcTest2;
	}
	public String getQcTest3() {
		return qcTest3;
	}
	public void setQcTest3(String qcTest3) {
		this.qcTest3 = qcTest3;
	}
	
	
}//class
