
var dealAPT = [];
var rentAPT = [];
var dealHouses = [];
var rentHouses = [];

var aadong = { lat: 37.5642135 ,lng: 127.0016985 };



$(function(){
    areaSelectMaker("#sido", "#gugun", "#dong");
});

var areaSelectMaker = function(a1, a2, a3){
    if(a1 == null || a2 == null || a3 == null){
        console.warn("Unknown Area Tag");
        return;
    }

    var area = {
            "서울특별시" :{
                "종로구" : [ "청운동","신교동","궁정동","효자동","창성동","통의동","적선동","통인동","누상동","누하동","옥인동","체부동","필운동","내자동","사직동","도렴동","당주동","내수동","세종로","신문로","청진동","서린동","수송동","중학동","종로","공평동","관훈동","견지동","와룡동","권농동","운니동","익선동","경운동","관철동","인사동","낙원동","팔판동","삼청동","안국동","소격동","화동","사간동","송현동","가회동","재동","계동","원서동","훈정동","묘동","봉익동","돈의동","장사동","관수동","인의동","예지동","원남동","연지동","효제동","이화동","연건동","충신동","동숭동","혜화동","명륜","창신동","숭인동","교남동","평동","송월동","홍파동","교북동","행촌동","구기동","평창동","부암동","홍지동","신영동","무악동" ],
                "중구" : [ "무교동","다동","태평로","을지로","남대문로","삼각동","수하동","장교동","수표동","소공동","남창동","북창동","봉래동","회현동","충무로","명동","남산동","저동","예관동","묵정동","필동","남학동","주자동","예장동","장충동","광희동","쌍림동","주교동","방산동","오장동","입정동","산림동","초동","인현동","신당동","흥인동","무학동","황학동","서소문동","정동","순화동","의주로","충정로","중림동","만리동" ],
                "용산구" : [ "후암동","갈월동","남영동","용산동","동자동","서계동","청파동","원효로","신창동","산천동","청암동","효창동","도원동","용문동","문배동","신계동","한강로","이촌동","이태원동","한남동","동빙고동","서빙고동","주성동","보광동" ],
                "성동구" : [ "상왕십리동","하왕십리동","홍익동","도선동","마장동","사근동","행당동","응봉동","금호동","옥수동","성수동","송정동","용답동" ],
                "광진구" : [ "중곡동","능동","구의동","광장동","자양동","화양동","군자동" ],
                "동대문구" : [ "신설동","용두동","제기동","전농동","답십리동","장안동","청량리동","회기동","휘경동","이문동" ],
                "중랑구" : [ "면목동","상봉동","중화동","묵동","망우동","신내동" ],
                "성북구" : [ "성북동","성북동","돈암동","동소문동","삼선동","동선동","안암동","보문동","정릉동","길음동","종암동","하월곡동","상월곡동","장위동","석관동" ],
                "강북구" : [ "미아동", "번동", "수유동", "우이동" ],
                "도봉구" : [ "쌍문동","방학동","창동","도봉동" ],
                "노원구" : [ "월계동","공릉동","하계동","상계동","중계동" ],
                "은평구" : [ "수색동","녹번동","불광동","갈현동","구산동","대조동","응암동","역촌동","신사동","증산동","진관동" ],
                "서대문구" : [ "합동","미근동","냉천동","천연동","옥천동","영천동","현저동","북아현동","홍제동","대현동","대신동","신촌동","봉원동","창천동","연희동","홍은동","북가좌동","남가좌동" ],
                "마포구" : [ "아현동","공덕동","신공덕동","도화동","용강동","토정동","마포동","대흥동","염리동","노고산동","신수동","현석동","구수동","창전동","상수동","하중동","신정동","당인동","서교동","동교동","합정동","망원동","연남동","성산동","중동","상암동" ],
                "양천구" : [ "신정동","목동","신월동" ],
                "강서구" : [ "염창동","등촌동","화곡동","가양동","마곡동","내발산동","외발산동","공항동","방화동","개화동","과해동","오곡동","오쇠동" ],
                "구로구" : [ "신도림동","구로동","가리봉동","고척동","개봉동","오류동","궁동","온수동","천왕동","항동" ],
                "금천구" : [ "가산동","독산동","시흥동" ],
                "영등포구" : [ "영등포동","영등포동","여의도동","당산동","당산동","도림동","문래동","양평동","양화동","신길동","대림동","양평동" ],
                "동작구" : [ "노량진동","상도동","상도동","본동","흑석동","동작동","사당동","대방동","신대방동" ],
                "관악구" : [ "봉천동","신림동","남현동" ],
                "서초구" : [ "방배동","양재동","우면동","원지동","잠원동","반포동","서초동","내곡동","염곡동","신원동" ],
                "강남구" : [ "역삼동","개포동","청담동","삼성동","대치동","신사동","논현동","압구정동","세곡동","자곡동","율현동","일원동","수서동","도곡동" ],
                "송파구" : [ "잠실동","신천동","풍납동","송파동","석촌동","삼전동","가락동","문정동","장지동","방이동","오금동","거여동","마천동" ],
                "강동구" : [ "명일동","고덕동","상일동","길동","둔촌동","암사동","성내동","천호동","강일동" ]
            }
        };

    // 초기화
    init(true, true);

    // 권역 기본 생성
    var areaKeys1 = Object.keys(area);
    areaKeys1.forEach(function(Region){
        $(a1).append("<option value="+Region+">"+Region+"</option>");
    });

    // 변경 이벤트
    $(document).on("change", a1, function(){
        init(false, true);
        var Region = $(this).val();
        var keys = Object.keys(area[Region]);
        keys.forEach(function(Do){
            $(a2).append("<option value="+Do+">"+Do+"</option>");    
        });
    }).on("change", a2, function(){
        init();
        var Region = $(a1).val();
        var Do = $(this).val();
        var keys = Object.keys(area[Region][Do]);
        keys.forEach(function(SiGunGu){
            $(a3).append("<option value="+area[Region][Do][SiGunGu]+">"+area[Region][Do][SiGunGu]+"</option>");    
        });
    });

    function init(first, second){
        first ? $(a1).empty().append("<option value=''>선택</option>") : "";
        second ? $(a2).empty().append("<option value=''>선택</option>") : "";
        $(a3).empty().append("<option value=''>선택</option>");
    }
}

function getContextPath(){
	var hostIndex = location.href.indexOf(location.host) + location.host.length;
	return location.href.substring(hostIndex, location.href.indexOf('/', hostIndex + 1));
}

function initMap() {
    var seoul = { lat: aadong.lat ,lng: aadong.lng };
    var map = new google.maps.Map($('#map'), {
    	zoom: 15,
    	center: seoul
    });
}


$(document).ready(function() {
	
	$('#dong').change(function() {
		$("#areaform").attr("action", "/house/searchdong?gugun=" +$('#gugun').val()+"&dong="+$('#dong').val());
		$('#areaform').submit();
	})
	
	$('#aptsearch').on('click', function() {
		$("#aptsearchform").attr("action", "/house/searchapt?apt=" +$('#searchaptname').val());
		$('#aptsearchform').submit();
	})

	$('#movehome').click(function() {
		location.href = "/";
	})
	
	$('#expireinfo').on('click', function() {
        alert("탈퇴되었습니다!");
        var id = $("#originalID").val();
        location.href = "/member/delete?userid=" + id;
    })

	$('#findpassword').click(function() {
	        location.href = "/member/find?userid="+$('#findid').val()+"&username="+$('#findname').val()+"&email="+$('#findemail').val();
	    })
})


