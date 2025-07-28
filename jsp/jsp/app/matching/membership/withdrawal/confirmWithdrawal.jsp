<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<div class="wrapper">
    <jsp:include page="/WEB-INF/jsp/app/matching/common/topButton.jsp">
        <jsp:param value="회원탈퇴" name="addTitle" />
    </jsp:include>

    <main>
        <section class="intro">

            <h3 class="title">
                ${mbrNm}님,<br>
                탈퇴 전 꼭 확인해주세요
            </h3>

            <div class="h40"></div>

            <div class="back_FAFAFA padH20W8">
                <ul class="list_dept1 gray_dot">
                    <li class="color_t_s font_sbsr">
                        회원탈퇴 시 이로움돌봄/이로움ON앱 및 웹 서비스를 이용하실 수 없습니다.
                        <div class="h04"></div>
                    </li>
                    <li class="color_t_s font_sbsr">
                        상담, 주문내역 등 서비스 이용 내용은 모두 삭제되며, 재가입하더라도 복구되지 않습니다.
                        <div class="h04"></div>
                    </li>
                    <li class="color_t_s font_sbsr">
                        1:1 상담이 진행 중일 경우에는 탈퇴 처리가 이루어지지 않습니다.
                        <div class="h04"></div>
                    </li>
                    <li class="color_t_s font_sbsr">
                        상품주문 및 취소/교환/반품 처리가 진행 중일 경우에는 탈퇴 처리가 이루어지지 않습니다.
                        <div class="h04"></div>
                    </li>
                    <li class="color_t_s font_sbsr">
                        보유하고 있는 마일리지/포인트/쿠폰 등은 소멸되며, 재가입하더라도 복구되지 않습니다.
                        <div class="h04"></div>
                    </li>
                    <li class="color_t_s font_sbsr">
                        자사가 제공하는 광고성 이메일 및 SMS의 경우 회원탈퇴 후 24시간 이내 중지됩니다.
                        <div class="h04"></div>
                    </li>
                    <li class="color_t_s font_sbsr">
                        회원탈퇴 시 사용하고 계신 아이디는 재사용 및 복구가 불가능합니다.
                    </li>
                </ul>
            </div>

            <div class="h40"></div>

        </section>
    </main>

    <footer class="page-footer">
        <div class="relative">
            <div class="d-flex gap08">
                <a class="waves-effect btn btn-large w100p btn_cancel" onclick="backBtnEvent()">취소</a>
                <a class="waves-effect btn btn-large w100p btn_primary" onclick="handleConfirmBtnClick()">확인</a>
            </div>
        </div>
    </footer>
</div>

<script>
    function handleConfirmBtnClick() {
        const isDeliveryExist = '${isDeliveryExist}' === 'true';
        const isInProgressOrderExist = '${isInProgressOrderExist}' === 'true';
        if (isDeliveryExist || isInProgressOrderExist){
            showAlertPopup("진행 중인 주문이 있어요. 주문상세에서 연결된 장기요양기관에 문의해주세요.");
            return;
        }

        const isInProgressConsltExist = '${isInProgressConsltExist}' === 'true';
        if (isInProgressConsltExist){
            showAlertPopup("진행 중인 상담이 있어요. 상담 완료 후 탈퇴해주세요.");
            return;
        }
        location.href = '/matching/membership/info/withdrawalReason';
    }
</script>