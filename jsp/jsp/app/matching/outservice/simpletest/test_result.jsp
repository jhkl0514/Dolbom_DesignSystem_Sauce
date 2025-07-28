<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <c:if test="${source == 'eroumcare'}">
        <link rel="stylesheet" href="${requestDomain}/html/page/admin/assets/style/new_modal.css?v=<spring:eval expression="@version['assets.version']"/>"/>
    </c:if>

    <div class="eroumon ${cssAddClass} modal_contents">
        <div class="modal_top">
            <h3>인정등급상담 간편</h3>
            <p>
                상담받을 연락처
                <strong>${mbrTelno}</strong>
            </p>
        </div>
        <div class="modal_con">
            <p>상담정보</p>
            <p>인정등급 간편 테스트 결과</p>
            <p>
                ※ 실제 등급 판정 결과와 상이할 수 있으니 참고용으로만
                사용바랍니다.
            </p>
            <p>※ 65세 이상이거나 치매 진단을 받은 어르신입니다.</p>
        </div>
        <div class="careTest_img_g">
            <div class="imgWrap">
                <img src="${requestDomain}/html/page/admin/assets/images/gauge_img${simpleTestVO.getGrade()}.svg"
                alt="장기요양보험 <c:if test="${simpleTestVO.getGrade() == 1}">비</c:if>대상자 이미지"
                >
            </div>
        </div>
    </div>