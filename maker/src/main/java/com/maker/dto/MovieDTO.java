package com.maker.dto;

import lombok.Getter;
import lombok.ToString;

@ToString
@Getter
public class MovieDTO {
	private Long mno;
	private String mTitle;
	private String mComment;
	private String mDirect;
	private String mChar;
	private String mOpen;
	private float mStar;
	private String mImg;
	private String mTime;
	
	public MovieDTO() {}
	
	public MovieDTO(String mTitle, String mComment,
			String mDirect,String mChar,String mOpen) {
		this.mTitle = mTitle;
		this.mComment = mComment;
		this.mDirect = mDirect;
		this.mChar = mChar;
		this.mOpen = mOpen;
	}
	
}
