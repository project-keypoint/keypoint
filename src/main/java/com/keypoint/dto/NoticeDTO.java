package com.keypoint.dto;

import java.sql.Timestamp;

import org.springframework.format.annotation.DateTimeFormat;

public class NoticeDTO {

	
	
	
	private int noticeNum;				//	글번호
	private String empId;				//	작성사 아이디(사원번호)
	private String noticeCategory;		//	구분
	private String noticeSubject;		//	제목
	private String noticeContent;		//	내용
	private Timestamp noticeDate;		//	작성일
	private int noticeReadcount;		//	조회수
	private String noticeFile;			//	파일첨부
	private String empName;				//	작성자
	private String noticeStatus;		//	글상태
	
	






	@Override
	public String toString() {
		return "NoticeDTO [noticeNum=" + noticeNum + ", empId=" + empId + ", noticeCategory=" + noticeCategory
				+ ", noticeSubject=" + noticeSubject + ", noticeContent=" + noticeContent + ", noticeDate=" + noticeDate
				+ ", noticeReadcount=" + noticeReadcount + ", noticeFile=" + noticeFile + ", empName=" + empName
				+ ", noticeStatus=" + noticeStatus + "]";
	}
	
	
	
	
	
	
	public int getNoticeNum() {
		return noticeNum;
	}
	public void setNoticeNum(int noticeNum) {
		this.noticeNum = noticeNum;
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public String getNoticeCategory() {
		return noticeCategory;
	}
	public void setNoticeCategory(String noticeCategory) {
		this.noticeCategory = noticeCategory;
	}
	public String getNoticeSubject() {
		return noticeSubject;
	}
	public void setNoticeSubject(String noticeSubject) {
		this.noticeSubject = noticeSubject;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public Timestamp getNoticeDate() {
		return noticeDate;
	}
	public void setNoticeDate(Timestamp noticeDate) {
		this.noticeDate = noticeDate;
	}
	public int getNoticeReadcount() {
		return noticeReadcount;
	}
	public void setNoticeReadcount(int noticeReadcount) {
		this.noticeReadcount = noticeReadcount;
	}
	public String getNoticeFile() {
		return noticeFile;
	}
	public void setNoticeFile(String noticeFile) {
		this.noticeFile = noticeFile;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getNoticeStatus() {
		return noticeStatus;
	}
	public void setNoticeStatus(String noticeStatus) {
		this.noticeStatus = noticeStatus;
	}

	
	
	
	
}
