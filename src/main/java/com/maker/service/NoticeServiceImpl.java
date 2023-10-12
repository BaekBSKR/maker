package com.maker.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.maker.domain.Criteria;
import com.maker.domain.NoticeVO;
import com.maker.mapper.NoticeMapper;

import jdk.internal.org.jline.utils.Log;
import lombok.extern.log4j.Log4j;


@Service
@Log4j
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeMapper noticeMapper;
	
	@Override
	public void noticeEnroll(NoticeVO notice) {
		noticeMapper.noticeEnroll(notice);

	}

	@Override
	public List<NoticeVO> noticeGetList(Criteria cri) {
		log.info("(Service)noticeGetList()........" + cri);
		
		return noticeMapper.noticeGetList(cri);
	}

	@Override
	public int noticeGetTotal(Criteria cri) {
		log.info("(Service)noticeGetTotal()........" + cri);
		
		return noticeMapper.noticeGetTotal(cri);
	}

	@Override
	public NoticeVO noticeGetDetail(long nno) {
		log.info("(Service)noticeGetDetail().........." + nno);
		
		return noticeMapper.noticeGetDetail(nno);
	}

	@Override
	public int noticeModify(NoticeVO notice) {
		log.info("(Service)noticeModify().........." + notice);
		
		return noticeMapper.noticeModify(notice);
	}

	@Override
	public long noticeDelete(long nno) {
		log.info("(Service)noticeDelete().........." + nno);
		return noticeMapper.noticeDelete(nno);
	}

}
