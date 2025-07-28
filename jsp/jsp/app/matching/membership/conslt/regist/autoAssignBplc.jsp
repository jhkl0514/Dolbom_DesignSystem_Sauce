<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="wrapper">
    <jsp:include page="/WEB-INF/jsp/app/matching/common/topButton.jsp">
        <jsp:param value="장기요양기관 연결" name="addTitle" />
    </jsp:include>

    <main>
        <section class="intro">
            <h3 class="title">
                최근 연결된 장기요양기관으로<br>
                <c:choose>
                    <c:when test="${not empty param.prevPath}">
                        상담을 연결해 드릴게요
                    </c:when>
                    <c:otherwise>
                        주문을 연결해 드릴게요
                    </c:otherwise>
                </c:choose>
            </h3>
            <div class="h40"></div>
            <div class="color_t_s font_sbsr">최근 장기요양기관</div>
            <div class="box bder_style01 marT8">
                <div class="img_area back_EEEEEE">
                    <img src="/html/page/app/matching/assets/src/images/08etc/bp_40.svg" alt="혜택">
                </div>
                <div class="ctn_area">
                    <div class="font_sbms">${autoAssignBplc.bplc.bplcNm}</div>
                    <div class="color_t_s font_sbsr">
                        ${autoAssignBplc.addr}
                    </div>
                </div>
            </div>
            <div class="h24"></div>
            <!-- box bder_style01-->
            <div class="color_t_s font_sbsr">※ 다른 장기요양기관 연결을 원하시면 아래 버튼을 눌러주세요</div>
            <div class="h12"></div>
            <input type="checkbox" name="" id="new_connect_chk" class="chk02">
            <label for="new_connect_chk" class="color_tp_s font_sbsr" style="line-height: 28px !important">새로운 장기요양기관 연결 </label>
        </section>
    </main>

    <footer class="page-footer">
        <div class="relative">
            <a class="waves-effect btn-large btn_primary modal-trigger" onclick="handleNextBtnClick()">다음</a>
        </div>
    </footer>
</div>

<jsp:include page="termsAgreeModal.jsp" />
<jsp:include page="addMbrConslt.jsp" />
<jsp:include page="thirdPartyOfferModal.jsp" />
<script src="/html/core/script/hangjungdong2407.js?v=<spring:eval expression="@version['assets.version']"/>" type="text/javascript" ></script>

<script>
    function handleNextBtnClick() {
        $('#modal_terms_agree').modal('open');
    }

    function handleAgreeBtnClick() {
        const qsMap = new JsCommon().fn_queryString_toMap();
        const recipientsNo = qsMap.recipientsNo;
        const prevPath = qsMap.prevPath;
        const tel = qsMap.tel;
        const over65Yn = qsMap.over65Yn;
        const willAutoMatching = !$('#new_connect_chk')[0].checked;

        addMbrConslt({
            prevPath,
            recipientsNo: Number(recipientsNo),
            tel,
            over65Yn,
            ...getRegionData(qsMap),
            willAutoMatching,
            recommendedBplcUniqueId: '${autoAssignBplc.bplc.uniqueId}'
        });
    }

    function getRegionData(qsMap) {
        var sidoText = decodeURIComponent(qsMap.sidoText)
        var sigugunText = decodeURIComponent(qsMap.sigugunText)
        var zip = qsMap.zip;
        var lat = qsMap.lat;
        var lot = qsMap.lot;
        if (sidoText && sigugunText && zip && lat && lot) {
            return {
                sido: sidoText,
                sigugun: sigugunText,
                zip,
                lat,
                lot
            };
        }
        const recipientSido = '${autoAssignBplc.recipient.sido}';
        const recipientSigugun = '${autoAssignBplc.recipient.sigugun}';
        const hangjungdong = findHangjungdong(recipientSido, recipientSigugun);
        if (hangjungdong) {
            return {
                sido: recipientSido,
                sigugun: recipientSigugun,
                zip: hangjungdong.code,
                lat: hangjungdong.latitude,
                lot: hangjungdong.longitude
            };
        }
        return null;
    }
</script>
