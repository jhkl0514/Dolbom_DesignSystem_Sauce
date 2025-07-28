<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<div class="wrapper">
    <jsp:include page="/WEB-INF/jsp/app/matching/common/topButton.jsp">
        <jsp:param value="회원탈퇴" name="addTitle" />
    </jsp:include>

    <main>
        <section class="intro">

            <h3 class="title">
                탈퇴하는 이유를 알려주세요
            </h3>

            <div class="h40"></div>

            <div class="rd_area">

                <input type="radio" name="withdraw" id="chk_c01" class="chk01_2 large" data-withdrawal-reason="SERVICE">
                <label for="chk_c01">서비스가 불만족스러워요.</label>

                <div class="h08"></div>

                <input type="radio" name="withdraw" id="chk_c02" class="chk01_2 large" data-withdrawal-reason="SPEED">
                <label for="chk_c02">사이트 속도가 느려요.</label>

                <div class="h08"></div>

                <input type="radio" name="withdraw" id="chk_c03" class="chk01_2 large" data-withdrawal-reason="FRQNCY">
                <label for="chk_c03">이용 빈도가 적어요.</label>

                <div class="h08"></div>

                <input type="radio" name="withdraw" id="chk_c04" class="chk01_2 large" data-withdrawal-reason="DLVY">
                <label for="chk_c04">배송이 지연돼요.</label>

                <div class="h08"></div>

                <input type="radio" name="withdraw" id="chk_c05" class="chk01_2 large" data-withdrawal-reason="QUALITY">
                <label for="chk_c05">상품 품질이 떨어져요.</label>

                <div class="h08"></div>

                <input type="radio" name="withdraw" id="chk_c06" class="chk01_2 large evtRadio_etc" data-withdrawal-reason="ETC">
                <label for="chk_c06">기타</label>

            </div>
            <div class="h20"></div>

            <div class="evtTextarea_etc">
                <div class="relative">
                    <textarea id="reasonInput"
                              rows="3" 
                              class="input_basic textBox" 
                              required="required" 
                              placeholder="탈퇴 사유를 입력해주세요" 
                              maxlength="20" 
                              style="height:110px !important;"></textarea>
                    <div class="textLengthWrap">
                        <span class="textCount">0</span>
                        <span class="textTotal">/20</span>
                    </div>
                </div>
                <div id="reasonRequestMessage" class="vaild_txt error disNone">탈퇴 사유를 입력해주세요</div>
            </div>
            
            <div class="h40"></div>
        </section>
    </main>

    <footer class="page-footer">
        <div class="relative">
            <a id="withdrawalBtn" class="waves-effect btn-large btn_primary w100p disabled" onclick="withdrawalBtnClick()">탈퇴하기</a>
        </div>
    </footer>
</div>

<script>
    function withdrawalBtnClick() {
        if (isEtcCheckedButReasonEmpty()) {
            showErrorMessage();
            return;
        }
        const withdrawalReason = $('.rd_area input:checked').data('withdrawal-reason');
        const withdrawalEtc = $('#chk_c06').is(':checked') ? $('#reasonInput').val() : '';
        location.href = '/matching/membership/info/withdrawalAuth?withdrawalReason=' + withdrawalReason + '&withdrawalEtc=' + withdrawalEtc;
    }
    
    function isEtcCheckedButReasonEmpty() {
        const $textBox = $('.textBox');
        const $etcBtn = $('#chk_c06');
        
        return $etcBtn.is(':checked') && $textBox.val().length === 0;
    }
    
    function showErrorMessage() {
        const $textBox = $('.textBox');
        $textBox.addClass('bder_danger');

        const $reasonRequestMessage = $('#reasonRequestMessage');
        $reasonRequestMessage.removeClass('disNone');
    }
    
    function handleRadioChange() {
        const $withdrawalBtn = $('#withdrawalBtn');
        // 라디오 버튼이 체크되었는지 확인
        $('.rd_area :radio:checked').length > 0 ? $withdrawalBtn.removeClass('disabled') : $withdrawalBtn.addClass('disabled');
        // 기타 라디오 버튼 선택 시 textarea 표시
        $('.evtTextarea_etc').toggle($('.evtRadio_etc:checked').length > 0);
    }
    
    $(function () {
        // 숨김 처리 및 초기화
        const $evtTextarea = $('.evtTextarea_etc');
        const $textBox = $('.textBox');
        const $textCount = $('.textCount');
        const MAX_CHAR_COUNT = 20;
        const MAX_ROWS = 2;

        $evtTextarea.hide();

        // 라디오 버튼 클릭 이벤트 처리
        $('.rd_area :radio').on('change', handleRadioChange);

        // 글자수 및 줄 제한 처리
        const updateCharCount = () => {
            const content = $textBox.val();
            const length = content.length;

            // 글자수 업데이트
            $textCount.text(length > MAX_CHAR_COUNT ? MAX_CHAR_COUNT : length);

            // 글자수 제한
            if (length > MAX_CHAR_COUNT) {
                $textBox.val(content.substring(0, MAX_CHAR_COUNT));
            }
        };

        const enforceRowLimit = () => {
            const rows = $textBox.val().split('\n');
            if (rows.length > MAX_ROWS) {
                $textBox.val(rows.slice(0, MAX_ROWS).join('\n'));
            }
        };

        $textBox.on('input propertychange keyup', updateCharCount);
        $textBox.on('keydown', enforceRowLimit);
    });

    $(window).on('pageshow', handleRadioChange);
</script>