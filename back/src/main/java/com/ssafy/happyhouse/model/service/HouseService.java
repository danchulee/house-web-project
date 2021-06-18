package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.happyhouse.model.AreaInfo;
import com.ssafy.happyhouse.model.HouseDeal;

public interface HouseService {

	List<HouseDeal> searchAll() throws SQLException;

	List<HouseDeal> searchDong(String gugun, String dong) throws SQLException;

	HouseDeal search(int no);

	List<HouseDeal> searchApt(String aptname) throws SQLException;
	
	AreaInfo searchAreaInfo(String gugun, String dong) throws SQLException;

}
