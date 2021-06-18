package com.ssafy.happyhouse.model.service;

import java.util.List;

import com.ssafy.happyhouse.model.Notice;

public interface NoticeService {
	public List<Notice> retrieveNotice();
	public Notice detailNotice(int no);
	public boolean writeNotice(Notice notice);
	public boolean updateNotice(Notice notice);
	public boolean deleteNotice(int no);
}
