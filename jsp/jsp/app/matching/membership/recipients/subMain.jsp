<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="icube.common.util.StringUtil" %>
<%@ page import="icube.common.util.DateUtil" %>

<div class="wrapper">
    <header>
        <nav class="top">
            <div class="btn_back">
                <div class="txt">
                    <span class="txtEvt">어르신 관리</span>
                </div>
            </div>
        </nav>
    </header>

    <main>
        <section class="default">
            <%-- 선택된 수급자 index + 1 --%>
            <c:set var="selectedIndex" value=""/>
            <div class="om_reg_area">
                <ul>
                    <c:forEach var="recipientInfo" items="${mbrRecipientsList}" varStatus="status">
                        <li class="fl_0${status.index + 1} waves-effect<c:if test="${recipientInfo.recipientsNo == curRecipientInfo.recipientsNo}"> active<c:set var="selectedIndex" value="${status.index + 1}" /></c:if>"
                            onclick="handleRecipientSelectBtnClick(${recipientInfo.recipientsNo})">
                                ${recipientInfo.recipientsNm}
                        </li>
                    </c:forEach>
                    <li class="reg_btn waves-effect" onclick="clickAddRecipientBtn('${fn:length(mbrRecipientsList)}');">어르신 등록</li>
                </ul>
            </div>

            <div class="h20"></div>

            <div class="card bder_primary w100p shadow_01 pad20">
                <div class="card-content box_om_profile info_mdfy size_52 noPad cursor_p" onclick="clickRecipientDetail();">
                    <div class="img_area fl_0${selectedIndex}"></div>
                    <div>
                        <div class="font_sbmr"><span class="font_sbmb">${curRecipientInfo.recipientsNm}</span>님</div>
                    </div>
                    <a class="rounded waves-effect btn btn_cancel align_center gap02">어르신 정보</a>
                </div>

                <div class="h16"></div>
				
				
                <table class="table_basic bder_bottom <c:if test="${empty consltInfo && empty recentOrder}">bder_no</c:if>">
                    <colgroup>
                        <col style="width:100px;">
                        <col>
                    </colgroup>
                    <tbody>
                    <tr>
                        <th class="font_sbsr color_t_s" style="vertical-align: middle">요양인정번호</th>
                        <td>
                            <c:choose>
                                <c:when test="${curRecipientInfo.verificationYn == 'Y' && curRecipientInfo.longtermConfirmYn == 'Y'}">
                                    <span class="font_sbms">L${StringUtil.lnumberMasking(curRecipientInfo.rcperRcognNo)}</span>
                                </c:when>
                                <c:otherwise>
                                    <a href="#" onclick="moveToRcperRcognNoRegist()" class="list_link table_link _t02 color_t_t font_sbmr">등록</a>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                    <tr>
                        <th class="font_sbsr color_t_s" style="vertical-align: middle">장기요양기관</th>
                        <td>
                            <c:choose>
                                <c:when test="${isConnectingNewBplc}">
                                    <span class="color_t_t font_sbmr line_clamp_1">새 기관 연결중</span>
                                </c:when>
                                <c:when test="${empty matchingBplc}">
                                    <span class="color_t_t font_sbmr line_clamp_1">연결된 기관 없음</span>
                                </c:when>
                                <c:otherwise>
                                    <a class="list_info table_info font_sbms line_clamp_1 modal-trigger" href="#modal_counPlace">${matchingBplc.bplcNm}</a>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                    </tbody>
                </table>

                <c:choose>
                    <c:when test="${!empty consltInfo && !empty recentOrder}">
                        <div class="h16"></div>
                        <ul class="tabs tabs_layout01">
                            <li class="tab"><a class="active" href="#consltTab">상담내역</a></li>
                            <li class="tab"><a href="#orderTab">주문요청내역</a></li>
                        </ul>
                        <div class="h04"></div>

                        <div id="consltTab" class="col s12">
                            <div class="card w100p noShadow radius0 bder_bottom" onclick='moveToConsltDetail()'>
                                <div class="card-content box_coun_list _om_box padH12">
                                    <jsp:include page="include/recentConsltInfo.jsp">
                                        <jsp:param name="consltSttus" value="${consltInfo.consltSttus}"/>
                                        <jsp:param name="prevPath" value="${consltInfo.prevPath}"/>
                                        <jsp:param name="consltTypeName" value="${prevPath[consltInfo.prevPath]}"/>
                                        <jsp:param name="consltRegDt" value='${DateUtil.getDateTime(consltInfo.regDt, "yyyy.MM.dd")}'/>
                                    </jsp:include>
                                </div>
                            </div>

                            <jsp:include page="include/consltHistoryBtn.jsp">
                                <jsp:param name="recipientNo" value="${curRecipientInfo.recipientsNo}"/>
                            </jsp:include>
                        </div>

                        <div id="orderTab">
                            <div class="card w100p noShadow radius0 bder_bottom" onclick='moveToOrderDetail()'>
                                <div class="card-content box_coun_list _om_box padH12">
                                    <jsp:include page="include/recentOrder.jsp">
                                        <jsp:param name="ordCtgryIds" value="${recentOrderItemCaIds}"/>
                                        <jsp:param name="ordRegDt" value='${DateUtil.getDateTime(recentOrder.regDt, "yyyy.MM.dd")}'/>
                                        <jsp:param name="ordItemThumbnail" value="${recentOrderItemThumbnail}"/>
                                    </jsp:include>
                                </div>
                            </div>

                            <jsp:include page="include/orderHistoryBtn.jsp">
                                <jsp:param name="recipientNo" value="${curRecipientInfo.recipientsNo}"/>
                            </jsp:include>
                        </div>
                    </c:when>
                    <c:when test="${!empty consltInfo}">
                        <div class="h16"></div>
                        <div class="card w100p radius08 back_F5F5F5 noShadow" onclick='moveToConsltDetail()'>
                            <div class="card-content box_coun_list _om_box pad12">
                                <jsp:include page="include/recentConsltInfo.jsp">
                                    <jsp:param name="consltSttus" value="${consltInfo.consltSttus}"/>
                                    <jsp:param name="prevPath" value="${consltInfo.prevPath}"/>
                                    <jsp:param name="consltTypeName" value="${prevPath[consltInfo.prevPath]}"/>
                                    <jsp:param name="consltRegDt" value='${DateUtil.getDateTime(consltInfo.regDt, "yyyy.MM.dd")}'/>
                                </jsp:include>
                            </div>
                        </div>

                        <jsp:include page="include/consltHistoryBtn.jsp">
                            <jsp:param name="recipientNo" value="${curRecipientInfo.recipientsNo}"/>
                        </jsp:include>
                    </c:when>
                    <c:when test="${!empty recentOrder}">
                        <div class="h16"></div>
                        <div class="card w100p radius08 back_F5F5F5 noShadow" onclick='moveToOrderDetail()'>
                            <div class="card-content box_coun_list _om_box pad12">
                                <jsp:include page="include/recentOrder.jsp">
                                    <jsp:param name="ordCtgryIds" value="${recentOrderItemCaIds}"/>
                                    <jsp:param name="ordRegDt" value='${DateUtil.getDateTime(recentOrder.regDt, "yyyy.MM.dd")}'/>
                                    <jsp:param name="ordItemThumbnail" value="${recentOrderItemThumbnail}"/>
                                </jsp:include>
                            </div>
                        </div>
                        <jsp:include page="include/orderHistoryBtn.jsp">
                            <jsp:param name="recipientNo" value="${curRecipientInfo.recipientsNo}"/>
                        </jsp:include>
                    </c:when>
                    <c:otherwise>
                        <div class="h4"></div>
                    </c:otherwise>
                </c:choose>
            </div>

            <div class="h32"></div>

            <div class="card" onclick="moveToWelfareInfo()">
                <div class="card-content weltool_info">
                    <div class="color_t_p font_sbms">어르신 요양정보</div>

                    <div class="h08"></div>
                    <c:choose>
                        <c:when test="${not empty longtermInfo}">
							<span class="link_text big02 color_primary">
                                <fmt:formatNumber value="${longtermInfo.remainAmt}" pattern="###,###"/>원
							</span>
                        </c:when>
                        <c:otherwise>
                            <span class="link_text big02 color_teritiary">조회하기</span>
                        </c:otherwise>
                    </c:choose>

                    <div class="h24"></div>

                    <div class="pad12 radius08 back_FFF5E6 d-flex align-items-center gap08">
                        <object data="/html/page/app/matching/assets/src/images/08etc/icon_chk.svg"></object>
                        <span class="color_tp_s font_sbsr">놓치고 있는 복지용구는?</span>
                    </div>
                </div>
            </div>

            <div class="h32"></div>

            <div class="card">
                <c:choose>
                    <c:when test="${fn:length(recipientsGdsCheckMap) > 0}">
                        <div class="card-content">
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="color_t_p font_sbms">관심 복지용구</div>
                                    <%-- 상담진행중이면 노출하지 않음 --%>
                                <c:if test="${empty progressEquipCtgry}">
                                    <div class="waves-effect link_text small_thin"
                                         onclick="location.href='/matching/welfareinfo/interest/intro?recipientsNo=${curRecipientInfo.recipientsNo}';">설정하기
                                    </div>
                                </c:if>
                            </div>

                            <div class="h24"></div>

                            <div class="wel_select_slide marW-20">
                                <c:if test="${ recipientsGdsCheckMap['10a0'] }">
                                    <div class="ctn waves-effect">
                                        <div class="img_area">
                                            <img src="/html/page/app/matching/assets/src/images/02tool/tool02_01.svg" alt="성인용 보행기">
                                        </div>
                                        <span class="txt">성인용 보행기</span>
                                    </div>
                                </c:if>

                                <c:if test="${ recipientsGdsCheckMap['2080'] }">
                                    <div class="ctn waves-effect">
                                        <div class="img_area">
                                            <img src="/html/page/app/matching/assets/src/images/02tool/tool02_02.svg" alt="수동휠체어">
                                        </div>
                                        <span class="txt">수동휠체어</span>
                                    </div>
                                </c:if>

                                <c:if test="${ recipientsGdsCheckMap['1050'] }">
                                    <div class="ctn waves-effect">
                                        <div class="img_area">
                                            <img src="/html/page/app/matching/assets/src/images/02tool/tool02_03.svg" alt="지팡이">
                                        </div>
                                        <span class="txt">지팡이</span>
                                    </div>
                                </c:if>

                                <c:if test="${ recipientsGdsCheckMap['1090'] }">
                                    <div class="ctn waves-effect">
                                        <div class="img_area">
                                            <img src="/html/page/app/matching/assets/src/images/02tool/tool02_04.svg" alt="안전손잡이">
                                        </div>
                                        <span class="txt">안전손잡이</span>
                                    </div>
                                    <!-- ctn -->
                                </c:if>

                                <c:if test="${ recipientsGdsCheckMap['1080'] }">
                                    <div class="ctn waves-effect">
                                        <div class="img_area">
                                            <img src="/html/page/app/matching/assets/src/images/02tool/tool02_05.svg" alt="미끄럼방지 매트">
                                        </div>
                                        <span class="txt">미끄럼방지<br>매트</span>
                                    </div>
                                </c:if>

                                <c:if test="${ recipientsGdsCheckMap['1070'] }">
                                    <div class="ctn waves-effect">
                                        <div class="img_area">
                                            <img src="/html/page/app/matching/assets/src/images/02tool/tool02_06.svg" alt="미끄럼방지 양말">
                                        </div>
                                        <span class="txt">미끄럼방지<br>양말</span>
                                    </div>
                                </c:if>

                                <c:if test="${ recipientsGdsCheckMap['1010'] }">
                                    <div class="ctn waves-effect">
                                        <div class="img_area">
                                            <img src="/html/page/app/matching/assets/src/images/02tool/tool02_07.svg" alt="욕창예방 매트리스">
                                        </div>
                                        <span class="txt">욕창예방<br>매트리스</span>
                                    </div>
                                </c:if>

                                <c:if test="${ recipientsGdsCheckMap['1040'] }">
                                    <div class="ctn waves-effect">
                                        <div class="img_area">
                                            <img src="/html/page/app/matching/assets/src/images/02tool/tool02_08.svg" alt="욕창예방 방석">
                                        </div>
                                        <span class="txt">욕창예방 방석</span>
                                    </div>
                                </c:if>

                                <c:if test="${ recipientsGdsCheckMap['1030'] }">
                                    <div class="ctn waves-effect">
                                        <div class="img_area">
                                            <img src="/html/page/app/matching/assets/src/images/02tool/tool02_09.svg" alt="자세변환용구">
                                        </div>
                                        <span class="txt">자세변환용구</span>
                                    </div>
                                    <!-- ctn -->
                                </c:if>

                                <c:if test="${ recipientsGdsCheckMap['1020'] }">
                                    <div class="ctn waves-effect">
                                        <div class="img_area">
                                            <img src="/html/page/app/matching/assets/src/images/02tool/tool02_10.svg" alt="요실금 팬티">
                                        </div>
                                        <span class="txt">요실금 팬티</span>
                                    </div>
                                </c:if>

                                <c:if test="${ recipientsGdsCheckMap['10b0'] }">
                                    <div class="ctn waves-effect">
                                        <div class="img_area">
                                            <img src="/html/page/app/matching/assets/src/images/02tool/tool02_11.svg" alt="목욕의자">
                                        </div>
                                        <span class="txt">목욕의자</span>
                                    </div>
                                    <!-- ctn -->
                                </c:if>

                                <c:if test="${ recipientsGdsCheckMap['10c0'] }">
                                    <div class="ctn waves-effect">
                                        <div class="img_area">
                                            <img src="/html/page/app/matching/assets/src/images/02tool/tool02_12.svg" alt="이동변기">
                                        </div>
                                        <span class="txt">이동변기</span>
                                    </div>
                                </c:if>

                                <c:if test="${ recipientsGdsCheckMap['1060'] }">
                                    <div class="ctn waves-effect">
                                        <div class="img_area">
                                            <img src="/html/page/app/matching/assets/src/images/02tool/tool02_13.svg" alt="간이변기">
                                        </div>
                                        <span class="txt">간이변기</span>
                                    </div>
                                    <!-- ctn -->
                                </c:if>

                                <c:if test="${ recipientsGdsCheckMap['10d0'] }">
                                    <div class="ctn waves-effect">
                                        <div class="img_area">
                                            <img src="/html/page/app/matching/assets/src/images/02tool/tool02_14.svg" alt="경사로">
                                        </div>
                                        <span class="txt">경사로</span>
                                    </div>
                                </c:if>
                            </div>

                            <div class="h24"></div>

                                <%-- 상담중인 경우는 상담내역 보기로 노출 --%>
                            <c:choose>
                                <c:when test="${empty progressEquipCtgry}">
                                    <a class="waves-effect btn-large btn_default w100p"
                                       onclick="location.href='/matching/membership/conslt/infoConfirm?prevPath=equip_ctgry&recipientsNo=${curRecipientInfo.recipientsNo}'">상담하기</a>
                                </c:when>
                                <c:otherwise>
                                    <a class="waves-effect btn-large btn_default w100p" onclick="clickConsltList(${progressEquipCtgry.consltNo});">상담내역 보기</a>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="card-content">
                            <div class="color_t_p font_sbms">관심 복지용구</div>
                            <div class="marT4 color_t_s font_sbsr">장기요양금액으로 복지용구 지원받기</div>

                            <div class="h20"></div>

                            <div class="align_center">
                                <dotlottie-player src="/html/page/app/matching/assets/lottie/membership_recipients_subMain_welfare.lottie" background="transparent" speed="1"
                                                  style="width: 280px; height: 130px;" loop autoplay></dotlottie-player>
                            </div>

                            <div class="h20"></div>

                            <a class="waves-effect btn-large btn_default w100p"
                               onclick="location.href='/matching/welfareinfo/interest/intro?recipientsNo=${curRecipientInfo.recipientsNo}';">설정하기</a>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>

            <div class="h32"></div>

            <div class="card">
                <c:choose>
                    <c:when test="${!empty simpleTestInfo}">
                        <div class="card-content">
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="color_t_p font_sbms">인정등급 간편 테스트</div>

                                <%-- 상담진행중이면 노출하지 않음 --%>
                                <c:if test="${empty progressSimpleTest}">
                                    <div class="waves-effect link_text small_thin"
                                         onclick="location.href='/matching/simpletest/simple/intro?recipientsNo=${curRecipientInfo.recipientsNo}';">다시하기
                                    </div>
                                </c:if>
                            </div>

                            <div class="h24"></div>

                            <div class="align_center">
                                    <%-- 대상자 이미지 --%>
                                <c:choose>
                                    <c:when test="${simpleTestInfo.grade eq 1}">
                                        <img src="/html/page/app/matching/assets/src/images/11easy/easy_09.svg" alt="간편 테스트">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="/html/page/app/matching/assets/src/images/11easy/easy_11.svg" alt="간편 테스트">
                                    </c:otherwise>
                                </c:choose>
                            </div>

                            <div class="h24"></div>

                            <%-- 상담중인 경우는 상담내역 보기로 노출 --%>
                            <c:choose>
                                <c:when test="${simpleTestInfo != null && simpleTestInfo.grade eq 0}">
                                    <a class="waves-effect btn-large btn_default w100p" onclick="fn_simpletest_grade0_click()">상담하기</a>
                                </c:when>
                                <c:when test="${empty progressSimpleTest}">
                                    <a class="waves-effect btn-large btn_default w100p"
                                       onclick="location.href='/matching/membership/conslt/infoConfirm?prevPath=simple_test&recipientsNo=${curRecipientInfo.recipientsNo}'">상담하기</a>
                                </c:when>
                                <c:otherwise>
                                    <a class="waves-effect btn-large btn_default w100p" onclick="clickConsltList(${progressSimpleTest.consltNo});">상담내역 보기</a>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="card-content">
                            <div class="color_t_p font_sbms">인정등급 간편 테스트</div>
                            <div class="marT4 color_t_s font_sbsr">혜택 받을 수 있는 지 빠르게 확인하기</div>

                            <div class="h20"></div>

                            <div class="align_center">
                                <dotlottie-player src="/html/page/app/matching/assets/lottie/membership_recipients_subMain_test.lottie" background="transparent" speed="1"
                                                  style="width: 200px; height: 132px;" loop autoplay></dotlottie-player>
                            </div>

                            <div class="h20"></div>

                            <a class="waves-effect btn-large btn_default w100p"
                               onclick="location.href='/matching/simpletest/simple/intro?recipientsNo=${curRecipientInfo.recipientsNo}';">확인하기</a>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>

            <div class="h32"></div>

            <div class="card">
                <c:choose>
                    <c:when test="${!empty careTestInfo}">
                        <div class="card-content">
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="color_t_p font_sbms">어르신 돌봄</div>

                                <%-- 상담진행중이면 노출하지 않음 --%>
                                <c:if test="${empty progressCare}">
                                    <div class="waves-effect link_text small_thin"
                                         onclick="location.href='/matching/simpletest/care/intro?recipientsNo=${curRecipientInfo.recipientsNo}';">설정하기
                                    </div>
                                </c:if>
                            </div>

                            <div class="h24"></div>

                            <c:choose>
                                <%-- 비대상자 이미지 --%>
                                <c:when test="${careTestInfo.grade eq 0}">
                                    <div class="align_center">
                                        <img src="/html/page/app/matching/assets/src/images/11easy/easy_11.svg" alt="간편 테스트">
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <!-- 시간 선택 이미지 -->
                                    <c:choose>
                                        <c:when test="${careTestInfo.careTime eq 10}">
                                            <div class="align_center">
                                                <img src="/html/page/app/matching/assets/src/images/08etc/time03_80.svg" style="height:132px;" alt="어르신 돌봄">
                                            </div>
                                            <div class="h12"></div>
                                            <div class="center font_sbms">8~10시간</div>
                                        </c:when>
                                        <c:when test="${careTestInfo.careTime eq 8}">
                                            <div class="align_center">
                                                <img src="/html/page/app/matching/assets/src/images/08etc/time02_80.svg" style="height:132px;" alt="어르신 돌봄">
                                            </div>
                                            <div class="h12"></div>
                                            <div class="center font_sbms">3~8시간</div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="align_center">
                                                <img src="/html/page/app/matching/assets/src/images/08etc/time01_80.svg" style="height:132px;" alt="어르신 돌봄">
                                            </div>
                                            <div class="h12"></div>
                                            <div class="center font_sbms">3시간 이내</div>
                                        </c:otherwise>
                                    </c:choose>
                                </c:otherwise>
                            </c:choose>

                            <div class="h24"></div>

                            <%-- 상담중인 경우는 상담내역 보기로 노출 --%>
                            <c:choose>
                                <c:when test="${careTestInfo != null && careTestInfo.grade eq 0}">
                                    <a class="waves-effect btn-large btn_default w100p" onclick="fn_simpletest_grade0_click()">상담하기</a>
                                </c:when>
                                <c:when test="${empty progressCare}">
                                    <a class="waves-effect btn-large btn_default w100p"
                                       onclick="location.href='/matching/membership/conslt/infoConfirm?prevPath=care&recipientsNo=${curRecipientInfo.recipientsNo}'">상담하기</a>
                                </c:when>
                                <c:otherwise>
                                    <a class="waves-effect btn-large btn_default w100p" onclick="clickConsltList(${progressCare.consltNo});">상담내역 보기</a>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="card-content">
                            <div class="color_t_p font_sbms">어르신 돌봄</div>
                            <div class="marT4 color_t_s font_sbsr">필요한 시간에 돌봄 서비스 지원받기</div>

                            <div class="h20"></div>

                            <div class="align_center">
                                <dotlottie-player src="/html/page/app/matching/assets/lottie/membership_recipients_subMain_clock.lottie" background="transparent" speed="1"
                                                  style="width: 160px; height: 160px;" loop autoplay></dotlottie-player>
                            </div>

                            <div class="h20"></div>

                            <a class="waves-effect btn-large btn_default w100p"
                               onclick="location.href='/matching/simpletest/care/intro?recipientsNo=${curRecipientInfo.recipientsNo}';">설정하기</a>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </section>
    </main>

    <!-- 하단 네이비게이션 -->
    <jsp:include page="/WEB-INF/jsp/app/matching/common/bottomNavigation.jsp">
        <jsp:param value="recipients" name="menuName"/>
    </jsp:include>
</div>

<jsp:include page="/WEB-INF/jsp/app/matching/common/modal/bplcBottomModal.jsp">
    <jsp:param name="bplcNm" value="${matchingBplc.bplcNm}"/>
    <jsp:param name="addr" value="${matchingBplc.addr}"/>
    <jsp:param name="daddr" value="${matchingBplc.daddr}"/>
    <jsp:param name="picTelno" value="${matchingBplc.picTelno}"/>
</jsp:include>

<script>
    function handleRecipientSelectBtnClick(recipientsNo) {
        if (Number('${curRecipientInfo.recipientsNo}') === recipientsNo) return;
        
        location.href = '/matching/membership/recipients/subMain?recipientsNo=' + recipientsNo;
    }
    
    //어르신 등록 버튼 클릭 이벤트
    async function clickAddRecipientBtn(mbrRecipientsLength) {
        if (mbrRecipientsLength >= 4) {
            await showAlertPopup2('어르신은 최대 4명까지 등록할 수 있어요', '어르신 정보를 ‘어르신>어르신 정보’에서 수정 또는 삭제한 후 다시 시도해주세요');
        } else {
            const answer = await showConfirmPopup('어르신을 등록해주세요', '혜택을 받으려면 정확한 어르신 정보가 필요해요', '등록하기');
            if (answer === 'confirm') {
                location.href = '/matching/membership/recipients/regist/intro?redirecturl=/matching/membership/recipients/subMain';
            }
        }
    }

    //어르신 정보 상세보기 클릭 이벤트
    function clickRecipientDetail() {
        location.href = '/matching/membership/recipients/detail?recipientsNo=${curRecipientInfo.recipientsNo}';
    }

    //상담 내역 보기 클릭 이벤트
    function clickConsltList(consltNo) {
        location.href = '/matching/membership/conslt/detail?consltNo=' + consltNo;
    }
    
    function moveToConsltDetail() {
        location.href = '/matching/membership/conslt/detail?consltNo=${consltInfo.consltNo}';
    }
    
    function moveToOrderDetail() {
        location.href = '/matching/shop/order/detail?ordMCd=${recentOrder.ordMCd}';
    }

    function moveToRcperRcognNoRegist() {
        location.href = "/matching/membership/recipients/rcperRcognNoRegist?recipientsNo=${curRecipientInfo.recipientsNo}"
    }

    async function moveToWelfareInfo() {
        <c:if test="${not empty longtermInfo}">
        location.href = "/matching/welfareinfo/using/view?recipientsNo=${curRecipientInfo.recipientsNo}";
        return;
        </c:if>
        const answer = await showConfirmPopup(null, '조회를 위해 서비스 신청 화면으로 이동 하시겠어요?', '이동하기');
        if (answer === 'confirm') {
            location.href = "/matching/welfareinfo/using/intro?recipientsNo=${curRecipientInfo.recipientsNo}";
        }
    }

    async function fn_simpletest_grade0_click() {
        const answer = await showConfirmPopup('대상자가 아니에요', '받을 수 있는 다른 혜택을 알아보시겠어요?', '알아보기');
        if (answer === 'confirm') location.href = "/matching/bbs/socialwelfare/list";
    }

    async function fn_goto_service() {
        const answer = await showConfirmPopup('', '필요한 서비스를 신청하면 혜택을 받으실 수 있도록 도와드릴게요. 신청을 위해 서비스 화면으로 이동하시겠어요?', '이동하기');
        if (answer !== 'confirm') return false;

        location.href = "/matching/main/service";
    }

    $(function () {
        //백버튼 클릭 시 서비스메인으로 이동
        backBtnEvent = function () {
            location.href = '/matching/main/service';
        }

        //body에 css class 추가
        $('body').addClass('back_gray');
        setupTabs();

        makeCurrentRecipientToMainIfNotMain();
    });

    function setupTabs() {
        const $tabs = $('.tabs');
        $tabs.tabs();
        <c:if test="${!empty consltInfo && !empty recentOrder}">
            if ("${consltInfo.regDt.time > recentOrder.regDt.time}" === "true") {
                $tabs.tabs('select', 'consltTab');
            } else {
                $tabs.tabs('select', 'orderTab');
            }
        </c:if>
    }

    function makeCurrentRecipientToMainIfNotMain() {
        if ('${curRecipientInfo.mainYn != null && curRecipientInfo.mainYn.equals("Y")}' !== 'true') {
            callPostAjaxIfFailOnlyMsg(
                '/matching/membership/recipients/update/main.json',
                {recipientsNo: Number('${recipientsNo}'), isMatching: 'Y'},
                function (result) {
                    showToastMsg('어르신이 선택되었어요');
                }
            );
        }
    }
</script>