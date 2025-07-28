<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="icube.common.util.DateUtil"%>
<%@ page import="icube.common.util.StringUtil"%>
	<div class="wrapper">

		<!-- 상단 뒤로가기 버튼 추가 -->
	    <jsp:include page="/WEB-INF/jsp/app/matching/common/topButton.jsp">
	        <jsp:param value="어르신 정보" name="addTitle" />
	    </jsp:include>
	    
	    
	    <main>
            <section class="default">

                <div class="box_om_profile info_mdfy">

                    <div class="img_area fl_0${indexNumber}"></div>

                    <div class="font_sbmr"><span class="font_sbmb">${curRecipientInfo.recipientsNm}</span>님</div>
					
                </div>

                <div class="h40"></div>

                <div class="d-flex justify-content-between align-items-center">
                    <span class="font_sbms">기본정보</span>
                    <a class="modal-close waves-effect btn-middle02 btn_white_bder" onclick="clickUpdateRecipientInfo('base');">수정</a>
                </div>

                <div class="h20"></div>

                <table class="table_basic small">
                    <colgroup>
                        <col style="width:50%;">
                        <col>
                    </colgroup>
                    <tbody>
                        <tr>
                            <th class="color_secondary font_sbmr">본인과의 가족관계</th>
                            <td class="font_sbmr">${relationCdMap[curRecipientInfo.relationCd]}</td>
                        </tr>
                        <tr>
                            <th class="color_secondary font_sbmr">어르신 이름</th>
                            <td class="font_sbmr">${curRecipientInfo.recipientsNm}</td>
                        </tr>
                        <tr>
                            <th class="color_secondary font_sbmr">어르신 성별</th>
                            <td class="font_sbmr">
                            	<c:choose>
	                            	<c:when test="${!empty curRecipientInfo.gender}">
	                            		${curRecipientInfo.gender eq 'M' ? '남성' : '여성'}
	                            	</c:when>
	                            	<c:otherwise>
                            			없음
                            		</c:otherwise>
                            	</c:choose>
                            </td>
                        </tr>
                        <tr>
                            <th class="color_secondary font_sbmr">어르신 생년월일</th>
                            <td class="font_sbmr">
                            	<c:choose>
	                            	<c:when test="${!empty curRecipientInfo.brdt && fn:length(curRecipientInfo.brdt) >= 8}">
										${StringUtil.birthMasking(DateUtil.formatDate(curRecipientInfo.brdt, "yyyy.MM.dd"))}
	                            	</c:when>
	                            	<c:otherwise>
	                            		없음
	                            	</c:otherwise>
                            	</c:choose>
                            </td>
                        </tr>
                        <tr>
                            <th class="color_secondary font_sbmr">요양인정번호</th>
                            <td class="font_sbmr">
                            	<c:choose>
                            		<c:when test="${curRecipientInfo.verificationYn == 'Y' && curRecipientInfo.longtermConfirmYn == 'Y'}">
                            			L${StringUtil.lnumberMasking(curRecipientInfo.rcperRcognNo)}
                            		</c:when>
                            		<c:otherwise>
                            			없음
                            		</c:otherwise>
                            	</c:choose>
                            </td>
                        </tr>
                    </tbody>
                </table>

                <div class="h40"></div>


                <div class="d-flex justify-content-between align-items-center">
                    <span class="font_sbms">상담정보</span>
                    <a class="modal-close waves-effect btn-middle02 btn_white_bder" onclick="clickUpdateRecipientInfo('conslt');">수정</a>
                </div>

                <div class="h20"></div>

                <table class="table_basic small">
                    <colgroup>
                        <col style="width:50%;">
                        <col>
                    </colgroup>
                    <tbody>
                        <tr>
                            <th class="color_secondary font_sbmr">상담받을 연락처</th>
                            <td class="font_sbmr">${StringUtil.phoneMasking(curRecipientInfo.tel)}</td>
                        </tr>
                        <tr>
                            <th class="color_secondary font_sbmr">서비스받을 지역</th>
                            <td class="font_sbmr">${curRecipientInfo.sido}&nbsp;${curRecipientInfo.sigugun}</td>
                        </tr>
						<tr>
                            <th class="color_secondary font_sbmr">어르신 연세</th>
                            <td class="font_sbmr">
								<c:choose>
                            		<c:when test="${curRecipientInfo.over65Yn eq 'Y'}">
                            			65세 이상
                            		</c:when>
									<c:when test="${curRecipientInfo.over65Yn eq 'N'}">
                            			65세 미만
                            		</c:when>
                            		<c:otherwise>
                            			
                            		</c:otherwise>
                            	</c:choose>
								
							</td>
                        </tr>
                    </tbody>
                </table>

                <div class="h40"></div>

            </section>
        </main>


        <div class="padH12W20">    
            <div class="waves-effect padH16 w100p color_t_s font_sbmr" onclick="clickRemoveRecipient();">어르신 삭제</div>
            <div class="h40"></div>
        </div>

	</div>
	<!-- wrapper -->
	
	
	<script>
		var recipientsNo = ${curRecipientInfo.recipientsNo};
		var mainYn = '${curRecipientInfo.mainYn}';
		var mbrRecipientsList = [
			<c:forEach var="recipientInfo" items="${mbrRecipientsList}">
				{
					'recipientsNo': ${recipientInfo.recipientsNo},
					'mainYn': '${recipientInfo.mainYn}'
				},
			</c:forEach>
		];
	
		//대표 설정 버튼 그리기
		function showATagMainYn() {
			var aTagMainYn = $('#aTagMainYn');
			
			if(mainYn == 'Y') {
				aTagMainYn.removeClass('btn_cancel');
				aTagMainYn.addClass('btn_primary');
				$('#whiteStarSvg').removeClass('disNone');
				$('#blackStarSvg').addClass('disNone');
			} else {
				aTagMainYn.addClass('btn_cancel');
				aTagMainYn.removeClass('btn_primary');
				$('#whiteStarSvg').addClass('disNone');
				$('#blackStarSvg').removeClass('disNone');
			}
		}
		
		//어르신 수정
		async function clickUpdateRecipientInfo(type) {
			//기본정보 수정페이지로 이동
			if (type === 'base') {
				removeInLocalStorage('updateRelationCd');
				location.href = '/matching/membership/recipients/update/baseInfo?recipientsNo=' + recipientsNo;
			}
			//상담정보 수정페이지로 이동
			else if (type === 'conslt') {
				location.href = '/matching/membership/recipients/update/consltInfo?recipientsNo=' + recipientsNo;
			}
		}
		
		//어르신 삭제
		async function clickRemoveRecipient() {
			if (mainYn === 'Y' && mbrRecipientsList.length <= 1) {
				showToastMsg('대표 어르신 한 분은 꼭 필요해요');
				return;
			}
			
			var answer = await showConfirmPopup('정말 어르신을 삭제하시겠어요?', '삭제 후에는 복구가 불가해요');
			if (answer === 'confirm') {
				callPostAjaxIfFailOnlyMsg(
	        		'/matching/membership/recipients/removeMbrRecipient.json',
	        		{ recipientsNo:Number(recipientsNo), mustCallbackJs: true },
	        		function(result) {
	        			if (!result.success) {
	        				showToastMsg(result.message);
	        				return;
	        			}
	        			
	        			popHistoryStack();
	        			saveInLocalStorage('msg', '어르신이 삭제되었어요');
	        			location.href = '/matching/membership/recipients/subMain';
	        		}
	     		);
			}
		}
		
		
		$(function() {
			//대표 설정 버튼 그리기
			showATagMainYn();
		});
	</script>