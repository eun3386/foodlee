<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
//지도를 삽입할 HTML 요소 또는 HTML 요소의 id를 지정합니다.
// var mapDiv = document.getElementById('map'); // 'map'으로 선언해도 동일
//옵션 없이 지도 객체를 생성하면 서울 시청을 중심으로 하는 16 레벨의 지도가 생성됩니다.
// var map = new naver.maps.Map(mapDiv);

//지도 생성 시에 옵션을 지정할 수 있습니다.

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

// var map = new naver.maps.Map('map_view', {
// 	//
// 	// 신규맵 스타일
// 	useStyleMap: true,
// 	size: new naver.maps.Size(545, 330),
// 	//
// 	center: new naver.maps.LatLng(this, this), //지도의 초기 중심 좌표
//     zoom: 15, //지도의 초기 줌 레벨
//  	minZoom: 7, //지도의 최소 줌 레벨
//     zoomControl: true, //줌 컨트롤의 표시 여부
//     mapTypeId: naver.maps.MapTypeId.NORMAL,
//     zoomControlOptions: { //줌 컨트롤의 옵션
//         position: naver.maps.Position.TOP_RIGHT
//     	},
// 	mapTypeControl: true
// });

// 	function getMapSize() {
// 	var size = new naver.maps.Size($window.width() - 15, $window.height() - 15);
// 	return size;
// 	};
	
// 	$window.on('resize', function() {
// 	map.setSize(getMapSize());
// 	});

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
        	url: '<%=application.getContextPath()%>/resources/imgs/mapMain/marker-blue.png',
//         	size: new naver.maps.Size(25, 33),
//             scaledSize: new naver.maps.Size(25, 33),
            origin: new naver.maps.Point(0, 0),
            anchor: new naver.maps.Point(13, 16),
        },
        animation: naver.maps.Animation.BOUNCE
    });
/////////////////////////////// 써클
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
// truck 위치 마커
// var truckmarkerList = [];

// for (var i=0, ii=latlngs.length; i<ii; i++) {
//     var icon = {
//             url: HOME_PATH +'/img/example/sp_pins_spot_v3.png',
//             size: new naver.maps.Size(24, 37),
//             anchor: new naver.maps.Point(12, 37),
//             origin: new naver.maps.Point(i * 29, 0)
//         },
//         marker = new naver.maps.Marker({
//             position: latlngs[i],
//             map: map,
//             icon: icon
//         });

//     marker.set('seq', i);

//     truckmarkerList.push(marker);

//     marker.addListener('mouseover', onMouseOver);
//     marker.addListener('mouseout', onMouseOut);

//     icon = null;
//     marker = null;
// }

// function onMouseOver(e) {
//     var marker = e.overlay,
//         seq = marker.get('seq');

//     marker.setIcon({
//         url: HOME_PATH +'/img/example/sp_pins_spot_v3_over.png',
//         size: new naver.maps.Size(24, 37),
//         anchor: new naver.maps.Point(12, 37),
//         origin: new naver.maps.Point(seq * 29, 50)
//     });
// }

// function onMouseOut(e) {
//     var marker = e.overlay,
//         seq = marker.get('seq');

//     marker.setIcon({
//         url: HOME_PATH +'/img/example/sp_pins_spot_v3.png',
//         size: new naver.maps.Size(24, 37),
//         anchor: new naver.maps.Point(12, 37),
//         origin: new naver.maps.Point(seq * 29, 0)
//     });
// }
////////////////////////////////
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

// var markerList = [];
var menuLayer = $('<div style="position:absolute;z-index:10000;background-color:#fff;border:solid 1px #333;padding:10px;display:none;"></div>');

map.getPanes().floatPane.appendChild(menuLayer[0]);

// 클리시 마커 표시
naver.maps.Event.addListener(map, 'click', function(e) {
    var marker = new naver.maps.Marker({ // 지도위의 마커 표시
    	icon: {
        	url: '<%=application.getContextPath()%>/resources/imgs/mapMain/marker-blue.png',
//         	size: new naver.maps.Size(25, 33),
            origin: new naver.maps.Point(0, 0),
            anchor: new naver.maps.Point(13, 16)
        },
        position: e.coord,
        map: map
    });
    var coordHtml =
        'Coord: '+ '(우 클릭 지점 위/경도 좌표)' + '<br />' +
        'Point: ' + e.point + '<br />' +
        'Offset: ' + e.offset;

    console.log('Coord: ' + e.coord.toString());
    
//     markerList.push(marker);
    naver.maps.Event.addListener(map, 'click', function(e) {
        marker.setPosition(e.coord);
    });

});

// naver.maps.Event.addListener(map, 'keydown', function(e) {
//     var keyboardEvent = e.keyboardEvent,
//         keyCode = keyboardEvent.keyCode || keyboardEvent.which;

//     var ESC = 27;

//     if (keyCode === ESC) {
//         keyboardEvent.preventDefault();

//         for (var i=0, ii=markerList.length; i<ii; i++) {
//             markerList[i].setMap(null);
//         }

//         markerList = [];

//         menuLayer.hide();
//     }
// });

// naver.maps.Event.addListener(map, 'mousedown', function(e) {
//     menuLayer.hide();
// });

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
            '<h4 style="margin-top:5px;">검색 좌표</h4><br />',
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
            return alert('totalCount' + response.v2.meta.totalCount);
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
		console.log('point: '+point);
        var mapAddress = infoWindow.setContent([
            '<div style="padding:10px;min-width:200px;line-height:100%;">',
            '<h5 style="margin-top:5px;">검색 주소 : '+ address +'</h5><br />',
            htmlAddresses.join('<br />'),
            '</div>'
        ].join('\n'));
        map.setCenter(point);
        infoWindow.open(map, point);
    });
}

function initGeocoder() {
    if (!map.isStyleMapReady) {
        return;
    }

    map.addListener('click', function(e) {
        searchCoordinateToAddress(e.coord);
    });

    $('#address').on('keydown', function(e) {
        var keyCode = e.which;
        if (keyCode === 13) { // Enter Key
            searchAddressToCoordinate($('#address').val());
        }
    });

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
