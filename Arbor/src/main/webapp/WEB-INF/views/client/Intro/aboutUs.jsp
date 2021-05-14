<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f4b8787091f9dfe7ca2257277aa99c4c"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/client/aboutUs.css" type="text/css" />
<div class="clearfix w1400_container">
<div class="h_imgCenter">
<img src="<%=request.getContextPath() %>/img/aboutUs_sample.jpg"/>
</div>
<div class="h_branchIntro">
<h1>회사 위치 안내</h1>
<div id="map" class="h_map"></div>
<div class="h_branchInfo">
<ul>
<li class = "h_branchEvent1">본사소재지</li>
<li>&nbsp;&nbsp;&nbsp;서울시 마포구 백범로</li>
<li class = "h_branchEvent2">광화문지점</li>
<li>&nbsp;&nbsp;&nbsp;서울시 종로구 세종대로</li>
<li class = "h_branchEvent3">강남지점</li>
<li>&nbsp;&nbsp;&nbsp;서울시 강남구 역삼동</li>
<li class = "h_branchEvent4">영등포지점</li>
<li>&nbsp;&nbsp;&nbsp;서울시 영등포구 여의동</li>
</ul>
<div class="h_branchEvent0"> 전지점 넓게보기 </div>
</div>
</div>

</div>
<script>
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(37.534855, 126.972200), //지도의 중심좌표.
		level: 8 //지도의 레벨(확대, 축소 정도)
	};
	
	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	
	// 마커를 표시할 위치와 title 객체 배열입니다 
	var positions = [
	    {
	        title: '본사 소재지', 
	        latlng: new kakao.maps.LatLng(37.5523825, 126.937743)
	    },
	    {
	        title: '광화문지점', 
	        latlng: new kakao.maps.LatLng(37.572610, 126.976205)
	    },
	    {
	        title: '강남지점', 
	        latlng: new kakao.maps.LatLng(37.498159, 127.029306)
	    },
	    {
	        title: '영등포지점',
	        latlng: new kakao.maps.LatLng(37.517650, 126.905468)
	    }
	];
	
	/* var iwPositions = [{},{},{},{}]
	
	var infowindow = new kakao.maps.InfoWindow({
        position : iwPosition, 
        content : iwContent 
    }); */
	
	for (var i = 0; i < positions.length; i ++) {
	    
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: positions[i].latlng, // 마커를 표시할 위치
	        title : positions[i].title // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	    });
	    
	    
	}
	
	
	$('.h_branchEvent0').on('click', function () {
		 var moveLatLon = new kakao.maps.LatLng(37.534855, 126.972200);
			
		map.setLevel(8);
		
		setTimeout(function () {
			map.panTo(moveLatLon);
		},1000);
		
	});
	
	
	$('.h_branchEvent1').on('click', function () {
		 var moveLatLon = new kakao.maps.LatLng(37.5523825, 126.937743);
			
		if(map.getLevel()==4) {
			map.setLevel(8);
			
			setTimeout(function () {
				map.panTo(moveLatLon);
				
				setTimeout(function () {
					map.setLevel(4);
				},1000);
			},1000);
			
		}
		
		map.panTo(moveLatLon);
		
		setTimeout(function () {
			map.setLevel(4);
		},1000);
		
	});
	
	$('.h_branchEvent2').on('click', function () {
	    var moveLatLon = new kakao.maps.LatLng(37.572610, 126.976205);
		
	    if(map.getLevel()==4) {
			map.setLevel(8);
			
			setTimeout(function () {
				map.panTo(moveLatLon);
				
				setTimeout(function () {
					map.setLevel(4);
				},1000);
			},1000);
			
		}
	    
		map.panTo(moveLatLon);
		
		setTimeout(function () {
			map.setLevel(4);
		},1000);
		
	});
	
	$('.h_branchEvent3').on('click', function () {
	    var moveLatLon = new kakao.maps.LatLng(37.498159, 127.029306);
	    
	    if(map.getLevel()==4) {
			map.setLevel(8);
			
			setTimeout(function () {
				map.panTo(moveLatLon);
				
				setTimeout(function () {
					map.setLevel(4);
				},1000);
			},1000);
			
		}
	    
		map.panTo(moveLatLon);
		
		setTimeout(function () {
			map.setLevel(4);
		},1000);
	    /* if(level = 8){
		    map.panTo(moveLatLon);
			map.setLevel(4);
		}else {
			map.setLevel(8);
			map.panTo(moveLatLon);
			map.setLevel(4);
		} */
		
	});
	
	$('.h_branchEvent4').on('click', function () {
	    var moveLatLon = new kakao.maps.LatLng(37.517650, 126.905468);
	    
	    if(map.getLevel()==4) {
			map.setLevel(8);
			
			setTimeout(function () {
				map.panTo(moveLatLon);
				
				setTimeout(function () {
					map.setLevel(4);
				},1000);
			},1000);
		}
	    
	    map.panTo(moveLatLon);
		
		setTimeout(function () {
			map.setLevel(4);
		},1000);
	    
	   
	});
	// 마커가 지도 위에 표시되도록 설정합니다
	//marker.setMap(map);
	
</script>