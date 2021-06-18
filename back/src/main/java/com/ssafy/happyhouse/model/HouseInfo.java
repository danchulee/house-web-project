package com.ssafy.happyhouse.model;

public class HouseInfo {
	/** 아파트를 식별할 번호 */
	private int no;
	/** 법정 동명 */
	private String dongcode; // 수
	/** 아파트 이름 */
	private String AptName;
	/** 법정 동코드 */
	private int code;
	/** 건축 연도 */
	private int buildYear;
	/** 지번 */
	private String jibun;
	/** */
	private String lat;
	private String lng;

	/** 이미지 경로 */
	protected String img;

	public HouseInfo() {
	}

	public HouseInfo(int no) {
		super();
		this.no = no;
	}

	public HouseInfo(String dongcode, String lat, String lng) {
		this.dongcode = dongcode;
		this.lat = lat;
		this.lng = lng;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getDongCode() {
		return dongcode;
	}

	public void setDongCode(String dongcode) {
		this.dongcode = dongcode;
	}

	public String getAptName() {
		return AptName;
	}

	public void setAptName(String aptName) {
		AptName = aptName;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getJibun() {
		return jibun;
	}

	public void setJibun(String jibun) {
		this.jibun = jibun;
	}

	public int getBuildYear() {
		return buildYear;
	}

	public void setBuildYear(int buildYear) {
		this.buildYear = buildYear;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
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

	@Override
	public String toString() {
		return "HouseInfo [no=" + no + ", dong=" + dongcode + ", AptName=" + AptName + ", code=" + code + ", buildYear="
				+ buildYear + ", jibun=" + jibun + ", img=" + img + "]";
	}
}
