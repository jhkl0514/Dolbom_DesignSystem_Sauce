<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<div class="wrapper">
    <jsp:include page="/WEB-INF/jsp/app/matching/common/topButton.jsp">
        <jsp:param value="비밀번호 재확인" name="addTitle" />
    </jsp:include>

    <main>
        <section class="intro bottom_0">
            <h3 class="title">
                안전한 탈퇴를 위해<br>
                네이버 계정 인증이 필요해요
            </h3>

            <div class="align_center" style="height: calc(100vh - 96px - 68px - 180px);">
                <img class="eld_reg_woman"  src="/html/page/app/matching/assets/src/images/09people/pp_09.svg" alt="">
            </div>
        </section>
    </main>

    <footer class="page-footer">
        <div class="relative">
            <a class="waves-effect btn-large btn_naver w100p align_center" href="/matching/naver/reAuth">
                <img class="icon_img" src="/html/page/app/matching/assets/src/images/08etc/icon_naver.svg">
                <span><span class="fw700">네이버</span><span class="fw400">로 계속하기</span></span>
            </a>
        </div>
    </footer>
</div>