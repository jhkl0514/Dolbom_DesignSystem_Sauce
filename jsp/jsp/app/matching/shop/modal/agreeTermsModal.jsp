<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<link rel="stylesheet" href="/html/core/vendor/swiperjs/swiper-bundle.min.css" />
<script src="/html/core/vendor/swiperjs/swiper-bundle.min.js"></script>

<style>

</style>
<script type="text/javascript">

</script>

<!-- 이용약관 Modal fullsreen -->
<div id="modal_fullsreen_terms_1" class="modal fullscreen">
    <div class="modal_header">
        <h4 class="modal_title">(필수) 개인정보 수집 및 이용동의</h4>
        <div class="close_x modal-close waves-effect"></div>
    </div>
    <div class="modal-content pad20">
        ${privacyShopTerms.contentBody}
    </div>
    <!-- modal-content -->
    <%--  <div class="modal-footer">
        <div class="btn_area d-flex">
            <a class="modal-close waves-effect btn btn-large w100p btn_primary">확인</a>
        </div>
    </div>--%>
</div>


<div id="modal_fullsreen_terms_2" class="modal fullscreen">
    <div class="modal_header">
        <h4 class="modal_title">(필수) 개인정보 제 3자 정보 제공동의</h4>
        <div class="close_x modal-close waves-effect"></div>
    </div>
    <div class="modal-content pad20">
        ${thirdPartyTerms.contentBody}
    </div>
    <!-- modal-content -->
    <%-- 
    <div class="modal-footer">
        <div class="btn_area d-flex">
            <a class="modal-close waves-effect btn btn-large w100p btn_primary">확인</a>
        </div>
    </div>--%>
</div>

<jsp:include page="/WEB-INF/jsp/app/matching/common/modal/staticResourceModal.jsp" />
<!-- fullsreen end -->