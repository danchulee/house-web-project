package com.ssafy.happyhouse.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.HouseDeal;
import com.ssafy.happyhouse.model.MemberDto;
import com.ssafy.happyhouse.model.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public MemberDto login(MemberDto memberDto) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("userid", memberDto.getUserid());
		map.put("userpwd", memberDto.getUserpwd());
		return sqlSession.getMapper(MemberMapper.class).login(map);
	}

	@Override
	public List<MemberDto> memberList(){
		return sqlSession.getMapper(MemberMapper.class).memberList();
	}
	
	@Override
	public List<HouseDeal> getLike(String userid){
		return sqlSession.getMapper(MemberMapper.class).getLike(userid);
	}
	
	@Override
	public MemberDto memberInfo(String userid) {
		return sqlSession.getMapper(MemberMapper.class).memberInfo(userid);
	}
	
	@Override
	public int memberRegister(MemberDto memberDto) {
		return sqlSession.getMapper(MemberMapper.class).memberRegister(memberDto);
	}
	
	@Override
	public int memberLike(String userid, String dealno) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("userid", userid);
		map.put("dealno", dealno);
		return sqlSession.getMapper(MemberMapper.class).memberLike(map);
	}

	@Override
	public int memberModify(MemberDto memberDto) {
		return sqlSession.getMapper(MemberMapper.class).memberModify(memberDto);

	}

	@Override
    public int memberDelete(String userid) {
        return sqlSession.getMapper(MemberMapper.class).memberDelete(userid);
    }

	@Override
	public String memberFind(Map<String, String> map) {
		
		return sqlSession.getMapper(MemberMapper.class).memberFind(map);
	}

}
