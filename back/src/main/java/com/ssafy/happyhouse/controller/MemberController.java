package com.ssafy.happyhouse.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.HouseDeal;
import com.ssafy.happyhouse.model.MemberDto;
import com.ssafy.happyhouse.model.service.MemberService;

@CrossOrigin(origins = { "*" }, maxAge = 6000)
@RestController
@RequestMapping("/api/member")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	private static final String SUCCESS = "success";
	private static final String FAIL = "fail";
	
	@Autowired
	private MemberService memberService;
	
//	@RequestMapping(value = "/login", method = RequestMethod.GET)
//	public String login() {
//		return "member/login";
//	}
	
	@GetMapping("/list")
	public ResponseEntity<List<MemberDto>> list() {
		return new ResponseEntity<List<MemberDto>>(memberService.memberList(), HttpStatus.OK);
	}
	
	@GetMapping("/likelist/{userid}")
	public ResponseEntity<List<HouseDeal>> getLike(@PathVariable String userid) {
		for(HouseDeal h : memberService.getLike(userid))
			System.out.println(h.toString());
		return new ResponseEntity<List<HouseDeal>>(memberService.getLike(userid), HttpStatus.OK);
	}
	
	@PostMapping("/login")
	public ResponseEntity<MemberDto> login(@RequestBody MemberDto memberdto) throws Exception {
		MemberDto member = memberService.login(memberdto);
		System.out.println(memberdto.toString());
		//System.out.println(member.toString());
		if(member == null) {
			return new ResponseEntity<MemberDto>(member, HttpStatus.NO_CONTENT);
		}else {
			System.out.println(member.toString());
			return new ResponseEntity<MemberDto>(member, HttpStatus.OK);
		}
	}
	
	@Transactional
	@PostMapping("/register")
	public ResponseEntity<String> register(@RequestBody MemberDto memberdto) {
		if (memberService.memberRegister(memberdto) > 0) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}
	
	@Transactional
	@PostMapping("/like/{userid}/{dealno}")
	public ResponseEntity<String> like(@PathVariable String userid, @PathVariable String dealno) {
		System.out.println(userid + " "+dealno);
		if (memberService.memberLike(userid, dealno) > 0) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}
	
	@Transactional
	@PutMapping("/update")
	public ResponseEntity<String> modifyOne(@RequestBody MemberDto memberdto) {
		System.out.println(memberdto.toString());
		if (memberService.memberModify(memberdto) > 0) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}
	
	@PutMapping("/update/{userid}")
	public ResponseEntity<String> modify(@RequestBody MemberDto memberdto) {
		logger.debug("adminupdate - 호출");
		if (memberService.memberModify(memberdto) > 0) {
			
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}
	
	@Transactional
	@DeleteMapping("/delete/{id}")
	public ResponseEntity<String> delete(@PathVariable String id) {
		System.out.println(id);
		if (memberService.memberDelete(id) > 0) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}
	
	@RequestMapping(value = "/find", method = RequestMethod.GET)
	public String find(@RequestParam String userid, @RequestParam String username, @RequestParam String email, Model model) {
		Map<String, String> map = new HashMap<>();
		map.put("userid", userid);
		map.put("username", username);
		map.put("email", email);
		String result = memberService.memberFind(map);
		model.addAttribute("msg", result);
		return "error/pw";
	}
	
	@GetMapping("{userid}")
	public ResponseEntity<MemberDto> getMemberInfo(@PathVariable String userid){
		logger.debug("getMemberInfo - 호출");
		return new ResponseEntity<MemberDto>(memberService.memberInfo(userid), HttpStatus.OK);
	}
}


















