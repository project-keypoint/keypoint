package com.keypoint.dto;

public class EmployeeDTO {
	
	private int empId; // 사원ID
	private String empPass; // 비밀번호
	private String empSalt; // 암호화(보류)
	private String empName; // 이름
	private String empPhoto; // 사진
	private String empBirth; // 생년월일
	private String empPhone; // 연락처
	private String empTel; // 내선번호
	private String empEmail; // 이메일
	private String empAddress; // 주소
	private String empAddress_dtail; // 상세주소
	private String empStatus; // 재직여부('재직','휴직','퇴직')
	private String departmentName; // 부서('영업','자재','생산','인사')
	private String empPosition; // 직급('사원','대리','부장','대표')
	private String empHiredate; // 입사일
	private int empRole; // 권한(0=퇴사자(로그인x) / 1=사원 / 2=관리자(권한+부서) / 4=대표(총관리자)
	private String empLeavedate; // 휴직일
	private String empRetiredate; // 퇴직일
	private int listEmpRole;
	
	@Override
	public String toString() {
		return "EmployeeDTO [empId="+empId+", empPass="+empPass+ ", empSalt="+empSalt+", empName="+empName
				+", empPhoto="+empPhoto+", empBirth="+empBirth+", empPhone="+empPhone+", empTel="+empTel
				+", empEmail="+empEmail+", empAddress="+empAddress+", empAddress_dtail="+empAddress_dtail+",  empStatus="+empStatus
				+", departmentName="+departmentName
				+", empPosition="+empPosition+", empHiredate="+empHiredate+", empRole="+empRole
				+", empLeavedate="+empLeavedate+", empRetiredate="+empRetiredate+"]";
	}
	
	public String getEmpAddress_dtail() {
		return empAddress_dtail;
	}
	public void setEmpAddress_dtail(String empAddress_dtail) {
		this.empAddress_dtail = empAddress_dtail;
	}
	public int getListEmpRole() {
		return listEmpRole;
	}
	public void setListEmpRole(int listEmpRole) {
		this.listEmpRole = listEmpRole;
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
