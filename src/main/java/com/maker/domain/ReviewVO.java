package com.maker.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class ReviewVO {
	
	private Long rno;
	private String c_nick;
	private String r_comment;
	private float r_star;
	private Long mno;
	private Long cno;
	private Date r_reg;
	public ReviewVO() {}
	
	public ReviewVO(String c_nick, String r_comment,
			float r_star, Long mno, Long cno) {
		this.c_nick = c_nick;
		this.r_comment = r_comment;
		this.r_star = r_star;
		this.mno = mno;
		this.cno = cno;
	}
}
