package com.maker.vo;

import lombok.Data;

@Data
public class MovieVO {
	private Long mno;
	private String mTitle;
	private String mComment;
	private String mDirect;
	private String mChar;
	private String mOpen;
	private float mStar;
	private String mImg;
	private String mTime;
	
	public MovieVO() {}
	public MovieVO(String mTitle, String mTime) {
		this.mTitle = mTitle;
		this.mTime = mTime;
	}
	public MovieVO(String mTitle, String mComment,
			String mDirect,String mChar,String mOpen) {
		this.mTitle = mTitle;
		this.mComment = mComment;
		this.mDirect = mDirect;
		this.mChar = mChar;
		this.mOpen = mOpen;
	}
	public MovieVO(String mTitle, String mComment,
			String mDirect,String mChar,String mOpen, String mImg) {
		this.mTitle = mTitle;
		this.mComment = mComment;
		this.mDirect = mDirect;
		this.mChar = mChar;
		this.mOpen = mOpen;
		this.mImg = mImg;
	}
}
