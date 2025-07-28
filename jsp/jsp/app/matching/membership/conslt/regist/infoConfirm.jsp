<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<div class="wrapper">
	
       	<!-- 상단 뒤로가기 버튼 추가 -->
		<jsp:include page="/WEB-INF/jsp/app/matching/common/topButton.jsp" />
        
        
        <main>
            <section class="intro">

                <h3 class="title">
                    <!--mark class="mk01">${recipient.recipientsNm}님</mark--> 상담을 위해<br />필요한 정보를 확인해주세요
                </h3>

                <div class="h40"></div>

                <table class="table_basic">
                    <colgroup>
                        <col style="width:120px;">
                        <col>
                    </colgroup>
                    <tbody>
                        <tr>
                            <th class="font_sbmr">상담유형</th>
                            <td class="l_right padR20 color_tp_s font_sbms">${consltTypeNm}</td>
                        </tr>
                        <tr>
                            <th class="font_sbmr">신청자 이름</th>
                            <td class="l_right padR20 color_tp_s font_sbms">${_matMbrSession.mbrNm}</td>
                        </tr>
                        <tr>
                            <th class="font_sbmr">어르신 기본정보</th>
                            <td class="l_right padR20 color_tp_s font_sbms">
								<c:if test="${relationNm eq recipient.recipientsNm}">
									${relationNm}
								</c:if>
								<c:if test="${relationNm ne recipient.recipientsNm}">
									${relationNm}(${recipient.recipientsNm})
								</c:if>
								
							</td>
                        </tr>
                        <tr>
                            <th class="font_sbmr">상담받을 연락처</th>
                            <td class="l_right">
                                <span id="spanTel" class="waves-effect link_text" onclick="handleTelClick()"></span>
                            </td>
                        </tr>
						<tr>
                            <th class="font_sbmr">어르신 연세</th>
                            <td class="l_right">
								
                                <span id="spanOver65" onclick="handleOver65Click()" class="waves-effect link_text <c:if test='${recipient.verificationYn != null && recipient.verificationYn.equals("Y")}'>no_arrow</c:if>"></span>
                            </td>
                        </tr>
                    </tbody>
                </table>

            </section>
        </main>
        

        <footer class="page-footer">

            <div class="relative">
                <a class="waves-effect btn-large btn_primary w100p" onclick="clickNextBtn();">다음</a>
            </div>

        </footer>
	    
	</div>
	<!-- wrapper -->
	
	<jsp:include page="/WEB-INF/jsp/app/matching/common/checkExistInProgressConslt.jsp"></jsp:include>
	
	<script>
		function handleTelClick() {
			location.href='/matching/membership/conslt/telChange?' + createQs();
		}

		function handleOver65Click() {
			if ('${recipient.verificationYn != null && recipient.verificationYn.equals("Y")}' == 'true') return;
			location.href='/matching/membership/conslt/over65Change?' + createQs();
		}
		
		//다음 버튼 클릭 이벤트
		function clickNextBtn() {
			if (!$('#spanTel').attr("value")) {
                showToastMsg('상담받을 연락처를 입력하세요');
                return;
			}
            checkInProgressConsltOrOrder(
                '${inProgressConsltOrOrder}' && JSON.parse('${inProgressConsltOrOrder}'),
                handleInProgressThingNotExist,
                Boolean('${recipient.consultBplcUniqueId != null && !recipient.consultBplcUniqueId.isEmpty()}'),
                '${prevPath}'
            )
		}

		async function handleInProgressThingNotExist() {
			const isSimpleTest = '${prevPath}' == 'simple_test';
			const isLongtermConfirmed = '${recipient.longtermConfirmYn != null && recipient.longtermConfirmYn.equals("Y")}' === 'true';
			if (isSimpleTest && isLongtermConfirmed && !await willConsltForLnoUpdate()) {
                backToPrevPath(['subMain', 'service']);
				return;
			}
			
			location.href='/matching/membership/conslt/regionOrAutoAssignBplc?' + createQs();
		}

		async function willConsltForLnoUpdate() {
			const result = await showConfirmPopup(
				'요양인정번호 갱신이 필요하신가요?',
				'어르신은 이미 요양인정번호를 가지고 계세요. 요양인정번호 갱신이 필요한 경우에만 상담받으세요.',
				'상담하기'
			);
			return result === 'confirm';
		}

		function createQs() {
			const qsMap = new JsCommon().fn_queryString_toMap()

			qsMap['tel'] = $('#spanTel').attr('value');
			qsMap['over65Yn'] = $('#spanOver65').attr('value');
			qsMap['recipientsNo'] = '${recipient.recipientsNo}';

			return new JsCommon().fn_queryString_fromMap(qsMap);
		}

		$(function() {
			function initTel(){
				const tel = qsMap['tel'] || '${recipient.tel}' || '${mbrVO.mblTelno}';

				$('#spanTel').attr('value', tel);
				$('#spanTel').text(tel || '없음');
			}

			function initOver65(){
				const over65Yn = qsMap['over65Yn'] || '${recipient.over65Yn}' || 'Y';

				$('#spanOver65').attr('value', over65Yn);
				const _over65Txt = {"Y" : '${over65YnMap["Y"]}', "N" : '${over65YnMap["N"]}'};
				$('#spanOver65').text(_over65Txt[over65Yn]);
			}
			
			const qsMap = new JsCommon().fn_queryString_toMap();
			initTel();
			initOver65();
		});
	</script>