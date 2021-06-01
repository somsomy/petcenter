package com.somsomy.domain;

import java.sql.Timestamp;

public class VolunteerReplyBean {
	private int num;
	private String state;
	private String name;
	private String subject;
	private String content;
	private String file;
	private Timestamp date;
	private int readcount;
	
	private int repNum;
	private int repBoardNum;
	private int reRef;
	private int reLev;
	private int reSeq;
	private String repName;
	private String repContent;
	private Timestamp repDate;
	private Timestamp deleteAt;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public int getRepNum() {
		return repNum;
	}
	public void setRepNum(int repNum) {
		this.repNum = repNum;
	}
	public int getRepBoardNum() {
		return repBoardNum;
	}
	public void setRepBoardNum(int repBoardNum) {
		this.repBoardNum = repBoardNum;
	}
	
	public int getReRef() {
		return reRef;
	}
	public int getReLev() {
		return reLev;
	}
	public int getReSeq() {
		return reSeq;
	}
	public void setReRef(int reRef) {
		this.reRef = reRef;
	}
	public void setReLev(int reLev) {
		this.reLev = reLev;
	}
	public void setReSeq(int reSeq) {
		this.reSeq = reSeq;
	}
	public String getRepName() {
		return repName;
	}
	public void setRepName(String repName) {
		this.repName = repName;
	}
	public String getRepContent() {
		return repContent;
	}
	public void setRepContent(String repContent) {
		this.repContent = repContent;
	}
	public Timestamp getRepDate() {
		return repDate;
	}
	public void setRepDate(Timestamp repDate) {
		this.repDate = repDate;
	}
	public Timestamp getDeleteAt() {
		return deleteAt;
	}
	public void setDeleteAt(Timestamp deleteAt) {
		this.deleteAt = deleteAt;
	}
	
	
}
