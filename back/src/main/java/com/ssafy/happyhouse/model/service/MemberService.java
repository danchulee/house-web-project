package com.ssafy.happyhouse.model.service;

import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.HouseDeal;
import com.ssafy.happyhouse.model.MemberDto;

public interface MemberService {

//	로그인
	public MemberDto login(MemberDto memberDto) throws Exception;

	public int memberRegister(MemberDto memberDto);
	public int memberModify(MemberDto memberDto);
	public int memberDelete(String userid);
	public List<MemberDto> memberList();
	public MemberDto memberInfo(String userid);
	public String memberFind(Map<String, String> map);
	
	public int memberLike(String userid, String dealno);

	public List<HouseDeal> getLike(String userid);

}
