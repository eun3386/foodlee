<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">

//지도 생성 시에 옵션을 지정할 수 있습니다.
var HOME_PATH = '${pageContext.request.contextPath}/';

var $window = $(window);

var mapOptions = {
		center: new naver.maps.LatLng(this, this), //지도의 초기 중심 좌표
	    zoom: 15, //지도의 초기 줌 레벨
	 	minZoom: 7, //지도의 최소 줌 레벨
	    zoomControl: true, //줌 컨트롤의 표시 여부
	    mapTypeId: naver.maps.MapTypeId.NORMAL,
	    zoomControlOptions: { //줌 컨트롤의 옵션
	        position: naver.maps.Position.TOP_RIGHT
	    	},
		mapTypeControl: true
}
var map = new naver.maps.Map('map_view', mapOptions); 

var $window = $('map');

function getMapSize() {
	var size = new naver.maps.Size($window.width() - 1, $window.height() - 1);
	return size;
};

$window.on('map', function() {
	map.setSize(getMapSize());
});

var infoWindow = new naver.maps.InfoWindow({
    anchorSkew: true
});
map.setCursor('pointer');
var mylocation;
function onSuccessGeolocation(position) {
    var location = new naver.maps.LatLng(position.coords.latitude,
                                         position.coords.longitude);
    mylocation = location;
    map.setCenter(location); // 얻은 좌표를 지도의 중심으로 설정합니다.
    map.setZoom(15); // 지도의 줌 레벨을 변경합니다.
    var marker = new naver.maps.Marker({ // 지도위의 마커 표시
        position: location,
		map: map,
        icon: {
        	url: HOME_PATH+'resources/imgs/mapMain/marker-blue.png',
        	size: new naver.maps.Size(25, 33),
            scaledSize: new naver.maps.Size(25, 33),
            origin: new naver.maps.Point(0, 0),
            anchor: new naver.maps.Point(13, 16),
        },
        animation: naver.maps.Animation.BOUNCE
    });
// 써클
    var GREEN_FACTORY = location;

    var circle = new naver.maps.Circle({
        map: map,
        center: GREEN_FACTORY,
        radius: 500,
        fillColor: 'rgb(47, 150, 252)',
        fillOpacity: 0.1
    });
    console.log('Coordinates: ' + location.toString());
}
// truck 위치 리스트 마커
var fodList = '${fodList}';
var markers = [];
var infoWindows = [];
<c:forEach items="${fodList}" var="fod">
	var data = '<c:out value="${fod}"/>';
	var x = data.split(',')[0];
	var y = data.split(',')[1];
	var latlngs = [
	    new naver.maps.LatLng(x,y)
	];
// 	console.log('latlngs = ' + x + ',' + y);
//
for (var i=0, ii=latlngs.length; i<ii; i++) {
	var marker = new naver.maps.Marker({
        map: map,
        position: latlngs[i],
        icon: {
        	url: HOME_PATH+'resources/imgs/mapMain/sp_pins_spot_v3.png',
            size: new naver.maps.Size(24, 37),
            anchor: new naver.maps.Point(12, 37),
            origin: new naver.maps.Point(i*29, 0)
        },
        zIndex: 100
    });
 	marker.set('seq', i);

	<c:forEach items="${fodName}" var="fodN">
	var contentString = [
		'<div style="width:150px;text-align:center;padding:10px;"><c:out value="${fodN}"/></div>'
    ].join('');
	
    var infoWindow = new naver.maps.InfoWindow({
        	content: contentString
    });
    infoWindows.push(infoWindow);
    </c:forEach>
};
	marker.addListener('mouseover', onMouseOver);
	marker.addListener('mouseout', onMouseOut);
	
	markers.push(marker);
// 	icon = null;
// 	marker = null;
</c:forEach>

//해당 마커의 인덱스를 seq라는 클로저 변수로 저장하는 이벤트 핸들러를 반환합니다.
function getClickHandler(seq) {
    return function(e) {
        var marker = markers[seq],
            infoWindow = infoWindows[seq];

        if (infoWindow.getMap()) {
            infoWindow.close();
        } else {
            infoWindow.open(map, marker);
        }
    }
}

for (var i=0, ii=markers.length; i<ii; i++) {
    naver.maps.Event.addListener(markers[i], 'click', getClickHandler(i));
}

// MouseOver
function onMouseOver(e) {
    var marker = e.overlay,
        seq = marker.get('seq');

    marker.setIcon({
        url: HOME_PATH+'resources/imgs/mapMain/sp_pins_spot_v3_over.png',
        size: new naver.maps.Size(24, 37),
        anchor: new naver.maps.Point(12, 37),
        origin: new naver.maps.Point(seq * 29, 50)
    });
}
// MouseOut
function onMouseOut(e) {
    var marker = e.overlay,
        seq = marker.get('seq');

    marker.setIcon({
        url: HOME_PATH+'resources/imgs/mapMain/sp_pins_spot_v3.png',
        size: new naver.maps.Size(24, 37),
        anchor: new naver.maps.Point(12, 37),
        origin: new naver.maps.Point(seq * 29, 0)
    });
}
//
function onErrorGeolocation() {
    var center = map.getCenter();

    infowindow.setContent('<div style="padding:20px;">' +
        '<h5 style="margin-bottom:5px;color:#f00;">Geolocation failed!</h5>'+ "latitude: "+ center.lat() +"<br />longitude: "+ center.lng() +'</div>');

    infowindow.open(map, center);
}
// $(window).on("load", function() {
    if (navigator.geolocation) {
        /**
         * navigator.geolocation 은 Chrome 50 버젼 이후로 HTTP 환경에서 사용이 Deprecate 되어 HTTPS 환경에서만 사용 가능 합니다.
         * http://localhost 에서는 사용이 가능하며, 테스트 목적으로, Chrome 의 바로가기를 만들어서 아래와 같이 설정하면 접속은 가능합니다.
         * chrome.exe --unsafely-treat-insecure-origin-as-secure="http://example.com"
         */
        navigator.geolocation.getCurrentPosition(onSuccessGeolocation, onErrorGeolocation);
    } else {
        var center = map.getCenter();
        infowindow.setContent('<div style="padding:20px;"><h5 style="margin-bottom:5px;color:#f00;">Geolocation not supported</h5></div>');
        infowindow.open(map, center);
    }
// });

map.setOptions("mapTypeControl", true); //지도 유형 컨트롤의 표시 여부

naver.maps.Event.addListener(map, 'zoom_changed', function (zoom) {
    console.log('zoom:' + zoom);
});

// 사용자 정의 컨트롤
var locationBtnHtml = '<a href="#cont_left" class="btn_mylct"><span class="spr_trff spr_ico_mylct"></span></a>';

naver.maps.Event.once(map, 'init_stylemap', function() {
    //customControl 객체 이용하기
    var customControl = new naver.maps.CustomControl(locationBtnHtml, {
        position: naver.maps.Position.TOP_LEFT,
    });

    customControl.setMap(map);

    var domEventListener = naver.maps.Event.addDOMListener(customControl.getElement(), 'click', function() {
    	console.log("mylocation = "+mylocation);
		map.setZoom(15);
	 	map.setCenter(mylocation);
    });
});
//// 검색  및 주소창 
function searchCoordinateToAddress(latlng) {

    infoWindow.close();

    naver.maps.Service.reverseGeocode({
        coords: latlng,
        orders: [
            naver.maps.Service.OrderType.ADDR,
            naver.maps.Service.OrderType.ROAD_ADDR
        ].join(',')
    }, function(status, response) {
        if (status === naver.maps.Service.Status.ERROR) {
            return alert('Something Wrong!');
        }

        var items = response.v2.results,
            address = '',
            htmlAddresses = [];

        for (var i=0, ii=items.length, item, addrType; i<ii; i++) {
            item = items[i];
            address = makeAddress(item) || '';
            addrType = item.name === 'roadaddr' ? '[도로명 주소]' : '[지번 주소]';

            htmlAddresses.push((i+1) +'. '+ addrType +' '+ address);
        }
        
        var mapPath = infoWindow.setContent([
            '<div style="padding:10px;min-width:200px;line-height:100%;">',
            '<h4 style="margin-top:5px;">검색 좌표</h4>',
            htmlAddresses.join('<br />'),
            '</div>'
        ].join('\n'));
        infoWindow.open(map, latlng);
    });
}
function searchAddressToCoordinate(address) {
    naver.maps.Service.geocode({
        query: address
    }, function(status, response) {
        if (status === naver.maps.Service.Status.ERROR) {
            return alert('Something Wrong!');
        }

        if (response.v2.meta.totalCount === 0) {
            return alert('검색어를 찾을수 없습니다');
        }

        var htmlAddresses = [],
            item = response.v2.addresses[0],
            point = new naver.maps.Point(item.x, item.y);
        
        if (item.roadAddress) {
            htmlAddresses.push('[도로명 주소] ' + item.roadAddress);
        }

        if (item.jibunAddress) {
            htmlAddresses.push('[지번 주소] ' + item.jibunAddress);
        }

        if (item.englishAddress) {
            htmlAddresses.push('[영문명 주소] ' + item.englishAddress);
        }
        var mapAddress = infoWindow.setContent([
            '<div style="padding:10px;min-width:200px;line-height:150%;">',
            '<h4 style="margin-top:5px;">검색 주소 : '+ address +'</h4>',
            htmlAddresses.join('<br />'),
            '</div>'
        ].join('\n'));
        infoWindow.open(map, point);
        map.setCenter(point);
		console.log('point: '+point);
    });
    
}
function initGeocoder() {
    if (!map.isStyleMapReady) {
        return;
    }
	// 마우스버튼 클릭
    map.addListener('click', function(e) {
        searchCoordinateToAddress(e.coord);
        console.log('position'+e.coord);
    });
	// 검색 창  키 이벤트
    $('#address').on('keydown', function(e) {
        var keyCode = e.which;
        if (keyCode === 13) { // Enter Key
            searchAddressToCoordinate($('#address').val());
        }
    });
	// 검색창 마우스 이벤트
    $('#submit').on('click', function(e) {
        e.preventDefault();
        searchAddressToCoordinate($('#address').val());
    });
}

function makeAddress(item) {
    if (!item) {
        return;
    }

    var name = item.name,
        region = item.region,
        land = item.land,
        isRoadAddress = name === 'roadaddr';

    var sido = '', sigugun = '', dongmyun = '', ri = '', rest = '';

    if (hasArea(region.area1)) {
        sido = region.area1.name;
    }

    if (hasArea(region.area2)) {
        sigugun = region.area2.name;
    }

    if (hasArea(region.area3)) {
        dongmyun = region.area3.name;
    }

    if (hasArea(region.area4)) {
        ri = region.area4.name;
    }

    if (land) {
        if (hasData(land.number1)) {
            if (hasData(land.type) && land.type === '2') {
                rest += '산';
            }

            rest += land.number1;

            if (hasData(land.number2)) {
                rest += ('-' + land.number2);
            }
        }

        if (isRoadAddress === true) {
            if (checkLastString(dongmyun, '면')) {
                ri = land.name;
            } else {
                dongmyun = land.name;
                ri = '';
            }

            if (hasAddition(land.addition0)) {
                rest += ' ' + land.addition0.value;
            }
        }
    }

    return [sido, sigugun, dongmyun, ri, rest].join(' ');
}

function hasArea(area) {
    return !!(area && area.name && area.name !== '');
}

function hasData(data) {
    return !!(data && data !== '');
}

function checkLastString (word, lastString) {
    return new RegExp(lastString + '$').test(word);
}

function hasAddition (addition) {
    return !!(addition && addition.value);
}

naver.maps.onJSContentLoaded = initGeocoder;
naver.maps.Event.once(map, 'init_stylemap', initGeocoder);
</script>
<div class="search" style="">
            <input id="address" type="text" placeholder="검색할 주소">
            <input id="submit" type="button" value="주소 검색">
</div>
