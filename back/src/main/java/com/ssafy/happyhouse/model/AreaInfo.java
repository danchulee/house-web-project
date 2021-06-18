package com.ssafy.happyhouse.model;

public class AreaInfo {
	String dongcode;
	String lat;
	String lng;
	
	public AreaInfo() {}
	public AreaInfo(String dongcode, String lat, String lng) {
		super();
		this.dongcode = dongcode;
		this.lat = lat;
		this.lng = lng;
	}
	
	public String getDongcode() {
		return dongcode;
	}
	public void setDongcode(String dongcode) {
		this.dongcode = dongcode;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getLng() {
		return lng;
	}
	public void setLng(String lng) {
		this.lng = lng;
	}
	
	
	
}
