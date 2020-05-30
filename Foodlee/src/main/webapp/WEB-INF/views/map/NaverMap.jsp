<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf8" charset="utf8" >
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="search" style="">
            <input id="address" type="text" placeholder="서울 지역 검색">
            <input id="submit" type="button" value="지역 검색">
</div>

<div class="search_map_wrap">
    <div id="map_view"></div>

    <div id="menu_wrap" class="bg_white">
        <div class="option">
            <div>
                <form>
                    트럭 검색 : <input type="text" id="truck_name" size="15" placeholder="상호명 입력..."> 
                  <button id="truck_submit" type="submit">검색하기</button> 
                </form>
            </div>
        </div>
       	<hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
</div>
<script type="text/javascript">

//지도 생성 시에 옵션을 지정할 수 있습니다.
var HOME_PATH = '${pageContext.request.contextPath}/';

var $window = $(window);
//지도 옵션 설정
// 서울 지역 만 표시
var seoul = new naver.maps.LatLngBounds(
    new naver.maps.LatLng(37.413294, 127.269311), // 남동 위도 경도
    new naver.maps.LatLng(37.715133, 126.734086)); // 북서 위동 경도
var mapOptions = {
		center: new naver.maps.LatLng(this, this), //지도의 초기 중심 좌표
	    zoom: 15, //지도의 초기 줌 레벨
	 	minZoom: 14, //지도의 최소 줌 레벨
	    zoomControl: true, //줌 컨트롤의 표시 여부
	    maxBounds: seoul,
	    mapTypeId: naver.maps.MapTypeId.NORMAL,
		mapTypeControl: true,
        mapTypeControlOptions: {
        	// 맵 스타일 
            style: naver.maps.MapTypeControlStyle.BUTTON,
            position: naver.maps.Position.TOP_LEFT
        },
        // 줌 컨트롤러 
        zoomControl: true,
        zoomControlOptions: {
            style: naver.maps.ZoomControlStyle,
            position: naver.maps.Position.TOP_LEFT
        },
        // 줌 표시
        scaleControl: true,
        scaleControlOptions: {
            position: naver.maps.Position.BOTTOM_RIGHT
        },
        // 네이버 로고 
        logoControl: null,
        // 네이버 로고2
        mapDataControl: null
}

//지도를 생성    
var map = new naver.maps.Map('map_view', mapOptions); 

//관성 드래깅 옵션
map.setOptions("disableKineticPan", false); //관성 드래깅 켜기

// 설정한 컨테이너의 사이즈에 맞춤 설정 
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

// 맵에 표시할 포인터 설정
map.setCursor('pointer');
//
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
    console.log('location = ' + location);
    var contentString = [
        '<div style="width:150px;text-align:center;padding:10px;">현재 위치</div>'
    ].join('');

	var infowindow = new naver.maps.InfoWindow({
	    content: contentString,
	    borderColor: "#ffca28",
	    borderWidth: 1
	});
	
	naver.maps.Event.addListener(marker, "click", function(e) {
	    if (infowindow.getMap()) {
	        infowindow.close();
	    } else {
	        infowindow.open(map, marker);
	    }
	});
	
	infowindow.open(map, marker);
// 	circle(location);
}
//써클
// function circle(location) {

//     var circle = new naver.maps.Circle({
//         center: location, // 도형의 중심점 좌표
//         radius: 900, // 도형의 반경
//         fillColor: 'rgb(47, 150, 252)', // 도형 영역을 채울 색상
//         fillOpacity: 0.1, // 불투명도
// //         bounds: map.getBounds(), // 도형의 좌표 경계를 반환합니다.
//         map: map // 도형이 그려질 지도 객체
//     });
//     console.log('Coordinates: ' + location.toString());
// }

// truck 위치 리스트 마커
var markers = [];
var nameList = [];
var infoWindows = [];
var fodKey = [];
var fodName = [];
<c:forEach items="${fodlatlngs}" var="fod" varStatus="status">
	var data = '<c:out value="${fod}"/>';
	var x = data.split(',')[0];
	var y = data.split(',')[1];
	var latlngs = [
	    new naver.maps.LatLng(x,y)
	];
	fodKey[${status.index}] = ${fodList[status.index].sellerId};
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
	
	<c:forEach items="${fodName}" var="fodN" varStatus="status">
	nameList = '<c:out value="${fodN}"/>';
	var contentString = [
		'<div style="width:150px;text-align:center;padding:10px;">'+nameList+'</div>'
    ].join('');
	
	fodName[${status.index}] = ${fodList[status.index].sellerId};
    var infoWindow = new naver.maps.InfoWindow({
        	content: contentString,
    	    borderColor: "#ffca28",
    	    borderWidth: 1
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
// for (var i = 0; i < fodKey.length; i++) {
// 	console.log('fodKey = ' + fodKey[i]);
// }
// for (var i = 0; i < fodName.length; i++) {
// 	console.log('fodName = ' + fodName[i]);
// }
// 보이는 부분만 마커 표시
// 'idle' 지도의 움직임이 종료되면(유휴 상태) 이벤트가 발생합니다.
naver.maps.Event.addListener(map, 'idle', function() {
// naver.maps.Event.addListener(map, 'mousemove', function() {
    updateMarkers(map, markers);
});

function updateMarkers(map, markers) {

	 var mapBounds = map.getBounds();
     var marker, position;
    for (var i = 0; i < markers.length; i++) {

        marker = markers[i]
        position = marker.getPosition();
        if (mapBounds.hasLatLng(position)) {
            showMarker(map, marker);
        } else {
            hideMarker(map, marker);
        }
    }
}
// // 지도상 표시될 마커
function showMarker(map, marker) {
	
    if (marker.getMap()) return;
    marker.setMap(map);
    
	var tsellerId = -1;
	tsellerId = fodKey[markers.indexOf(marker)];
	var tt ='#placesList li#truck_'+tsellerId;
	
	$.ajax({
		type: 'get',
		url: HOME_PATH+'getFd.fdl',
		data: 'sid='+ tsellerId,
		success: function(res, status, xhr) {
			console.log("success : " + res);
			var p = $(res).find("p.truck_list");
   			var r = $(p).text();
   			console.log("success p: " + p);
   			console.log("success r: " + r);
			$('#placesList').append(res);
			$(tt).on('mouseover', function() {
				$(tt).css({"background-color": "rgb(255, 202, 40, 0.7)"});
				var position = marker.getPosition();
				console.log(position);
				map.panTo(position); // 마커 위치로 이동
// 				var marker = position;
				//
				var seq = marker.get('seq');
				marker.setIcon({
			        url: HOME_PATH+'resources/imgs/mapMain/sp_pins_spot_v3_over.png',
			        size: new naver.maps.Size(24, 37),
			        anchor: new naver.maps.Point(12, 37),
			        origin: new naver.maps.Point(seq * 29, 50)
			    });
			});
			$(tt).on('mouseout', function() {
				$(tt).css({"background-color": "rgba(255, 255, 255, 0.7)"});
				
				var seq = marker.get('seq');
				marker.setIcon({
					url: HOME_PATH+'resources/imgs/mapMain/sp_pins_spot_v3.png',
			        size: new naver.maps.Size(24, 37),
			        anchor: new naver.maps.Point(12, 37),
			        origin: new naver.maps.Point(seq * 29, 50)
			    });
			});
		}, 
		error: function(xhr, status) {
			console.log("error : " + status);
		}, 
	});
}
// // 마커 표시 숨김
function hideMarker(map, marker) {
	
    if (!marker.getMap()) return;
    marker.setMap(null);
    
	var tsellerId = -1;
// 	console.log('markers = '+ markers);
	tsellerId = fodKey[markers.indexOf(marker)];
	var tt ='li#truck_'+tsellerId;
	$(tt).remove();
	console.log('tsellerId removed = ' + tsellerId);
	
}
//
//트럭 검색 표시
function searchOneTruckListToCoordinate(keyword) {
		console.log('keyword = ' + keyword);	
		var empty = '';
		if( keyword != null && keyword != empty) {
			var name = encodeURIComponent(keyword);
		   	$.ajax({
		   		type: 'post',
		   		url: HOME_PATH+'getFdName.fdl',
		   		data: 'fne='+ name,
		   		success: function(res, status, xhr) {
		   			var p = $(res).find("p.truck_list");
		   			var r = $(p).text();
		   			var li = $(p).parent().attr("id");
		   			var tt = '#'+li;
		   			console.log("success li: " + li);
		   			console.log("success p: " + p);
		   			console.log("success r: " + r);
		   			switch (r) {
					case keyword:
						$('#placesList').html(res);
							var selId = -1;
							selId = tt.split('_')[1];
							console.log('selId = ' + selId);
							var marker = markers[selId-1];
							console.log('marker = ' + marker);
						$(tt).on('mouseover', function() {
							$(tt).css({"background-color": "rgb(255, 202, 40, 0.7)"});
							var position = marker.getPosition();
							console.log(position);
							map.panTo(position); // 마커 위치로 이동
//			 				var marker = position;
							//
							var seq = marker.get('seq');
							marker.setIcon({
						        url: HOME_PATH+'resources/imgs/mapMain/sp_pins_spot_v3_over.png',
						        size: new naver.maps.Size(24, 37),
						        anchor: new naver.maps.Point(12, 37),
						        origin: new naver.maps.Point(seq * 29, 50)
						    });
						});
						$(tt).on('mouseout', function() {
							$(tt).css({"background-color": "rgba(255, 255, 255, 0.7)"});
							
							var seq = marker.get('seq');
							marker.setIcon({
								url: HOME_PATH+'resources/imgs/mapMain/sp_pins_spot_v3.png',
						        size: new naver.maps.Size(24, 37),
						        anchor: new naver.maps.Point(12, 37),
						        origin: new naver.maps.Point(seq * 29, 50)
						    });
						});
						$(tt).on('click', function() {
							console.log('selId = ' + selId);
							var key = parseInt(selId);
							console.log('key = ' + typeof key);
							showOneTruck(key);
						});
						break;
					default:
						alert('검색결과가 없습니다');
						break;
					}
		   			
		   		}, 
		   		error: function(xhr, status) {
		   			console.log("error : " + status);                                                 
		   		}, 
		   	});
		} else {
			alert('상호명을 입력해주세요');
		}
}
//트럭 상세정보
function showOneTruck(foodId) {
	$.ajax({
		type: 'get',
		url: HOME_PATH+'showOneTruck.fdl',
		data: 'fsTruck='+ foodId,
		success: function(res, status, xhr) {
			$('#truck_show_view').append(res);
		},
		error: function(xhr, statis) {
			console.log("error : " + status);         
		}
	});
}
// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
 var paginationEl = document.getElementById('pagination'),
     fragment = document.createDocumentFragment(),
     i; 

 // 기존에 추가된 페이지번호를 삭제합니다
 while (paginationEl.hasChildNodes()) {
     paginationEl.removeChild (paginationEl.lastChild);
 }

 for (i=1; i<=pagination.last; i++) {
     var el = document.createElement('a');
     el.href = "#";
     el.innerHTML = i;

     if (i===pagination.current) {
         el.className = 'on';
     } else {
         el.onclick = (function(i) {
             return function() {
                 pagination.gotoPage(i);
             }
         })(i);
     }

     fragment.appendChild(el);
 }
 paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
 var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

 infowindow.setContent(content);
 infowindow.open(map, marker);
}

// 해당 마커의 인덱스를 seq라는 클로저 변수로 저장하는 이벤트 핸들러를 반환합니다.
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
// 해당 마커 클릭 이벤트
 for (var i=0, ii=markers.length; i<ii; i++) {
    naver.maps.Event.addListener(markers[i], 'click', getClickHandler(i));
}

// // MouseOver
function onMouseOver(e) {
    var marker = e.overlay,
        seq = marker.get('seq');
    
    var tsellerId = -1;
	tsellerId = fodKey[markers.indexOf(marker)];
	var tt ='#placesList li#truck_'+tsellerId;
    console.log('tt=' + tt);
    marker.setIcon({
        url: HOME_PATH+'resources/imgs/mapMain/sp_pins_spot_v3_over.png',
        size: new naver.maps.Size(24, 37),
        anchor: new naver.maps.Point(12, 37),
        origin: new naver.maps.Point(seq * 29, 50)
    });
    $(tt).css({"background-color": "rgb(255, 202, 40, 0.7)"});
}
// // MouseOut
function onMouseOut(e) {
    var marker = e.overlay,
        seq = marker.get('seq');
    
    var tsellerId = -1;
	tsellerId = fodKey[markers.indexOf(marker)];
	var tt ='#placesList li#truck_'+tsellerId;
	
    marker.setIcon({
        url: HOME_PATH+'resources/imgs/mapMain/sp_pins_spot_v3.png',
        size: new naver.maps.Size(24, 37),
        anchor: new naver.maps.Point(12, 37),
        origin: new naver.maps.Point(seq * 29, 0)
    });
    $(tt).css({"background-color": "rgba(255, 255, 255, 0.7)"});
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
//해당 마커의 인덱스를 seq라는 클로저 변수로 저장하는 이벤트 핸들러를 반환합니다.
function OneClickHandler(seq) {
    return function(e) {
    	var marker = new naver.maps.Marker({
    	    position: seq.cooder,
    	    map: map
    	});
        var marker = markers[seq],
            infoWindow = infoWindows[seq];

        if (infoWindow.getMap()) {
            infoWindow.close();
        } else {
            infoWindow.open(map, marker);
        }
    }
}
//
// 좌표 검색  및 주소 표시
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
            return alert('잘못된 입력입니다!');
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
            '<div class="info" style="padding:10px;min-width:200px;line-height:100%;">',
            '<h4 style="margin-top:5px;">검색 좌표</h4>',
            htmlAddresses.join('<br />'),
            '</div>'
        ].join('\n'));
        
        infoWindow.open(map, latlng);
        $('.info').on('click', function() {
       		infoWindow.close();
		})
        
    });
}
//
// 주소 검색 표시
function searchAddressToCoordinate(address) {
    naver.maps.Service.geocode({
        query: address
    }, function(status, response) {
        if (status === naver.maps.Service.Status.ERROR) {
            return alert('잘못된 입력입니다!');
        }

        if (response.v2.meta.totalCount === 0) {
            return alert('검색어를 찾을수 없습니다');
        }

        var htmlAddresses = [],
            item = response.v2.addresses[0],
            position = new naver.maps.Point(item.x, item.y);
        
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
            '<div class="info" style="padding:10px;min-width:200px;line-height:150%;">',
            '<h4 style="margin-top:5px;">검색 주소 : '+ address +'</h4>',
            htmlAddresses.join('<br />'),
            '</div>'
        ].join('\n'));
        
        infoWindow.open(map, position);
        
        $('.info').on('click', function() {
       		infoWindow.close();
		})
        //
        map.setCenter(position);
		console.log('position: '+position);
    });
    
}
//
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
        if (keyCode == 13) { // Enter Key
            searchAddressToCoordinate($('#address').val());
        }
    });
	// 검색창 마우스 이벤트
    $('#submit').on('click', function(e) {
        e.preventDefault();
        searchAddressToCoordinate($('#address').val());
    });
	// 트럭 검색창 마우스 이벤트
    $('#truck_submit').on('click', function(e) {
        e.preventDefault();
        searchOneTruckListToCoordinate($('#truck_name').val());
    });
	
}
// 주소 등록
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
// naver.maps.onJSContentLoaded = initGeocoder;
naver.maps.Event.once(map, 'init_stylemap', initGeocoder);
//
</script>
