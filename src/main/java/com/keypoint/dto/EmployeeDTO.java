package com.keypoint.dto;

import java.sql.Timestamp;

public class EmployeeDTO {
	
	private int empId; // 사원ID
	private String empPass;
	private String empSalt;
	private String empName;
	private String empPhoto;
	private String empBirth; // String ? Timestamp (date)
	private String empPhone; // 연락처
	private String empTel; // 내선번호
	private String empEmail;
	private String empAddress;
	private String empStatus; // 재직여부('재직','휴직','퇴직')
	private String departmentId; // 부서ID
	private String departmentName; // 부서('영업','자재','생산','인사')
	private String empPosition; // 직급('사원','대리','부장','이사','대표')
	private String empHiredate; // 입사일
	private int empRole; // 권한(1=관리자 / 2=사원 / 3=퇴사자(로그인x))
	private String empLeavedate; // 휴직일 (date)
	private String empRetiredate; // 퇴사일 (date)
	
	@Override
	public String toString() {
		return "EmployeeDTO [empId="+empId+", empPass="+empPass+ ", empSalt="+empSalt+", empName="+empName
				+", empPhoto="+empPhoto+", empBirth="+empBirth+", empPhone="+empPhone+", empTel="+empTel
				+", empEmail="+empEmail+", empAddress="+empAddress+", empStatus="+empStatus
				+", departmentId="+departmentId+", departmentName="+departmentName
				+", empPosition="+empPosition+", empHiredate="+empHiredate+", empRole="+empRole
				+", empLeavedate="+empLeavedate+", empRetiredate="+empRetiredate+"]";
	}
	
	
	public int getEmpId() {
		return empId;
	}
	public void setEmpId(int empId) {
		this.empId = empId;
	}
	public String getEmpPass() {
		return empPass;
	}
	public void setEmpPass(String empPass) {
		this.empPass = empPass;
	}
	public String getEmpSalt() {
		return empSalt;
	}
	public void setEmpSalt(String empSalt) {
		this.empSalt = empSalt;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getEmpPhoto() {
		return empPhoto;
	}
	public void setEmpPhoto(String empPhoto) {
		this.empPhoto = empPhoto;
	}
	public String getEmpBirth() {
		return empBirth;
	}
	public void setEmpBirth(String empBirth) {
		this.empBirth = empBirth;
	}
	public String getEmpPhone() {
		return empPhone;
	}
	public void setEmpPhone(String empPhone) {
		this.empPhone = empPhone;
	}
	public String getEmpTel() {
		return empTel;
	}
	public void setEmpTel(String empTel) {
		this.empTel = empTel;
	}
	public String getEmpEmail() {
		return empEmail;
	}
	public void setEmpEmail(String empEmail) {
		this.empEmail = empEmail;
	}
	public String getEmpAddress() {
		return empAddress;
	}
	public void setEmpAddress(String empAddress) {
		this.empAddress = empAddress;
	}
	public String getEmpStatus() {
		return empStatus;
	}
	public void setEmpStatus(String empStatus) {
		this.empStatus = empStatus;
	}
	public String getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(String departmentId) {
		this.departmentId = departmentId;
	}
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	public String getEmpPosition() {
		return empPosition;
	}
	public void setEmpPosition(String empPosition) {
		this.empPosition = empPosition;
	}
	public String getEmpHiredate() {
		return empHiredate;
	}
	public void setEmpHiredate(String empHiredate) {
		this.empHiredate = empHiredate;
	}
	public int getEmpRole() {
		return empRole;
	}
	public void setEmpRole(int empRole) {
		this.empRole = empRole;
	}
	public String getEmpLeavedate() {
		return empLeavedate;
	}
	public void setEmpLeavedate(String empLeavedate) {
		this.empLeavedate = empLeavedate;
	}
	public String getEmpRetiredate() {
		return empRetiredate;
	}
	public void setEmpRetiredate(String empRetiredate) {
		this.empRetiredate = empRetiredate;
	}

	
	
	

}
