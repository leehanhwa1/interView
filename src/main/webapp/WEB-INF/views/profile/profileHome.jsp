<%@ page import="java.sql.Timestamp"%>
<%@ page import="java.sql.Time"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"/>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<link href="/css/profile/profileHome.css" rel="stylesheet"> 
<script type="text/javascript">
$(document).ready(function() {
	$(".followHashtag").hide();
	$(".ability").hide();
	$(".skils").hide();
	$(".thesis").hide();
	$(".patent").hide();
	$(".project").hide();
	$(".award").hide();
	$(".language").hide();
	
	$(".modalA").on("click",function(){
		var modalStr = $(this).attr("title");
		var code = $(this).attr("role");
		
		console.log(code);
		$.ajax({
			type : "POST",
	    		url : "/modalUpdateView",
	    		dataType : "HTML",
	    		data : {"modalStr" :  modalStr, "code" : code },
			success : function(result) {
				$(".modal-content").empty();
				$(".modal-content").html(result);
			}
		}); 
	});
	
	$(".telInfoA").on("click",function(){
		var user_id = $(this).attr("title");
		
		$.ajax({
			type : "POST",
	    		url : "/telInfo",
	    		dataType : "HTML",
	    		data : {"user_id" : user_id },
			success : function(result) {
				$(".modal-content").empty();
				$(".modal-content").html(result);
			}
		}); 
	});
	
	$(".contentsBtn").on("click",function(e){
		if($(e.target).parents(".contentsDiv").children(".contents").hasClass("contents")){
			$(e.target).parents(".contentsDiv").children(".contentsBtn").empty();
			$(e.target).parents(".contentsDiv").children(".contentsBtn").append('덜 보기 ');
			$(e.target).parents(".contentsDiv").children(".contents").attr('class', 'contentsOn');
		}else{
			$(e.target).parents(".contentsDiv").children(".contentsBtn").empty();
			$(e.target).parents(".contentsDiv").children(".contentsBtn").append('더 보기');
			$(e.target).parents(".contentsDiv").children(".contentsOn").attr('class', 'contents');
		}		
	});
	
	$(".userContentsShow").on("click",function(e){
		if ($(e.target).closest(".userContentsSkip").hasClass('userContentsSkip')) {
			$(".userContentsShow").empty();
			$(".userContentsShow").append('덜 보기 <i class="fas fa-angle-up"></i>');
			$(".userContentsSkip").attr('class', 'userContentsSkipOn');
			
		}else {
			$(".userContentsShow").empty();
			$(".userContentsShow").append('더 보기 <i class="fas fa-angle-down"></i>');
			$(".userContentsSkipOn").attr('class', 'userContentsSkip');
		}
	});
	
	$(".hashtagFollowVoShow").on("click",function(e){
		if ($(e.target).closest(".hashtagFollowVoShowSkip").hasClass('hashtagFollowVoShowSkip')) {
			$(".hashtagFollowVoShow").empty();
			$(".hashtagFollowVoShow").append('덜 보기 <i class="fas fa-angle-up"></i>');
			$(".hashtagFollowVoShowSkip").attr('class', 'hashtagFollowVoShowSkipOn');
			$(".followHashtag").show();
			
		}else {
			$(".hashtagFollowVoShow").empty();
			$(".hashtagFollowVoShow").append('더 보기 <i class="fas fa-angle-down"></i>');
			$(".hashtagFollowVoShowSkipOn").attr('class', 'hashtagFollowVoShowSkip');
			$(".followHashtag").hide();
		}
	});
	
	$(".abilityVoShow").on("click",function(e){
		if ($(e.target).closest(".abilityVoShowSkip").hasClass('abilityVoShowSkip')) {
			$(".abilityVoShow").empty();
			$(".abilityVoShow").append('덜 보기 <i class="fas fa-angle-up"></i>');
			$(".abilityVoShowSkip").attr('class', 'abilityVoShowSkipOn');
			$(".ability").show();
			
		}else {
			$(".abilityVoShow").empty();
			$(".abilityVoShow").append('더 보기 <i class="fas fa-angle-down"></i>');
			$(".abilityVoShowSkipOn").attr('class', 'abilityVoShowSkip');
			$(".ability").hide();
		}
	});
	
	$(".possesion_skillsVoShow").on("click",function(e){
		if ($(e.target).closest(".possesion_skillsVoShowSkip").hasClass('possesion_skillsVoShowSkip')) {
			$(".possesion_skillsVoShow").empty();
			$(".possesion_skillsVoShow").append('<i class="fas fa-angle-up"></i>');
			$(".possesion_skillsVoShowSkip").attr('class', 'possesion_skillsVoShowSkipOn');
			$(".skils").show();
			
		}else {
			$(".possesion_skillsVoShow").empty();
			$(".possesion_skillsVoShow").append('<i class="fas fa-angle-down"></i>');
			$(".possesion_skillsVoShowSkipOn").attr('class', 'possesion_skillsVoShowSkip');
			$(".skils").hide();
		}
	});
	
	$(".thesis_listVoShow").on("click",function(e){
		if ($(e.target).closest(".thesis_listVoShowSkip").hasClass('thesis_listVoShowSkip')) {
			$(".thesis_listVoShow").empty();
			$(".thesis_listVoShow").append('<i class="fas fa-angle-up"></i>');
			$(".thesis_listVoShowSkip").attr('class', 'thesis_listVoShowSkipOn');
			$(".thesis").show();
			
		}else {
			$(".thesis_listVoShow").empty();
			$(".thesis_listVoShow").append('<i class="fas fa-angle-down"></i>');
			$(".thesis_listVoShowSkipOn").attr('class', 'thesis_listVoShowSkip');
			$(".thesis").hide();
		}
	});
	
	$(".patent_listVoShow").on("click",function(e){
		if ($(e.target).closest(".patent_listVoShowSkip").hasClass('patent_listVoShowSkip')) {
			$(".patent_listVoShow").empty();
			$(".patent_listVoShow").append('<i class="fas fa-angle-up"></i>');
			$(".patent_listVoShowSkip").attr('class', 'patent_listVoShowSkipOn');
			$(".patent").show();
			
		}else {
			$(".patent_listVoShow").empty();
			$(".patent_listVoShow").append('<i class="fas fa-angle-down"></i>');
			$(".patent_listVoShowSkipOn").attr('class', 'patent_listVoShowSkip');
			$(".patent").hide();
		}
	});
	
	$(".project_careerVoShow").on("click",function(e){
		if ($(e.target).closest(".project_careerVoShowSkip").hasClass('project_careerVoShowSkip')) {
			$(".project_careerVoShow").empty();
			$(".project_careerVoShow").append('<i class="fas fa-angle-up"></i>');
			$(".project_careerVoShowSkip").attr('class', 'project_careerVoShowSkipOn');
			$(".project").show();
			
		}else {
			$(".project_careerVoShow").empty();
			$(".project_careerVoShow").append('<i class="fas fa-angle-down"></i>');
			$(".project_careerVoShowSkipOn").attr('class', 'project_careerVoShowSkip');
			$(".project").hide();
		}
	});
	
	$(".award_historyVoShow").on("click",function(e){
		if ($(e.target).closest(".award_historyVoShowSkip").hasClass('award_historyVoShowSkip')) {
			$(".award_historyVoShow").empty();
			$(".award_historyVoShow").append('<i class="fas fa-angle-up"></i>');
			$(".award_historyVoShowSkip").attr('class', 'award_historyVoShowSkipOn');
			$(".award").show();
			
		}else {
			$(".award_historyVoShow").empty();
			$(".award_historyVoShow").append('<i class="fas fa-angle-down"></i>');
			$(".award_historyVoShowSkipOn").attr('class', 'award_historyVoShowSkip');
			$(".award").hide();
		}
	});
	
	$(".languageVoShow").on("click",function(e){
		if ($(e.target).closest(".languageVoShowSkip").hasClass('languageVoShowSkip')) {
			$(".languageVoShow").empty();
			$(".languageVoShow").append('<i class="fas fa-angle-up"></i>');
			$(".languageVoShowSkip").attr('class', 'languageVoShowSkipOn');
			$(".language").show();
			
		}else {
			$(".languageVoShow").empty();
			$(".languageVoShow").append('<i class="fas fa-angle-down"></i>');
			$(".languageShowSkipOn").attr('class', 'languageVoShowSkip');
			$(".language").hide();
		}
	});
	
	
	$(document).on("click", function(e){
		if($(e.target).closest(".profileBtn").hasClass("profileBtn")){
			
			$(".profileBtn").attr('class','btn btn-primary profileBtnOn');
			
			$.ajax({
	    		type : "POST",
		    		url : "/profileDropdown",
		    		dataType : "HTML",
		    		data : {"user_id" :  "${usersMap.usersVo.user_id}" },
	    		success : function(result) {
	    			$(".profileDropdownBox").append(result);
	    		}
	    	}); 
		}else if (!$(e.target).closest(".profileBtn").hasClass("profileBtn")){
	       	
	       	if($(e.target).closest(".profileBtnOn").hasClass("profileBtnOn")) {
	        	$(".profileDropdownBox").empty();
	        	$(".profileBtnOn").attr('class','btn btn-primary profileBtn');
	       		
	       	}else if (!$(e.target).closest(".dropdown-menu").hasClass("dropdown-menu")){
	       		$(".profileDropdownBox").empty();
	       		$(".profileBtnOn").attr('class','btn btn-primary profileBtn');
	       	}
		}
		
		if($(e.target).closest(".otherBtn").hasClass("otherBtn")){
			
			$(".otherBtn").attr('class','btn btn-default otherBtnOn');
			$.ajax({
	    		type : "POST",
		    		url : "/otherDropdown",
		    		dataType : "HTML",
		    		data : {"user_id" :  "${usersMap.usersVo.user_id}"},
	    		success : function(result) {
	    			$(".otherDropdownBox").append(result);
	    			var i_position= $(e.target).position(); 
	    			i_position.left = i_position.left + 50; 
    			    $('.dropdown-menu').css({'left':i_position.left+ "px"});   
	    		}
	    	}); 
		}else if (!$(e.target).closest(".otherBtn").hasClass("otherBtn")){
	       	
	       	$(".otherBtnOn").attr('class','btn btn-default otherBtn');
       		$(".otherDropdownBox").empty();
		}
	});
});


</script>
<div class="container">
<div class="row">
<div data-spy="scroll" data-target=".navbar-spy"> 
	<div class="row profileHomeBox">
		<div class="col-md-9 mainAllBox">
			<div class="whiteBox introduceBox" style="margin-bottom: 20px;">
				<c:set var="bg_addrpath" value="/background?mem_id=${usersMap.usersVo.user_id }"/>
				<c:set var="profile_addrpath" value="/profile?mem_id=${usersMap.usersVo.user_id }"/> 
				<c:choose>
					<c:when test="${fn:contains(usersMap.usersVo.bg_path, 'http')}">
						<c:set var="bg_path" value="${usersMap.usersVo.bg_path }"/> 
					</c:when>
					<c:when test="${fn:contains(usersMap.usersVo.profile_path, 'http')}">
						<c:set var="profile_path" value="${usersMap.usersVo.profile_path }"/> 
					</c:when>
				</c:choose>
				<div class="profileHomeBackgroundPicture" style="background-image: url(${fn:contains(usersMap.usersVo.bg_path, 'http') ? bg_path : bg_addrpath});"></div>
				<div style="min-height: 328px;">
					<div class="profileHomeProfilePicture" style="background-image: url(${fn:contains(usersMap.usersVo.profile_path, 'http') ? profile_path : profile_addrpath});"></div>
					<div style="width: 791px; padding:24px; margin-top: -72px;">
						 <c:choose>
							<c:when test="${SESSION_MEMBERVO.mem_id == usersMap.usersVo.user_id }">
								<a class="modalA" role="${usersMap.usersVo.user_id}" data-toggle="modal" data-target="#myModal" title="introduction" ><span style="font-size: 20px;padding-left: 717px; color: #0073B1;"><i class="fas fa-pencil-alt"></i></span></a>
						 	</c:when>
						 	<c:otherwise>
						 		<div class="modalA" style="height: 27px;"></div>
						 	</c:otherwise>
						 </c:choose>
						<div class="memberBox" style="display: flex;">
							<div style="width: 500px;">
								<div style="display:flex;"> 
									<label class="member" style="width: auto; color: black;">${usersMap.usersVo.user_name }</label>
									<a href="/blog/blogMainView?user_id=${ usersMap.usersVo.user_id }" class="btn btn-default" style="border:0px; height: 32px; font-weight: bold; padding: 0 12px 6px 12px;">
										<span style="color: #337ab7; font-size: 25px;">Blog</span>
									</a>
								</div>
								<label class="member simpleInfo" style="font-size: 20px; font-weight: 100;">${usersMap.usersVo.introduce }</label>
								<c:if test="${not empty usersMap.usersVo.addr1}">
									<label style="font-size: 17px; font-weight: 100;">${fn:split(usersMap.usersVo.addr1,' ')[0]}</label>
								</c:if>
							</div>
							
							<div style="height: 100px;">
								<c:if test="${not empty career_infoMap.career_infoVoList}">
									<div>
										<a href="#careerFirst"><span style="color: #B3B6B9;font-size: 18px;"><i style="width:30px;" class="fas fa-building"></i></span>
										<label class="memberRight" style="color: black;">${career_infoMap.career_infoVoList[0].corporate_name }</label></a>
									</div>
								</c:if>
								
								<c:if test="${not empty education_infoMap.education_infoVoList}">
								<div>
									<a href="#educationFirst"><span style="color: #B3B6B9;font-size: 18px;"><i style="width:30px;" class="fas fa-graduation-cap"></i></span>
									<label class="memberRight" style="color: black;">${education_infoMap.education_infoVoList[0].school_name }</label></a>
								</div>
								</c:if>
								
								<div>
									<span style="color: #B3B6B9;font-size: 18px;"> <i style="width:30px;" class="fas fa-address-card"></i></span>
									<a class="telInfoA" data-toggle="modal" data-target="#myModal" title="${usersMap.usersVo.user_id }" ><label class="memberRight" style="color: black;">연락처 보기</label></a>
								</div>
								<div>
									<span style="color: #B3B6B9;font-size: 18px;"><i style="width:30px;" class="fas fa-users"></i></span>
									<label class="memberRight">
										<c:choose>
											<c:when test="${SESSION_MEMBERVO.mem_id == usersMap.usersVo.user_id }">
												<a href="/connections?sort=new">1촌 (${peopleCount }명)</a>
											</c:when>
											<c:otherwise>
												1촌 ${peopleCount }명 보기
											</c:otherwise>
										</c:choose>
									</label>
								</div>
							</div>
						</div>
						<div style="margin-top: 133px;">
							<div class="btn-group" role="group" aria-label="...">
							  <c:choose>
							  	<c:when test="${SESSION_MEMBERVO.mem_id == usersMap.usersVo.user_id }">
								  	<button style="width: 194px; height: 40px;font-size: 18px;" type="button" class="btn btn-primary profileBtn">
								   	프로필 항목 등록 <span class="caret"></span>
								   	</button>
							  	</c:when>
							  	<c:otherwise>
							  		<c:choose>
							  			<c:when test="${SESSION_MEMBERVO.mem_division == 2 }">
							  				<c:choose>
							  					<c:when test="${empty followVo.mem_id }">
							  						<button style="height: 40px;font-size: 18px;" type="button" class="btn btn-primary" onclick="location.href='/profileInsertFollow?mem_id=${SESSION_MEMBERVO.mem_id}&ref_keyword=${param.user_id }&division=43'">
											  		팔로우
											  		</button>
							  					</c:when>
							  					<c:otherwise>
							  						<button style="height: 40px;font-size: 18px; color: #469a1f;" type="button" class="btn btn-link" disabled="disabled">
											  			<span style="font-size: 18px; color: #469a1f;"><i class="far fa-check-circle"></i></span>팔로우 중
											  		</button>
							  					</c:otherwise>
							  				</c:choose>
							  			</c:when>
							  			<c:otherwise>
							  				<c:choose>
								  				<c:when test="${empty personalWaitVo and empty personalVo }">
								  					<button style="height: 40px;font-size: 18px;" type="button" class="btn btn-primary" onclick="location.href='/profileInsertConnection?user_id=${SESSION_MEMBERVO.mem_id}&receive_id=${usersMap.usersVo.user_id }'">
											  		일촌맺기
											  		</button>
											  	</c:when>
								  				<c:when test="${personalWaitVo.receive_accept eq 'N'}">
									  				<button style="height: 40px;font-size: 18px; color: #469a1f;" type="button" class="btn btn-link" disabled="disabled">
											  			<span style="font-size: 18px; color: #469a1f;"><i class="far fa-check-circle"></i></span>일촌 대기중
											  		</button>
								  				</c:when>
								  				<c:otherwise>
								  					<button style="height: 40px;font-size: 18px; color: #469a1f;" type="button" class="btn btn-link" disabled="disabled">
											  			<span style="font-size: 18px; color: #469a1f;"><i class="far fa-check-circle"></i></span>일촌 중
											  		</button>
								  				</c:otherwise>
									  		</c:choose>
							  			</c:otherwise> 
							  		</c:choose>
							  	</c:otherwise>
							  </c:choose>
							 
						  	  <button class="btn btn-default otherBtn" style="height: 40px; margin-left: 10px;">...</button>
							</div>
						</div>
						<div class="profileDropdownBox">
							
						</div>
						<div class="otherDropdownBox">
							
						</div>
						
						<c:if test="${(not empty usersMap.usersVo.profile_contents) or (not empty usersMap.filesVoList)}">
							<div class="userContentsSkip" style="border-top: 1px solid #CDCFD2; margin-top: 20px; padding-top: 10px;">
								<c:if test="${not empty usersMap.usersVo.profile_contents}">
									<pre>${usersMap.usersVo.profile_contents }</pre>
								</c:if>
								
								<div style="display: flex; flex: auto; flex-direction: row; flex-wrap: wrap;">
									<c:forEach items="${usersMap.filesVoList }" var="files" > 
										<div style="height: 25px; margin-right: 10px;border: 2px solid #CDCFD2; font-weight: bold">
											<a href="/fileDownload?file_code=${files.file_code }">${files.file_name}</a>
										</div>
									</c:forEach>
								</div>
								<c:if test="${fn:length(usersMap.usersVo.profile_contents) > 75 }">
									<button class="btn btn-link userContentsShow" style="outline: 0; text-decoration: none;">더 보기 <i class="fas fa-angle-down"></i></button>
								</c:if>
							</div>
						</c:if>
						
					</div>
				</div>
			</div>
			
			<!-- 경력  -->
			<c:if test="${not empty career_infoMap.career_infoVoList }">
			<div class="whiteBox navbar-spy" style="padding: 20px 20px 20px 20px; margin-bottom: 20px;" >
				<h3 style="margin: 0 0 0 0 ">경력 사항</h3>
				<ul class="list-unstyled">
					<c:forEach items="${career_infoMap.career_infoVoList }" var="career_infoVo" varStatus="i">
						<fmt:formatDate value="${career_infoVo.join_date }" var="strDate" pattern="yyyy년 MM월"/>
						<fmt:formatDate value="${career_infoVo.resign_date }" var="endDate" pattern="yyyy년 MM월"/>
						<fmt:parseNumber var="year" integerOnly="true" value="${career_infoVo.month / 12}"/>
						<fmt:parseNumber var="month" integerOnly="true" value="${career_infoVo.month % 12}"/>
						<li class="list-unstyled" style="margin-top: 20px; display: flex;position: relative;" <c:if test="${i.first}">id="careerFirst"</c:if>>
							<div style="width: 720px;">
								<a href="/corp/corporation?corp_id=${career_infoVo.corp_id  }" style="display: flex; width: 720px;">
									<c:set var="profile_addrPath" value="/profile?mem_id=${career_infoVo.corp_id }"/>
										<c:if test="${fn:contains(career_infoVo.logo_path, 'http')}">
											<c:set var="logo_path" value="${career_infoVo.logo_path }"/> 
										</c:if>
									<div class="logoPicture" style="background-image: url(${fn:contains(career_infoVo.logo_path, 'http') ? logo_path : profile_addrPath}); width: 120px; height: 50px;"></div>
									<div style="margin-left: 30px; width: 570px;">
										<h4 style="font-weight: 700; margin: 0 0 10px 0 ">${career_infoVo.job_rank }</h4>
										<label style="font-size: 17px; color: rgba(0,0,0,.6);">${career_infoVo.corporate_name }</label><br>
										<label>${strDate } - ${endDate  == null ? '현재' : endDate} · (${year > 1 ? year : ''}${year > 1 ? '년 ' : '' }${month > 1 ? month : '1'}개월)</label><br>
										<label>${career_infoVo.corp_local }</label><br>
										<label>${career_infoVo.job_position }</label><br>
									</div>
								</a>
								
								<!-- 경력 상세 내용 -->
								<c:if test="${not empty career_infoVo.contents }">
									<div class="contentsDiv" style="padding: 10px 30px 0 150px; width: 720px;">
										<pre class="contents" style="width: 536px; margin: 0 0 0 0;">${career_infoVo.contents }</pre>
										<c:if test="${fn:length(career_infoVo.contents) > 70 }">
									 		<span class="contentsBtn" style="color: #0073B1; cursor: pointer;">더 보기 </span>
									 	</c:if>
									</div>
								</c:if>
								
								<!-- 경력 첨부파일 -->
								<c:if test="${not empty career_infoMap.career_infoFileVoList }">
									<div style="display: flex; flex: auto; flex-direction: row; flex-wrap: wrap;">
										<c:forEach var="career_infoFilesVo" items="${career_infoMap.career_infoFileVoList[i.index] }">
										
											<div style="height: 25px; margin: 10px 30px 0 150px;border: 2px solid #CDCFD2; font-size: 15px; font-weight: bold">
												<a href="/fileDownload?file_code=${career_infoFilesVo.file_code }">${career_infoFilesVo.file_name}</a>
											</div>
										</c:forEach>
									</div>
								</c:if>
							</div>
							<c:if test="${usersMap.usersVo.user_id == SESSION_MEMBERVO.mem_id}">
								<div>
									<a class="modalA" role="${career_infoVo.career_code}" data-toggle="modal" data-target="#myModal" title="career"><span style="font-size: 20px;color: #0073B1; height: 20px;"><i class="fas fa-pencil-alt"></i></span></a>
								</div>
							</c:if>
						</li>
					</c:forEach>
				</ul>
			</div>
			</c:if>
			
		    <!-- 학력  -->
			<c:if test="${not empty education_infoMap.education_infoVoList }">
			<div class="whiteBox navbar-spy" style="padding: 20px 20px 20px 20px; margin-bottom: 20px;">
				<h3 style="margin: 0 0 0 0 ">학력 사항</h3>
				<ul class="list-unstyled">
					<c:forEach items="${education_infoMap.education_infoVoList }" var="education_infoVo" varStatus="i">
						<fmt:formatDate value="${education_infoVo.admission }" var="strDate" pattern="yyyy년 MM월"/>
						<fmt:formatDate value="${education_infoVo.graduation }" var="endDate" pattern="yyyy년 MM월"/>
						<li class="list-unstyled" style="margin-top: 20px; display: flex;position: relative;" <c:if test="${i.first}">id="educationFirst"</c:if>>
							<div style="width: 720px;">
								<a style="display: flex; width: 720px;">
									<div class="logoPicture" style="background-image: url(/images/corporation/basic/basicShool.png); width: 120px; height: 50px;"></div>
									<div style="margin-left: 30px; width: 570px;">
										<h4 style="font-weight: 700; margin: 0 0 10px 0 ">${education_infoVo.school_name }</h4>
										<label style="font-size: 17px; color: rgba(0,0,0,.6);">${education_infoVo.degree_name }, ${education_infoVo.major }, ${education_infoVo.grade }</label><br>
										<label>${strDate } - ${endDate}</label><br>
									</div>
								</a>
								
								<!-- 학력 내용 -->
								<c:if test="${not empty education_infoVo.contents }">
									<div class="contentsDiv" style="padding: 10px 30px 0 150px; width: 720px;">
										<pre class="contents" style="width: 536px; margin: 0 0 0 0;">${education_infoVo.contents }</pre>
										<c:if test="${fn:length(education_infoVo.contents) > 70 }">
									 		<span class="contentsBtn" style="color: #0073B1; cursor: pointer;">더 보기 </span>
									 	</c:if>
									</div>
								</c:if>
								
								<!-- 학력 첨부파일 -->
								<c:if test="${not empty education_infoMap.education_infoFileVoList }">
									<div style="display: flex; flex: auto; flex-direction: row; flex-wrap: wrap;">
										<c:forEach var="education_infoFileVo" items="${education_infoMap.education_infoFileVoList[i.index] }">
											<div style="height: 25px; margin: 10px 30px 0 150px;border: 2px solid #CDCFD2; font-size: 15px; font-weight: bold">
												<a href="/fileDownload?file_code=${education_infoFileVo.file_code }">${education_infoFileVo.file_name}</a>
											</div>
										</c:forEach>
									</div>
								</c:if>
							</div>
							<c:if test="${usersMap.usersVo.user_id == SESSION_MEMBERVO.mem_id}">
								<div>
									<a class="modalA" role="${education_infoVo.education_code}" data-toggle="modal" data-target="#myModal" title="education"><span style="font-size: 20px;color: #0073B1; height: 20px;"><i class="fas fa-pencil-alt"></i></span></a>
								</div>
							</c:if>
						</li>
					</c:forEach>
				</ul>
			</div>
			</c:if>
			
		
			<!-- 보유 기술  -->
			<c:if test="${not empty abilityVoList }">
			<div class="whiteBox" style="padding: 20px 20px 20px 20px; margin-bottom: 20px;">
				<h3 style="margin: 0 0 0 0 ">보유기술</h3>
				<ul class="list-unstyled">
					<li class="list-unstyled" style="margin-top: 20px;">
						<c:forEach items="${abilityVoList}" var="abilityVo" varStatus="i">
							<li class="list-unstyled <c:if test='${i.index > 2}'>ability</c:if>" style="margin-top: 20px; display: flex;">
								<div style="width: 720px;">
									<div style="width: 570px;">
										<h4 style="font-weight: 700; margin: 0 0 10px 10px; color: #0073B1;">${abilityVo.ability_item}</h4>
									</div>
								</div>
								<c:if test="${usersMap.usersVo.user_id == SESSION_MEMBERVO.mem_id}">
									<div>
										<a class="modalA" role="${abilityVo.ability_code}" data-toggle="modal" data-target="#myModal" title="ability"><span style="font-size: 20px;color: #0073B1; height: 20px;"><i class="fas fa-pencil-alt"></i></span></a>
									</div>
								</c:if>
							</li>
						</c:forEach>
					</li>
					<c:if test="${fn:length(abilityVoList) > 3}">
					<li class="abilityVoShowSkip" >
						<button class="btn btn-link abilityVoShow" style="outline: 0; text-decoration: none;">더 보기 <i class="fas fa-angle-down"></i></button>
					</li>
					</c:if>
				</ul>
			</div>
			</c:if>
			
			<!-- 이력   -->
			<c:if test="${not empty recordMap.thesis_listVoList or not empty recordMap.patent_listVoList 
							or not empty recordMap.project_careerList or not empty recordMap.award_historyList 
							or not empty recordMap.languageVoList or not empty recordMap.possesion_skillsVoList}">
			<div class="whiteBox" style="padding: 20px 20px 20px 20px; margin-bottom: 20px;">
				<h3 style="margin: 0 0 10px 0;">이력</h3>
				<ul class="list-unstyled" style="padding-left: 10px;">
					<!-- 자격증 -->
					<li>
						<c:if test="${not empty recordMap.possesion_skillsVoList }">
							<div style="display: flex;">
								<label style="font-weight: 700; color: #0073B1; font-size: 30px; ">${fn:length(recordMap.possesion_skillsVoList) }</label>
								<div style="width: 700px;">
									<label style="font-weight: 700; color: #0073B1; font-size: 15px; padding-left: 10px;">자격증</label><br>
									<label id="" style="font-size: 15px; padding-left: 10px;">
										<c:forEach items="${recordMap.possesion_skillsVoList}" var="possesion_skillsVo" varStatus="i">
											${possesion_skillsVo.pskill_name } <c:if test="${!i.last }">·</c:if>
										</c:forEach>
									</label>
								</div>
								<div class="possesion_skillsVoShowSkip">
									<span class="possesion_skillsVoShow" style="font-size: 24px;color: #0073B1;"><i class="fas fa-angle-down"></i></span>
								</div>
							</div>
						</c:if>
					</li>
					<c:forEach items="${recordMap.possesion_skillsVoList}" var="possesion_skillsVo" varStatus="i">
						<c:if test='${!i.first}'><div class="skils" style="width: 686px; height: 10px; border-top: 2px solid #CDCFD2; margin-left: 32px;"></div></c:if>
						<fmt:formatDate value="${possesion_skillsVo.issue_date }" var="strDate" pattern="yyyy년 MM월"/>
						<li class="list-unstyled skils" style="padding: 10px 0 0 30px; margin-bottom : 10px; display: flex;">
							<div style="width: 690px;">
								<div style="width: 570px;">
									<h4 style="font-weight: 700; margin: 0 0 10px 0 ">${possesion_skillsVo.pskill_name }</h4>
									<label style="font-size: 17px; color: rgba(0,0,0,.6);">${possesion_skillsVo.issue_org }</label><br>
									<label>${strDate }</label><br>
								</div>
								<!-- 자격증 내용 -->
								<c:if test="${not empty possesion_skillsVo.contents }">
									<div class="contentsDiv" style="padding: 10px 30px 0 0; width: 720px;">
										<pre class="contents" style="width: 700px; margin: 0 0 0 0;">${possesion_skillsVo.contents }</pre>
										<c:if test="${fn:length(possesion_skillsVo.contents) > 50 }">
									 		<span class="contentsBtn" style="color: #0073B1; cursor: pointer;">더 보기 </span>
									 	</c:if>
									</div>
								</c:if>
							</div>
							<c:if test="${usersMap.usersVo.user_id == SESSION_MEMBERVO.mem_id}">
								<div>
									<a class="modalA" role="${possesion_skillsVo.pskill_code}" data-toggle="modal" data-target="#myModal" title="skills"><span style="font-size: 20px;color: #0073B1; height: 20px;"><i class="fas fa-pencil-alt"></i></span></a>
								</div>
							</c:if>
						</li>
					</c:forEach>
					
					
					<!-- 논문저서 -->
					<li style="margin-top: 20px;">
						<c:if test="${not empty recordMap.thesis_listVoList }">
							<div style="display: flex;">
								<label style="font-weight: 700; color: #0073B1; font-size: 30px; ">${fn:length(recordMap.thesis_listVoList) }</label>
								<div style="width: 700px;">
									<label style="font-weight: 700; color: #0073B1; font-size: 15px; padding-left: 10px;">논문·저서</label><br>
									<label id="" style="font-size: 15px; padding-left: 10px;">
										<c:forEach items="${recordMap.thesis_listVoList}" var="thesis_listVo" varStatus="i">
											${thesis_listVo.thesis_name } <c:if test="${!i.last }">·</c:if>
										</c:forEach>
									</label>
								</div>
								<div class="thesis_listVoShowSkip">
									<span class="thesis_listVoShow" style="font-size: 24px;color: #0073B1;"><i class="fas fa-angle-down"></i></span>
								</div>
							</div>
						</c:if>
					</li>
					<c:forEach items="${recordMap.thesis_listVoList}" var="thesis_listVo" varStatus="i">
						<c:if test='${!i.first}'><div class="thesis" style="width: 686px; height: 10px; border-top: 2px solid #CDCFD2; margin-left: 32px;"></div></c:if>
						<fmt:formatDate value="${thesis_listVo.publication_date }" var="strDate" pattern="yyyy년 MM월"/>
						<li class="list-unstyled thesis" style="padding: 10px 0 0 30px; margin-bottom : 10px; display: flex;">
							<div style="width: 690px;">
								<div style="width: 570px;">
									<h4 style="font-weight: 700; margin: 0 0 10px 0 ">${thesis_listVo.thesis_name }</h4>
									<label style="font-size: 17px; color: rgba(0,0,0,.6);">${thesis_listVo.publisher }</label><br>
									<label>${strDate }</label><br>
									<c:if test='${not empty thesis_listVo.thesis_url}'>
										<label style="font-size: 17px; color: rgba(0,0,0,.6);"><a href="http://${thesis_listVo.thesis_url }" target="_blank">${thesis_listVo.thesis_url }</a></label><br>
									</c:if>
									<label>${thesis_listVo.writer }</label><br>
								</div>
								<!-- 논문저서 내용 -->
								<c:if test="${not empty thesis_listVo.contents }">
									<div class="contentsDiv" style="padding: 10px 30px 0 0; width: 720px;">
										<pre class="contents" style="width: 700px; margin: 0 0 0 0;">${thesis_listVo.contents }</pre>
										<c:if test="${fn:length(thesis_listVo.contents) > 50 }">
									 		<span class="contentsBtn" style="color: #0073B1; cursor: pointer;">더 보기 </span>
									 	</c:if>
									</div>
								</c:if>
							</div>
							<c:if test="${usersMap.usersVo.user_id == SESSION_MEMBERVO.mem_id}">
								<div>
									<a class="modalA" role="${thesis_listVo.thesis_code}" data-toggle="modal" data-target="#myModal" title="Thesis"><span style="font-size: 20px;color: #0073B1; height: 20px;"><i class="fas fa-pencil-alt"></i></span></a>
								</div>
							</c:if>
						</li>
					</c:forEach>
					
					<!-- 특허 -->
					<li style="margin-top: 20px;">
						<c:if test="${not empty recordMap.patent_listVoList }">
							<div style="display: flex;">
								<label style="font-weight: 700; color: #0073B1; font-size: 30px; ">${fn:length(recordMap.patent_listVoList) }</label>
								<div style="width: 700px;">
									<label style="font-weight: 700; color: #0073B1; font-size: 15px; padding-left: 10px;">특허</label><br>
									<label style="font-size: 15px; padding-left: 10px;">
										<c:forEach items="${recordMap.patent_listVoList}" var="patent_listVo" varStatus="i">
											${patent_listVo.patent_name } <c:if test="${!i.last }">·</c:if>
										</c:forEach>
									</label>
								</div>
								<div class="patent_listVoShowSkip">
									<span class="patent_listVoShow" style="font-size: 24px;color: #0073B1;"><i class="fas fa-angle-down"></i></span>
								</div>
							</div>
						</c:if>
					</li>
					<c:forEach items="${recordMap.patent_listVoList}" var="patent_listVo" varStatus="i">
						<c:if test='${!i.first}'><div class="patent" style="width: 686px; height: 10px; border-top: 2px solid #CDCFD2; margin-left: 32px;"></div></c:if>
						<fmt:formatDate value="${patent_listVo.patent_date }" var="strDate" pattern="yyyy년 MM월"/>
						<li class="list-unstyled patent" style="padding: 10px 0 0 30px; margin-bottom : 10px; display: flex;">
							<div style="width: 690px;">
								<div style="width: 570px;">
									<h4 style="font-weight: 700; margin: 0 0 10px 0 ">${patent_listVo.patent_name }</h4>
									<label style="font-size: 17px; color: rgba(0,0,0,.6);">특허 출원 번호 : ${patent_listVo.patent_no }</label><br>
									<label>${patent_listVo.nation }</label><br>
									<label>${strDate }</label><br>
									<c:if test='${not empty patent_listVo.patent_url}'>
										<label style="font-size: 17px; color: rgba(0,0,0,.6);"><a href="http://${patent_listVo.patent_url }" target="_blank">${patent_listVo.patent_url }</a></label><br>
									</c:if>
									<label> ${patent_listVo.inventer }</label><br>
								</div>
								<!-- 특허 내용 -->
								<c:if test="${not empty patent_listVo.contents }">
									<div class="contentsDiv" style="padding: 10px 30px 0 0; width: 720px;">
										<pre class="contents" style="width: 700px; margin: 0 0 0 0;">${patent_listVo.contents }</pre>
										<c:if test="${fn:length(patent_listVo.contents) > 50 }">
									 		<span class="contentsBtn" style="color: #0073B1; cursor: pointer;">더 보기 </span>
									 	</c:if>
									</div>
								</c:if>
							</div>
							<c:if test="${usersMap.usersVo.user_id == SESSION_MEMBERVO.mem_id}">
								<div>
									<a class="modalA" role="${patent_listVo.patent_code}" data-toggle="modal" data-target="#myModal" title="patent"><span style="font-size: 20px;color: #0073B1; height: 20px;"><i class="fas fa-pencil-alt"></i></span></a>
								</div>
							</c:if>
						</li>
					</c:forEach>
					
					 <!-- 프로젝트 -->
					 <li style="margin-top: 20px;">
						<c:if test="${not empty recordMap.project_careerList }">
							<div style="display: flex;">
								<label style="font-weight: 700; color: #0073B1; font-size: 30px; ">${fn:length(recordMap.project_careerList) }</label>
								<div style="width: 700px;">
									<label style="font-weight: 700; color: #0073B1; font-size: 15px; padding-left: 10px;">프로젝트</label><br>
									<label style="font-size: 15px; padding-left: 10px;">
										<c:forEach items="${recordMap.project_careerList}" var="project_careerVo" varStatus="i">
											${project_careerVo.project_name } <c:if test="${!i.last }">·</c:if>
										</c:forEach>
									</label>
								</div>
								<div class="project_careerVoShowSkip">
									<span class="project_careerVoShow" style="font-size: 24px;color: #0073B1;"><i class="fas fa-angle-down"></i></span>
								</div>
							</div>
						</c:if>
					</li>
					<c:forEach items="${recordMap.project_careerList}" var="project_careerVo" varStatus="i">
						<c:if test='${!i.first}'><div class="project" style="width: 686px; height: 10px; border-top: 2px solid #CDCFD2; margin-left: 32px;"></div></c:if>
						<fmt:formatDate value="${project_careerVo.start_date }" var="strDate" pattern="yyyy년 MM월"/>
						<fmt:formatDate value="${project_careerVo.end_date }" var="endDate" pattern="yyyy년 MM월"/>
						<fmt:parseNumber var="year" integerOnly="true" value="${project_careerVo.month / 12}"/>
						<fmt:parseNumber var="month" integerOnly="true" value="${project_careerVo.month % 12}"/>
						<li class="list-unstyled project" style="padding: 10px 0 0 30px; margin-bottom : 10px; display: flex;">
							<div style="width: 690px;">
								<div style="width: 570px;">
									<h4 style="font-weight: 700; margin: 0 0 10px 0 ">${project_careerVo.project_name }</h4>
									<c:if test='${not empty project_careerVo.project_url}'>
										<label style="font-size: 17px; color: rgba(0,0,0,.6);"><a href="http://${project_careerVo.project_url }" target="_blank">${project_careerVo.project_url }</a></label><br>
									</c:if>
									<label>${project_careerVo.project_leader }</label><br>
									<label>${strDate } - ${endDate  == null ? '현재' : endDate} · (${year > 1 ? year : ''}${year > 1 ? '년 ' : '' }${month > 1 ? month : '1'}개월)</label><br>
								</div>
								<!-- 프로젝트 내용 -->
								<c:if test="${not empty project_careerVo.contents }">
									<div class="contentsDiv" style="padding: 10px 30px 0 0; width: 720px;">
										<pre class="contents" style="width: 700px; margin: 0 0 0 0;">${project_careerVo.contents }</pre>
										<c:if test="${fn:length(project_careerVo.contents) > 50 }">
									 		<span class="contentsBtn" style="color: #0073B1; cursor: pointer;">더 보기 </span>
									 	</c:if>
									</div>
								</c:if>
							</div>
							<c:if test="${usersMap.usersVo.user_id == SESSION_MEMBERVO.mem_id}">
								<div>
									<a class="modalA" role="${project_careerVo.project_code}" data-toggle="modal" data-target="#myModal" title="project"><span style="font-size: 20px;color: #0073B1; height: 20px;"><i class="fas fa-pencil-alt"></i></span></a>
								</div>
							</c:if>
						</li>
					</c:forEach>
					
				 <!-- 수상 경력 -->
				 <li style="margin-top: 20px;">
						<c:if test="${not empty recordMap.award_historyList }">
							<div style="display: flex;">
								<label style="font-weight: 700; color: #0073B1; font-size: 30px; ">${fn:length(recordMap.award_historyList) }</label>
								<div style="width: 700px;">
									<label style="font-weight: 700; color: #0073B1; font-size: 15px; padding-left: 10px;">수상 경력</label><br>
									<label style="font-size: 15px; padding-left: 10px;">
										<c:forEach items="${recordMap.award_historyList}" var="award_historyVo" varStatus="i">
											${award_historyVo.award_name } <c:if test="${!i.last }">·</c:if>
										</c:forEach>
									</label>
								</div>
								<div class="award_historyVoShowSkip">
									<span class="award_historyVoShow" style="font-size: 24px;color: #0073B1;"><i class="fas fa-angle-down"></i></span>
								</div>
							</div>
						</c:if>
					</li>
					<c:forEach items="${recordMap.award_historyList}" var="award_historyVo" varStatus="i">
						<c:if test='${!i.first}'><div class="award" style="width: 686px; height: 10px; border-top: 2px solid #CDCFD2; margin-left: 32px;"></div></c:if>
						<fmt:formatDate value="${award_historyVo.award_date }" var="strDate" pattern="yyyy년 MM월"/>
						<li class="list-unstyled award" style="padding: 10px 0 0 30px; margin-bottom : 10px; display: flex;">
							<div style="width: 690px;">
								<div style="width: 570px;">
									<h4 style="font-weight: 700; margin: 0 0 10px 0 ">${award_historyVo.award_name }</h4>
									<label style="font-size: 17px; color: rgba(0,0,0,.6);">${award_historyVo.award_org }</label><br>
									<label>${strDate }</label><br>
								</div>
								<!-- 수상 경력 내용 -->
								<c:if test="${not empty award_historyVo.contents }">
									<div class="contentsDiv" style="padding: 10px 30px 0 0; width: 720px;">
										<pre class="contents" style="width: 700px; margin: 0 0 0 0;">${award_historyVo.contents }</pre>
										<c:if test="${fn:length(award_historyVo.contents) > 50 }">
									 		<span class="contentsBtn" style="color: #0073B1; cursor: pointer;">더 보기 </span>
									 	</c:if>
									</div>
								</c:if>
							</div>
							<c:if test="${usersMap.usersVo.user_id == SESSION_MEMBERVO.mem_id}">
								<div>
									<a class="modalA" role="${award_historyVo.award_code}" data-toggle="modal" data-target="#myModal" title="award"><span style="font-size: 20px;color: #0073B1; height: 20px;"><i class="fas fa-pencil-alt"></i></span></a>
								</div>
							</c:if>
						</li>
					</c:forEach>
					
					<!-- 외국어 -->
					 <li style="margin-top: 20px;">
						<c:if test="${not empty recordMap.languageVoList }">
							<div style="display: flex;">
								<label style="font-weight: 700; color: #0073B1; font-size: 30px; ">${fn:length(recordMap.languageVoList) }</label>
								<div style="width: 700px;">
									<label style="font-weight: 700; color: #0073B1; font-size: 15px; padding-left: 10px;">외국어</label><br>
									<label style="font-size: 15px; padding-left: 10px;">
										<c:forEach items="${recordMap.languageVoList}" var="languageVo" varStatus="i">
											${languageVo.lang_kind } <c:if test="${!i.last }">·</c:if>
										</c:forEach>
									</label>
								</div>
								<div class="languageVoShowSkip">
									<span class="languageVoShow" style="font-size: 24px;color: #0073B1;"><i class="fas fa-angle-down"></i></span>
								</div>
							</div>
						</c:if>
					</li>
					<c:forEach items="${recordMap.languageVoList}" var="languageVo" varStatus="i">
						<c:if test='${!i.first}'><div class="language" style="width: 686px; height: 10px; border-top: 2px solid #CDCFD2; margin-left: 32px;"></div></c:if>
						<li class="list-unstyled language" style="padding: 10px 0 0 30px; margin-bottom : 10px; display: flex;">
							<div style="width: 690px;">
								<div style="width: 570px;">
									<h4 style="font-weight: 700; margin: 0 0 10px 0 ">${languageVo.lang_kind }</h4>
									<label style="font-size: 17px; color: rgba(0,0,0,.6);">${languageVo.grade }</label><br>
								</div>
							</div>
							<c:if test="${usersMap.usersVo.user_id == SESSION_MEMBERVO.mem_id}">
								<div>
									<a class="modalA" role="${languageVo.lang_code}" data-toggle="modal" data-target="#myModal" title="language"><span style="font-size: 20px;color: #0073B1; height: 20px;"><i class="fas fa-pencil-alt"></i></span></a>
								</div>
							</c:if>
						</li>
					</c:forEach>
				</ul>
			</div> 
			</c:if>
			
			
		</div>
		<div class="col-md-3" style="padding-left: 5px;">
			<div class="whiteBox" style="width: 250px; text-align: left;">
				<h3 style="margin: 20px 0 15px 80px;">관심분야</h3>
				<c:choose>
					<c:when test="${not empty hashtagFollowVoList }">
						<c:forEach items="${hashtagFollowVoList }" var="followVo" varStatus="i">
							<a href="/hashtagpost?hashtag_name=${fn:split(followVo.ref_keyword,'#')[0] }" <c:if test="${i.index > 4 }">class="followHashtag"</c:if>><h4 style="color: #337ab7;margin: 15px 0 15px 60px;"><i class="fas fa-hashtag" style="margin-right: 5px;"></i>${fn:split(followVo.ref_keyword,'#')[0] }</h4></a>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<h4 style="color: #337ab7; margin: 20px 0 15px 49px;">관심분야가 없습니다.</h4>
					</c:otherwise>
				</c:choose>
				<c:if test="${fn:length(hashtagFollowVoList) > 5 }">
					<li class="hashtagFollowVoShowSkip" >
						<button class="btn btn-link hashtagFollowVoShow" style="outline: 0; text-decoration: none; font-size: 17px; margin: 0 0 0 70px;">더 보기 <i class="fas fa-angle-down"></i></button>
					</li>
				</c:if>
			</div>
		</div>
	</div>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" style="width: 744px;">
    <div class="modal-content" style="width: 744px; min-width: 100px; min-height: 100px;">
		
	</div>
    </div>
	</div>
</div>
</div>
</div>		