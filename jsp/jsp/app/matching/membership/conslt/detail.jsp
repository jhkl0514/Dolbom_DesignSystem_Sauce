<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="icube.manage.consult.biz.MbrConsltVO"%>
<%@ page import="icube.manage.consult.biz.MbrConsltChgHistVO"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="icube.common.util.StringUtil"%>
<%@ page import="icube.common.util.DateUtil"%>

<%
	MbrConsltVO mbrConsltVO = (MbrConsltVO) request.getAttribute("mbrConsltVO");
	MbrConsltChgHistVO reuqestChgHistVO = (MbrConsltChgHistVO) request.getAttribute("reuqestChgHistVO");
	MbrConsltChgHistVO connectChgHistVO = (MbrConsltChgHistVO) request.getAttribute("connectChgHistVO");
	MbrConsltChgHistVO progressChgHistVO = (MbrConsltChgHistVO) request.getAttribute("progressChgHistVO");
	MbrConsltChgHistVO completeChgHistVO = (MbrConsltChgHistVO) request.getAttribute("completeChgHistVO");
%>
<%!
	public String getDateFormat(MbrConsltChgHistVO chgHistVO) {
		if (chgHistVO == null) {
			return "-";
		}
		return getDateFormat(chgHistVO.getRegDt());
	}

	public String getDateFormat(Date date) {
		int hours = date.getHours();

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy.MM.dd HH:mm");
		String dateString = formatter.format(date);
		String[] strArray = dateString.split(" ");
		if (strArray.length > 1) {
			//오전, 오후 판별
			String addedText = "오전";
			if (hours >= 12) {
				addedText = "오후";
			}

			dateString = strArray[0] + " " + addedText + " " + strArray[1];
		}

		return dateString;
	}
%>

	<div class="wrapper">

		<!-- 상단 뒤로가기 버튼 추가 -->
	    <jsp:include page="/WEB-INF/jsp/app/matching/common/topButton.jsp">
	        <jsp:param value="상담상세" name="addTitle" />
	        <jsp:param value="true" name="addHome" />
	    </jsp:include>


        <main>
            <section class="default noPad">
				<%-- 상담 취소 여부 --%>
				<c:set var="isCancelConslt" value="${mbrConsltVO.consltSttus eq 'CS03' || mbrConsltVO.consltSttus eq 'CS04' || mbrConsltVO.consltSttus eq 'CS09' ? true : false}" scope="request"/>

                <div class="box_history_area <c:if test="${isCancelConslt}">gray</c:if>">
                    <c:choose>
                    	<c:when test="${mbrConsltVO.consltSttus eq 'CS01' || mbrConsltVO.consltSttus eq 'CS07'}">
                    		<h4 class="title color_tp_i">
		                        신청완료<br>
		                        적합한 곳을 연결 중이에요
		                    </h4>
		                    <div class="h32"></div>
                    	</c:when>
                    	<c:when test="${mbrConsltVO.consltSttus eq 'CS02' || mbrConsltVO.consltSttus eq 'CS08'}">
                    		<h4 class="title color_tp_i">
		                        상담연결중<br>
		                        적합한 곳을 찾았어요! 기다려주세요
		                    </h4>
		                    <div class="h32"></div>
                    	</c:when>
                    	<c:when test="${mbrConsltVO.consltSttus eq 'CS05' || mbrConsltVO.consltSttus eq 'CS10'}">
                    		<h4 class="title color_tp_i">
		                        상담진행중<br>
		                        곧 연락드릴게요
		                    </h4>
		                    <div class="h32"></div>
                    	</c:when>
                    	<c:when test="${mbrConsltVO.consltSttus eq 'CS06'}">
                    		<h4 class="title color_tp_i">
		                        상담완료<br>
		                        혜택이 아직 더 남아있어요
		                    </h4>
		                    <div class="h16"></div>
		                    <span class="waves-effect link_text color_white font_sbmu" onclick="location.href='/matching/main/service';">더 알아보기</span>
		                    <div class="h44"></div>
                    	</c:when>
                    	<c:otherwise>
                    		<h4 class="title color_tp_i">
		                        취소되었어요<br>
		                        재신청하거나 다른 혜택을 알아보세요
		                    </h4>
		                    <div class="h16"></div>
		                    <span class="waves-effect link_text color_white font_sbmu" onclick="location.href='/matching/main/service';">더 알아보기</span>
		                    <div class="h44"></div>
                    	</c:otherwise>
                    </c:choose>

                    <div class="card waves-effect w100p radius08">

                        <%-- 상담 상태 박스 --%>
						<c:set var="consltInfo" value="${mbrConsltVO}" scope="request"/>
						<jsp:include page="/WEB-INF/jsp/app/matching/membership/conslt/include/consltStatusBox.jsp">
							<jsp:param value="true" name="noRightArrow" />
    					</jsp:include>

                    </div>
                    <!-- card -->


                </div>

                <div class="h12"></div>

                <div class="box_normal pad20">

                    <div class="font_sbls padH08">상담정보</div>

                    <div class="h12"></div>


                    <table class="table_basic small_2">
                        <colgroup>
                            <col style="width:50%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th class="font_sbmr">신청자 이름</th>
                                <td class="font_sbmr">${mbrConsltVO.rgtr}</td>
                            </tr>
                        </tbody>
                    </table>

                    <div class="h16"></div>

                    <div class="font_sbmr">어르신의 기본정보</div>

                    <div class="h12"></div>

                    <div class="box_normal gray">


                        <table class="table_basic small_2">
                            <colgroup>
                                <col style="width:50%;">
                                <col>
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th class="color_t_s font_sbmr">본인과의 가족관계</th>
                                    <td class="font_sbmr">${relationCdMap[mbrConsltVO.relationCd]}</td>
                                </tr>
                                <tr>
                                    <th class="color_t_s font_sbmr">어르신 이름</th>
                                    <td class="font_sbmr">${mbrConsltVO.mbrNm}</td>
                                </tr>
                                <tr>
                                    <th class="color_t_s font_sbmr">어르신 생년월일</th>
                                    <td class="font_sbmr">
                                    	<c:if test="${!empty mbrConsltVO.getBrdt()}">
		                            		${StringUtil.birthMasking(DateUtil.formatDate(mbrConsltVO.getBrdt(), "yyyy.MM.dd"))}
		                            	</c:if>
                                    </td>
                                </tr>
                                <tr>
                                    <th class="color_t_s font_sbmr">요양인정번호</th>
                                    <td class="font_sbmr">
                                    	<c:choose>
		                            		<c:when test="${!empty mbrConsltVO.getRcperRcognNo()}">
		                            			L${StringUtil.lnumberMasking(mbrConsltVO.getRcperRcognNo())}
		                            		</c:when>
		                            		<c:otherwise>
		                            			없음
		                            		</c:otherwise>
		                            	</c:choose>
                                    </td>
                                </tr>
                            </tbody>
                        </table>

                    </div>

                    <div class="h16"></div>

                    <div class="font_sbmr">어르신 상담정보</div>

                    <div class="h12"></div>

                    <div class="box_normal gray">

                        <table class="table_basic small_2">
                            <colgroup>
                                <col style="width:50%;">
                                <col>
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th class="color_t_s font_sbmr">상담받을 연락처</th>
                                    <td class="font_sbmr">${StringUtil.phoneMasking(mbrConsltVO.mbrTelno)}</td>
                                </tr>
                                <tr>
                                    <th class="color_t_s font_sbmr">서비스받을 주소</th>
                                    <td class="font_sbmr">${mbrConsltVO.zip}&nbsp;${mbrConsltVO.addr}</td>
                                </tr>
								<tr>
                                    <th class="color_t_s font_sbmr">어르신 연세</th>
                                    <td class="font_sbmr">${over65YnMap[mbrConsltVO.getOver65Yn()]}</td>
                                </tr>
                            </tbody>
                        </table>

                    </div>

                </div>
                <!-- box_normal -->

                <div class="h12"></div>

                <div class="box_normal pad20">

                    <div class="d-flex align_between_center">
                        <div class="font_sbls">
                        	<c:choose>
                        		<c:when test="${isVisibleAssignedBplc}">
									${mbrConsltResultVO.bplcNm}
								</c:when>
                        		<c:otherwise>
                        			어르신 장기요양기관
                        		</c:otherwise>
                        	</c:choose>
                        </div>
						<c:if test="${isVisibleAssignedBplc}">
							<a class="waves-effect btn btn_cancel align_center inline_flex gap02 rounded modal-trigger"
							   href="#modal_counPlace">

								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16"
									 fill="none">
									<path fill-rule="evenodd" clip-rule="evenodd"
										  d="M7.99989 3.06946C5.27682 3.06946 3.06934 5.27694 3.06934 8.00001C3.06934 10.7231 5.27682 12.9306 7.99989 12.9306C10.723 12.9306 12.9304 10.7231 12.9304 8.00001C12.9304 5.27694 10.723 3.06946 7.99989 3.06946ZM1.81934 8.00001C1.81934 4.58659 4.58646 1.81946 7.99989 1.81946C11.4133 1.81946 14.1804 4.58659 14.1804 8.00001C14.1804 11.4134 11.4133 14.1806 7.99989 14.1806C4.58646 14.1806 1.81934 11.4134 1.81934 8.00001ZM7.99989 7.37502C8.34507 7.37502 8.62489 7.65484 8.62489 8.00002V10.2222C8.62489 10.5674 8.34507 10.8472 7.99989 10.8472C7.65471 10.8472 7.37489 10.5674 7.37489 10.2222V8.00002C7.37489 7.65484 7.65471 7.37502 7.99989 7.37502ZM7.99989 5.15279C7.65471 5.15279 7.37489 5.43261 7.37489 5.77779C7.37489 6.12297 7.65471 6.40279 7.99989 6.40279H8.00545C8.35062 6.40279 8.63045 6.12297 8.63045 5.77779C8.63045 5.43261 8.35062 5.15279 8.00545 5.15279H7.99989Z"
										  fill="#333333" />
								</svg>
								정보
							</a>
						</c:if>
                    </div>

                    <div class="h20"></div>

                    <hr>

                    <div class="h20"></div>

                    <div class="font_sbls padH08">상담 진행상황</div>

                    <div class="h12"></div>



                    <div class="step_area_vertical">

                        <div class="step_txt_area">
                            <div class="vertical_bar">
                                <span class="bar_active"></span>
                            </div>
                            <div class="item <c:if test="${phaseNum eq 1}">active</c:if> <c:if test="${phaseNum >= 1 && isCancelConslt}"> past cancel</c:if>">
                                <span class="title color_t_d">신청완료</span>
                                <span class="color_t_t font_sbsr">
                                	<%=getDateFormat(reuqestChgHistVO)%>
                                </span>
                            </div>

                            <div class="h12"></div>

                            <div class="item <c:if test="${phaseNum eq 2}">active</c:if> <c:if test="${phaseNum >= 2 && isCancelConslt}"> past cancel</c:if>">
                                <span class="title">상담연결중</span>
                                <span class="color_t_t font_sbsr">
                                	<%=getDateFormat(connectChgHistVO)%>
                                </span>
                            </div>

                            <div class="h12"></div>

                            <div class="item <c:if test="${phaseNum eq 3}">active</c:if> <c:if test="${phaseNum >= 3 && isCancelConslt}"> past cancel</c:if>">
                                <span class="title fs10">상담진행중</span>
                                <span class="color_t_t font_sbsr">
                                	<%=getDateFormat(progressChgHistVO)%>
                                </span>
                            </div>

                            <div class="h12"></div>

                            <div class="item <c:if test="${phaseNum eq 4}">active</c:if> <c:if test="${phaseNum >= 4 && isCancelConslt}"> past cancel</c:if>">
                                <span class="title">상담완료</span>
                                <span class="color_t_t font_sbsr">
                                	<%=getDateFormat(completeChgHistVO)%>
                                </span>
                            </div>
                        </div>

						<c:if test="${isCancelConslt}">
	                        <div class="h12"></div>
	                        <div class="coun_cancel">
	                            <span class="title color_t_danger font_sbms">상담취소</span>
	                            <span class="color_t_t font_sbsr">
									<c:if test="${!empty mbrConsltVO && !empty mbrConsltVO.getCanclDt() }">
										<%=getDateFormat(mbrConsltVO.getCanclDt())%>
									</c:if>
									
								</span>
	                        </div>
							<div class="marT4" style="padding-left:24px">
								<div class="back_F5F5F5 radius08 padH8W12 color_t_s font_sbsr">${mbrConsltVO.canclResn}</div>
							</div>
						</c:if>

                    </div>

                </div>
                <!-- box_normal -->

                <div class="h12"></div>

                <div class="box_normal pad20">

                    <div class="font_sbls">길잡이</div>

                    <div class="h12"></div>

					<c:if test="${mbrConsltVO.prevPath eq 'equip_ctgry'}">
	                    <div class="waves-effect list_link font_sbmr" onclick="location.href='/matching/bbs/guide/linkview/wfe00001';">복지용구, 실생활에서는 이렇게! 욕실</div>
	                    <div class="waves-effect list_link font_sbmr" onclick="location.href='/matching/bbs/guide/linkview/wfe00002';">복지용구, 실생활에서는 이렇게! 거실</div>
                    </c:if>
                    <c:if test="${mbrConsltVO.prevPath eq 'test' || mbrConsltVO.prevPath eq 'simple_test'}">
	                    <div class="waves-effect list_link font_sbmr" onclick="location.href='/matching/bbs/guide/linkview/ltc00002';">인정등급 발급 절차</div>
	                    <div class="waves-effect list_link font_sbmr" onclick="location.href='/matching/bbs/guide/linkview/ltc00001';">어떤 혜택을 받을 수 있나요?</div>
                    </c:if>
					<c:if test="${mbrConsltVO.prevPath eq 'weltool_info'}">
	                    <div class="waves-effect list_link font_sbmr" onclick="location.href='/matching/bbs/guide/linkview/wfe00003';">복지용구, 실생활에서는 이렇게! 침실</div>
	                    <div class="waves-effect list_link font_sbmr" onclick="location.href='/matching/bbs/guide/linkview/wfe00004';">복지용구, 실생활에서는 이렇게! 야외</div>
                    </c:if>
                    <c:if test="${mbrConsltVO.prevPath eq 'care'}">
	                    <div class="waves-effect list_link font_sbmr" onclick="location.href='/matching/bbs/guide/linkview/cmc00001';">주야간보호센터란?</div>
	                    <div class="waves-effect list_link font_sbmr" onclick="location.href='/matching/bbs/guide/linkview/cmc00002';">방문요양이란?</div>
                    </c:if>

                    <div class="h24"></div>

                    <a class="waves-effect btn-large btn_default w100p" onclick="location.href='/matching/bbs/guide/list';">더 알아보기</a>

                </div>
                <!-- box_normal -->
				<c:if test="${mbrConsltVO.consltSttus eq 'CS01' || mbrConsltVO.consltSttus eq 'CS07'}">
	                <div class="h12"></div>

	                <div class="box_normal padH12W20">

	                    <div class="waves-effect padH16 w100p color_t_s font_sbmr" onclick="clickCancelConslt();">상담취소</div>

	                </div>
                </c:if>
            </section>
        </main>


	</div>
	<!-- wrapper -->

	<c:if test="${!empty mbrConsltResultVO}">
        <jsp:include page="/WEB-INF/jsp/app/matching/common/modal/bplcBottomModal.jsp">
            <jsp:param name="bplcNm" value="${mbrConsltResultVO.bplcNm}" />
            <jsp:param name="addr" value="${mbrConsltResultVO.bplcInfo.addr}" />
            <jsp:param name="daddr" value="${mbrConsltResultVO.bplcInfo.daddr}" />
            <jsp:param name="picTelno" value="${mbrConsltResultVO.bplcInfo.picTelno}" />
        </jsp:include>
    </c:if>

	<script>
        const KEY_LAST_CANCELED_CONSLT_NO = 'KEY_LAST_CANCELED_CONSLT_NO';

        var consltNo = ${mbrConsltVO.consltNo};
		var consltSttus = '${mbrConsltVO.consltSttus}';

		//상담취소 버튼 클릭 이벤트
		async function clickCancelConslt() {
			if (consltSttus !== 'CS01' && consltSttus !== 'CS07') {
				showAlertPopup('이미 진행중인 상담입니다');
				return;
			}

            location.href = '/matching/membership/conslt/cancelReason.form?consltNo=' + consltNo;
		}


	    $(function () {

	    	//body에 css class 추가
			$('body').addClass('back_gray');


	        //세로 스크롤
	        //전체 진행바 높이
	        var step_txt_areaHeight = $('.step_txt_area').height() - 30;
	        $('.vertical_bar').css('height', step_txt_areaHeight + 'px');

	        //진행바 높이
	        var bar_activeTop = $('.step_txt_area .active').position().top + 12;
	        $('.vertical_bar .bar_active').css('height', bar_activeTop + 'px');

	        //지난결과 class추가
	        $('.step_txt_area .item.active').prevAll('.item').addClass('past');

	        //지난결과 class추가 -취소시
	        $('.step_txt_area .item.active.cancel').prevAll('.item').addClass('past cancel');


	        //바텀시트 오픈 요청처리
	        if (location.search.indexOf('bplcInfoOpen') != -1) {
	        	$('#modal_counPlace').modal('open');
	        }

			if (getInLocalStorage(KEY_LAST_CANCELED_CONSLT_NO) == consltNo) {
				showToastMsg('상담이 취소되었어요');
				removeInLocalStorage(KEY_LAST_CANCELED_CONSLT_NO);
			}
	    });
	</script>