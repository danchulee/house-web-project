package com.ssafy.happyhouse.model.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.AreaInfo;
import com.ssafy.happyhouse.model.HouseDeal;
import com.ssafy.happyhouse.model.HouseInfo;

public interface HouseMapper {

	public void loadData();

	public List<HouseDeal> searchAll() throws SQLException;
	
	public AreaInfo searchDongInfo(Map<String, Object> param) throws SQLException;

	public List<HouseDeal> searchDong(Map<String, Object> param) throws SQLException;

	public HouseDeal search(int no);

	public List<HouseDeal> searchApt(Map<String, Object> param) throws SQLException;
}
