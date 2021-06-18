package com.ssafy.happyhouse.controller;

import java.sql.SQLException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.AreaInfo;
import com.ssafy.happyhouse.model.HouseDeal;
import com.ssafy.happyhouse.model.service.HouseService;

@CrossOrigin(origins = { "*" }, maxAge = 6000)
@RestController
@RequestMapping("/api/house")
public class HouseController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	private static final String SUCCESS = "success";
	private static final String FAIL = "fail";
	
	@Autowired
	private HouseService houseService;
	
	@GetMapping("/")
	public ResponseEntity<List<HouseDeal>> searchAll() throws SQLException {
		logger.debug("searchAll - 호출");
		return new ResponseEntity<List<HouseDeal>>(houseService.searchAll(), HttpStatus.OK);
	}
	
	@GetMapping("/searchdong/{gugun}/{dong}")
	public ResponseEntity<List<HouseDeal>> searchDong(@PathVariable String gugun, @PathVariable String dong) throws SQLException {
		logger.debug("searchDong - 호출");
		return new ResponseEntity<List<HouseDeal>>(houseService.searchDong(gugun, dong), HttpStatus.OK);
	}
	
	@GetMapping("/searchapt/{apt}")
	public ResponseEntity<List<HouseDeal>> searchApt(@PathVariable String apt) throws SQLException {
		logger.debug("searchApt - 호출");
		return new ResponseEntity<List<HouseDeal>>(houseService.searchApt(apt), HttpStatus.OK);
	}
	@GetMapping("/searcharea/{gugun}/{dong}")
	public ResponseEntity<AreaInfo> searchAreaInfo(@PathVariable String gugun, @PathVariable String dong) throws SQLException {
		logger.debug("searchArea - 호출");
		return new ResponseEntity<AreaInfo>(houseService.searchAreaInfo(gugun, dong), HttpStatus.OK);
	}
	
}
