package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.happyhouse.model.mapper.HouseMapper;
import com.ssafy.happyhouse.model.AreaInfo;
import com.ssafy.happyhouse.model.HouseDeal;
import com.ssafy.happyhouse.model.HouseInfo;

@Service
public class HouseServiceImpl implements HouseService {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<HouseDeal> searchAll() throws SQLException {
		return sqlSession.getMapper(HouseMapper.class).searchAll();
	}

	@Override
	public HouseDeal search(int no) {
		return sqlSession.getMapper(HouseMapper.class).search(no);
	}

	@Override
    public List<HouseDeal> searchDong(String gugun, String dong) throws SQLException {
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("gugun", gugun);
        param.put("dong", dong);
        System.out.println(gugun);
        System.out.println(dong);
        AreaInfo info = sqlSession.getMapper(HouseMapper.class).searchDongInfo(param);
        if(info == null) return null;
        param.clear();
        param.put("dongcode", info.getDongcode() == null? "" : info.getDongcode());
        param.put("dong", dong == null? "" : dong);
        return sqlSession.getMapper(HouseMapper.class).searchDong(param);
    }

	@Override
	public List<HouseDeal> searchApt(String aptname) throws SQLException {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("aptname", aptname == null ? "" : aptname);
		return sqlSession.getMapper(HouseMapper.class).searchApt(param);
	}

	@Override
	public AreaInfo searchAreaInfo(String gugun, String dong) throws SQLException {
		Map<String, Object> param = new HashMap<String, Object>();
        param.put("gugun", gugun);
        param.put("dong", dong);
        System.out.println(gugun);
        System.out.println(dong);
        return sqlSession.getMapper(HouseMapper.class).searchDongInfo(param);
	}

}
