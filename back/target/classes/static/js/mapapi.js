$(document).ready(function() {
		
		var cafeArea = {
				"서울" : ["역삼점", "선릉점"],
				"대전" : ["학하점", "봉명점"],
				"구미" : ["연수원점", "구미사업장"],
				"광주" : ["하남산단점", "광주역점"]
		};
		
		var officePosition = {
				"역삼점" : 	{ "lat" : 37.500613, "lng" : 127.036431},	
				"선릉점" : 	{ "lat" : 37.504268, "lng" : 127.048188},	
				"학하점" : 	{ "lat" : 36.355360, "lng" : 127.298294},	
				"봉명점" : 	{ "lat" : 36.358843, "lng" : 127.344192},	
				"연수원점" : 	{ "lat" : 36.098594, "lng" : 128.389770},	
				"구미사업장" : 	{ "lat" : 36.109553, "lng" : 128.415011},	
				"하남산단점" : 	{ "lat" : 35.204279, "lng" : 126.807198},	
				"광주역점" : 	{ "lat" : 35.165476, "lng" : 126.909216}
		};
		
		var officeAddress = {
				"역삼점" : 	"서울특별시+강남구+역삼동+테헤란로+212",	
				"선릉점" : 	"서울특별시 강남구 역삼동 테헤란로 334 LG 화재빌딩",	
				"학하점" : 	"대전광역시 유성구 덕명동 124",	
				"봉명점" : 	"대전광역시 유성구 봉명동 대학로 60 봉명가든 6층",	
				"연수원점" : 	"경상북도 구미시 공단동 259",	
				"구미사업장" : 	"경상북도 구미시 임수동 94",	
				"하남산단점" : 	"107 하남산단6번로 광산구 광주광역시",	
				"광주역점" : 	"광주광역시 북구 중흥동 611"
		};
		
		$(".dropdown-item.cafe_area").click(function() {
			var selArea = $(this).text();
			$("#areaBtn").text(selArea);
			var offices = cafeArea[selArea];
			$("#office_div").empty();
			$.each(offices, function(i, office) {
				$("#office_div").append('<label class="dropdown-item cafe_office">' + office + '</label>');
			});
		});
		
		
		
		//officePosition의 lat, lng를 이용한 marker
		$(document).on("click", ".dropdown-item.cafe_office", function() {
			var selOffice = $(this).text();
			$("#officeBtn").text(selOffice);
			var office = officePosition[selOffice];
			deleteMarkers();
			var officemarker = {
					coords: {lat: office.lat, lng: office.lng},
					iconImage: null,
					content: selOffice
			};
			addMarker(officemarker);
		});
		
		/*
		//officeAddress의 주소를 이용하여 geocoding으로 lat, lng 얻어온 후 marker
		$(document).on("click", ".dropdown-item.cafe_office", function() {
			var selOffice = $(this).text();
			$("#officeBtn").text(selOffice);
			var officeAddr = officeAddress[selOffice];
			
			$.get("https://maps.googleapis.com/maps/api/geocode/json"
					, {	
						key: '발급받은 key 입력', address: officeAddr 
					} , function(data, status) {
						deleteMarkers();
						var officemarker = {
								coords: { lat: data.results[0].geometry.location.lat, lng: data.results[0].geometry.location.lng },
								iconImage: null,
								content: selOffice
						};
						console.log(officemarker);
						addMarker(officemarker);
					}
					, "json"
			);//get
		});
		*/
	});


var multi = {lat: 37.5012743, lng: 127.039585};
var map;
var markers = [];
var infoWindow;

function initMap() {
	map = new google.maps.Map(document.getElementById('map'), {
		center: multi, zoom: 15
	});
	
	infoWindow = new google.maps.InfoWindow;
	
	const myposition = "img/my_position.png";
	
	
	//멀티캠퍼스
	//const multimarker = new google.maps.Marker({coords: multi, content: '멀티캠퍼스', iconImage: myposition});
	
	var multimarker = {
			coords: multi,
			iconImage: myposition,
			content: '멀티캠퍼스(역삼)'
	};
	addMarker(multimarker);
	infoWindow.setPosition(multi);
	infoWindow.setContent('멀티캠퍼스.');
	infoWindow.open(map);
	
	/*
	// Geolocation
	infoWindow = new google.maps.InfoWindow;
	if (navigator.geolocation) {
		navigator.geolocation.getCurrentPosition(function(position) {
			var pos = {
				lat: position.coords.latitude,
				lng: position.coords.longitude
			};
			
			var mymarker = {
					coords: pos,
					iconImage: myposition,
					content: '현재위치'
			};
			addMarker(mymarker);
			
			infoWindow.setPosition(pos);
			infoWindow.setContent('현재 나의 위치.');
			infoWindow.open(map);
			map.setCenter(pos);
		}, function() {
			handleLocationError(true, infoWindow, map.getCenter());
		});
	} else {
		handleLocationError(false, infoWindow, map.getCenter());
	}
	*/
}


function handleLocationError(browserHasGeolocation, infoWindow, pos) {
	infoWindow.setPosition(pos);
	infoWindow.setContent(browserHasGeolocation ?
		'Error: Geolocation 서비스 실패.' :
		'Error: Geolocation을 지원하지 않는 브라우저.');
	infoWindow.open(map);
}

function addMarker(props) {
	const marker = new google.maps.Marker({
		position: new google.maps.LatLng(parseFloat(props.coords.lat),parseFloat(props.coords.lng)),
		map: map
	});
	map.setCenter(marker.getPosition());
	map.setZoom(15);
	
	if(props.iconImage){
		marker.setIcon(props.iconImage);
	}

	if(props.content){
		infoWindow = new google.maps.InfoWindow({
			content:props.content
		});

	}
	
	marker.addListener('click', function() {
		map.setZoom(17);
		map.setCenter(marker.getPosition());
		bounceMarker(marker);
	});
	markers.push(marker);
	setMapOnAll(map);
}

function bounceMarker(marker) {
	if (marker.getAnimation() !== null) {
		marker.setAnimation(null);
	} else {
		marker.setAnimation(google.maps.Animation.BOUNCE);
	}
}

function deleteMarkers() {
	clearMarkers();
	markers = [];
}

function clearMarkers() {
	setMapOnAll(null);
}

function setMapOnAll(map) {
	for (let i = 0; i < markers.length; i++) {
		markers[i].setMap(map);
	}
}