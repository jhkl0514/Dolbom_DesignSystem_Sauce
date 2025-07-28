<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="modal_terms_agree" class="modal bottom-sheet">
    <div class="modal_header">
        <h4 class="modal_title">상담을 위해 동의가 필요해요</h4>
        <div class="close_x modal-close waves-effect"></div>
    </div>

    <div class="modal-content">
        <div class="color_t_s font_sbmr">연결된 장기요양기관에서 준비할 서류부터 신청 방법을 안내 드려요.</div>
        <div class="h20"></div>
        <div class="group_chk_area">
            <span class="icon_btn i_right waves-effect modal-trigger" data-target="modal_third_party_offer"></span>
            <div>
                <input type="checkbox" name="" id="chk_j01" class="chk01_2 large evt_chk" checked onchange="handleAgreeCheckboxClick()">
                <label for="chk_j01">[필수] 개인정보 3자제공 동의(상담신청)</label>
            </div>
        </div>
        <div class="h32"></div>
    </div>

    <div class="modal-footer">
        <div class="btn_area d-flex">
            <a class="modal-close waves-effect btn btn-large w100p btn_primary evt_btn" onclick="handleAgreeBtnClick()">동의하기</a>
        </div>
    </div>
</div>

<script>
    function handleAgreeCheckboxClick() {
        const $agreeBtn = $('.evt_btn');
        if ($('#chk_j01').is(':checked')) {
            $agreeBtn.addClass('btn_primary');
            $agreeBtn.removeClass('btn_disable');
        } else {
            $agreeBtn.addClass('btn_disable');
            $agreeBtn.removeClass('btn_primary');
        }
    }
</script>