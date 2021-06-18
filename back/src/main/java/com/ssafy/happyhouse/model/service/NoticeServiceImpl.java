package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.happyhouse.model.Notice;
import com.ssafy.happyhouse.model.mapper.NoticeDAO; 

@Service
public class NoticeServiceImpl implements NoticeService {
	
    @Autowired
	private NoticeDAO noticeDao;

    @Override
	public List<Notice> retrieveNotice() {
		return noticeDao.selectNotice();
	}
    
  	@Override
	public boolean writeNotice(Notice notice) {
		return noticeDao.insertNotice(notice) == 1;
	}

	@Override
	public Notice detailNotice(int no) {
		return noticeDao.selectNoticeByNo(no);
	}

	@Override
	@Transactional
	public boolean updateNotice(Notice notice) {
		return noticeDao.updateNotice(notice) == 1;
	}

	@Override
	@Transactional
	public boolean deleteNotice(int no) {
		return noticeDao.deleteNotice(no) == 1;
	}
}