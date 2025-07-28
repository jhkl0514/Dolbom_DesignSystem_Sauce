<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="wrapper">
    <jsp:include page="/WEB-INF/jsp/app/matching/common/topButton.jsp">
        <jsp:param value="장기요양기관 연결" name="addTitle" />
    </jsp:include>

    <main>
        <section class="intro">
            <h3 class="title">
                가까운 장기요양기관으로<br>
                연결해 드릴게요
            </h3>
            <div class="color_t_s font_sbsr marT8">
                최근 연결된 장기요양기관의 지역과 상담신청 시 작성하신 지역이 일치하지 않아서, 가까운 장기요양기관으로 연결해 드릴게요.
            </div>
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
        </section>
    </main>

    <footer class="page-footer">
        <div class="relative">
            <a class="waves-effect btn-large btn_primary modal-trigger" href="#modal_terms_agree">다음</a>
        </div>
    </footer>
</div>

<jsp:include page="termsAgreeModal.jsp" />
<jsp:include page="addMbrConslt.jsp" />
<jsp:include page="thirdPartyOfferModal.jsp" />
<script src="/html/core/script/hangjungdong2407.js?v=<spring:eval expression="@version['assets.version']"/>" type="text/javascript" ></script>

<script>
    function handleAgreeBtnClick() {
        const qsMap = (new JsCommon()).fn_queryString_toMap();
        const recipientsNo = qsMap.recipientsNo;
        const prevPath = qsMap.prevPath;
        const tel = qsMap.tel;
        const over65Yn = qsMap.over65Yn;
        const sidoText = decodeURIComponent(qsMap.sidoText) == 'undefined' ? '${autoAssignBplc.recipient.sido}' : decodeURIComponent(qsMap.sidoText);
        const sigugunText = decodeURIComponent(qsMap.sigugunText) == 'undefined' ? '${autoAssignBplc.recipient.sigugun}' : decodeURIComponent(qsMap.sigugunText);
        var zip = qsMap.zip;
        var lat = qsMap.lat;
        var lot = qsMap.lot;
        if (!zip || !lat || !lot) {
            const hangjungdong = findHangjungdong(sidoText, sigugunText);
            if (hangjungdong) {
                zip = hangjungdong.code;
                lat = hangjungdong.latitude;
                lot = hangjungdong.longitude;
            }
        }
        
        addMbrConslt({
            prevPath,
            recipientsNo: Number(recipientsNo),
            tel,
            over65Yn,
            sido: sidoText,
            sigugun: sigugunText,
            zip: zip,
            lat: lat,
            lot: lot,
        });
    }
</script>
