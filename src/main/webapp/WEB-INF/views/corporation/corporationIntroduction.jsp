<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html>
<head>

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=21c4ce15b016e2f4c34196b944d9852b&libraries=services,clusterer,drawing"></script>
</head>

<body>
	<div class="container">
		<div class="row">
			<div style="margin-left: 15px;">
				<%@ include file="/WEB-INF/views/corporation/module/top.jsp"%>
				<br>
				<%@ include file="/WEB-INF/views/corporation/module/left.jsp"%>
				<br>


				<div style="position: relative; top: -177px; left: 240px; margin-top: 20px; width: 650px;border: 1px solid #AAAAAA;border-radius: 4px;background-color: #FFFFFF;box-shadow: 0px 2px 5px #aaa;">
					<table style="margin-left: 10px">
						<tr>
							<td colspan="2" ><h4 style="font-weight: 600;padding: 5px;">한눈에 보기</h4></td>
						</tr>
						<tr>
							<td colspan="2"><label  style="padding:5px;margin-bottom: 5px;">${corporationInfo.corp_profile }</label></td>
						</tr>
						<tr>
							<td><label  style="padding:5px;font-weight: 600">웹사이트</label></td>
							<td><label  style="padding:5px;">${corporationInfo.corp_url }</label></td>
						</tr>
						<tr>
							<td><label  style="padding:5px;font-weight: 600">업계</label></td>
							<td><label  style="padding:5px;">${corporationInfo.industry_type }</label></td>
						</tr>
						<tr>
							<td><label  style="padding:5px;font-weight: 600">회사 규모</label></td>
							<td><label  style="padding:5px;">${corporationInfo.corp_size }</label></td>
						</tr>
						<tr>
							<td><label  style="padding:5px;font-weight: 600">본사 주소</label></td>
							<td><label  style="padding:5px;">${corporationInfo.addr1 }</label></td>
						</tr>
						<tr>
							<td><label  style="padding:5px;font-weight: 600">회사 유형</label></td>
							<td><label  style="padding:5px;">${corporationInfo.corp_type }</label></td>
						</tr>
					</table>
				</div>	

				
				<div style="position: relative; top: -177px; left: 240px; margin-top: 20px; width: 650px;border: 1px solid #AAAAAA;border-radius: 4px;background-color: #FFFFFF;box-shadow: 0px 2px 5px #aaa;">
					<table style="margin-left: 10px">
						<tr>
							<td colspan="2"><h4 style="font-weight: 600;padding: 5px; margin-left: 10px;">위치</h4></td>
						</tr>
						<tr>
							<td style="border-top:1px solid #A0A0C8;border-right: 1px solid #A0A0C8;"><label style="padding:5px;">${corporationInfo.addr1 }, ${corporationInfo.addr2 },${corporationInfo.zipcode } </label></td>
							<td><div id="map" style="width: 400px; height: 198px;border-bottom-right-radius: 4px;border-top:1px solid #A0A0C8 "></div></td>
						</tr>
					</table>
				</div>
				
			</div>
		</div>
	</div>

	<script type="text/javascript">
		$(document).ready(function() {
			console.log("${corporationInfo.corp_name}");

		});

		var data = "${corporationInfo.corp_location }";
		var data1 = data.split("/")[0];
		var data2 = data.split("/")[1];

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		mapOption = {
			center : new daum.maps.LatLng(data1, data2), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨  
		};

		var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		// 마커가 표시될 위치입니다 
		var markerPosition = new daum.maps.LatLng(data1, data2);

		// 마커를 생성합니다
		var marker = new daum.maps.Marker({
			position : markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);

		var iwContent = '<div style="padding:5px;">${corpInfo.corp_name } </div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		iwPosition = new daum.maps.LatLng(data1, data2); //인포윈도우 표시 위치입니다

		// 인포윈도우를 생성합니다
		var infowindow = new daum.maps.InfoWindow({
			position : iwPosition,
			content : iwContent
		});

		// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
		infowindow.open(map, marker);
	</script>

</body>

</html>


