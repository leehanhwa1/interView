<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="col-add" class="col-md-3">
	<!-- newList -->
	<div id="div_newList" class="panel panel-default whiteBox" style="width: 296px; margin-left: 0px; height: 370px; margin-bottom: 20px;
			text-align: center; padding-top: 10px; font-size: 22px; box-shadow: 0 6px 12px rgba(0, 0, 0, .15);">
		<div style="text-align: left; padding-left: 15px; padding-bottom: 7px;">
			신규 채용공고
		</div>
		<div style="border: 0px solid; height: 270px; overflow: hidden; padding-left: 2px;">
	   		<c:if test="${newList.size() >= 1 }">
	   			<ul id="content_newList" style="list-style: none; width: 3000px; padding-left: 5px;
	   					margin-left: -290px;">
				<c:forEach items="${newList }" varStatus="i" var="rRVo">
					<li style="float: left; text-align: left;"><div class="whiteBox" style="width: 280px; box-shadow: 0 3px 3px rgba(0, 0, 0, .175);
							margin-right: 10px; padding: 13px; font-size: 16px; height: 270px;">
						<div class="recr" onmouseover="" style="cursor: pointer; height: 215px;
								border-bottom: 1px solid; border-bottom-color: #d9d9d9;"
								data-code="${rRVo.recruit_code }">
							<div class="table_div" style="margin-left: 24px;">
								<img src="${newImgList.get(i.index) }" width="200"> 
							</div> <br>
							<strong>
								<c:choose>
									<c:when test="${rRVo.recruit_title.length() > 18 }">
										${rRVo.recruit_title.substring(0, 18) }...
									</c:when>
									<c:otherwise>
										${rRVo.recruit_title }
									</c:otherwise>
								</c:choose>
							</strong> <br>
							${newNmList.get(i.index) } <br>
							${rRVo.job_local } <br>
							${rRVo.job_type }
						</div>
						<div style="padding-top: 10px;">
							${newTimeList.get(i.index) } 전
						</div>
					</div></li>
				</c:forEach>
				</ul>
			</c:if>
		</div>
		<div style="text-align: center; font-size: 13px; padding-top: 15px;">
			<i onmouseover="" class="fas fa-circle"></i><i onmouseover="" class="far fa-circle"></i><i onmouseover="" class="far fa-circle"></i><i onmouseover="" class="far fa-circle"></i><i onmouseover="" class="far fa-circle"></i><i onmouseover="" class="far fa-circle"></i><i onmouseover="" class="far fa-circle"></i>				
		</div>
	</div>
	<!-- newList -->
</div>