package com.maker.domain;

import lombok.Data;

@Data
public class CustomerVO {
	private long cno;
	private String c_id;
	private String c_pwd;
	private String c_nick;
	private String c_mail;
	private String c_birth;
}
