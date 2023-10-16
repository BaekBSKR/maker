package com.maker.domain;

import lombok.Data;

@Data
public class MovieVO {
	private Long mno;
	private String m_title;
	private String m_comment;
	private String m_direct;
	private String m_char;
	private String m_open;
	private float m_star;
	private String m_img;
	private String m_time;
	
	private Long count;
	
	public MovieVO() {}
	public MovieVO(String m_title, String m_time) {
		this.m_title = m_title;
		this.m_time = m_time;
	}
	public MovieVO(String m_title, String m_comment,
			String m_direct,String m_char,String m_open) {
		this.m_title = m_title;
		this.m_comment = m_comment;
		this.m_direct = m_direct;
		this.m_char = m_char;
		this.m_open = m_open;
	}
	public MovieVO(String m_title, String m_comment,
			String m_direct,String m_char,String m_open, String m_img) {
		this.m_title = m_title;
		this.m_comment = m_comment;
		this.m_direct = m_direct;
		this.m_char = m_char;
		this.m_open = m_open;
		this.m_img = m_img;
	}
}
