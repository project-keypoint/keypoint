package com.keypoint.dto;

import java.sql.Timestamp;

public class NoticeDTO {

	
	
	
	private int noticeNum;
	private String empId;
	private String noticeCategory;
	private String noticeSubject;
	private String noticeContent;
	private Timestamp noticeDate;
	private int noticeReadcount;
	private String noticeFile;
	
	
	
	
	@Override
	public String toString() {
		return "NoticeDTO [noticeNum=" + noticeNum + ", empId=" + empId + ", noticeCategory=" + noticeCategory
				+ ", noticeSubject=" + noticeSubject + ", noticeContent=" + noticeContent + ", noticeDate=" + noticeDate
				+ ", noticeReadcount=" + noticeReadcount + ", noticeFile=" + noticeFile + "]";
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
	
	
	
	
	
	
	
	
	
}
