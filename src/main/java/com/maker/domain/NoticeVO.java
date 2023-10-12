package com.maker.domain;

import java.util.Date;

import lombok.Data;


@Data
public class NoticeVO {
	private long nno;
	private String n_title;
	private String n_comment;
	private Date n_reg;
	private long cno;
	
}
