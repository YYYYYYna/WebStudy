package com.sist.vo;
/*
 * SQL> desc reserve_time
 이름                                      널?      유형
 ----------------------------------------- -------- ----------------------------
 TNO                                       NOT NULL NUMBER
 TIME                                      NOT NULL VARCHAR2(150)
 */
public class ReserveTimeVO {
	private int tno;
	private String time;
	
	public int getTno() {
		return tno;
	}
	public void setTno(int tno) {
		this.tno = tno;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
	
}
