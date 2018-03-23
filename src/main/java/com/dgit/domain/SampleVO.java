package com.dgit.domain;

public class SampleVO {
	private int mno;
	private String first;
	private String lastName;
	public Object HttpStatus;
	
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getFirst() {
		return first;
	}
	public void setFirst(String first) {
		this.first = first;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	@Override
	public String toString() {
		return "SampleVO [mno=" + mno + ", first=" + first + ", lastName=" + lastName + "]";
	}
	
}
