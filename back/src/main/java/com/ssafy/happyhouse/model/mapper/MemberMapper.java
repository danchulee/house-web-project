package com.ssafy.happyhouse.model.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.HouseDeal;
import com.ssafy.happyhouse.model.MemberDto;

public interface MemberMapper {
	
	public MemberDto login(Map<String, String> map) throws SQLException;
	
//	REST
	public List<MemberDto> memberList();
	public MemberDto memberInfo(String id);
	public int memberRegister(MemberDto memberDto);
	public int memberModify(MemberDto memberDto);
	public int memberDelete(String userid);
	public String memberFind(Map<String, String> map);
	
	public int memberLike(Map<String, String> map);
	public List<HouseDeal> getLike(String userid);


}
