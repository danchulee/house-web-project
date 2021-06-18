package com.ssafy.happyhouse.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.model.Notice;

@Mapper
public interface NoticeDAO {
	public List<Notice> selectNotice();
	public Notice selectNoticeByNo(int no);
	public int insertNotice(Notice notice);
	public int updateNotice(Notice notice);
	public int deleteNotice(int no);
}