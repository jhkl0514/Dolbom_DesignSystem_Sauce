<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="icube.common.util.StringUtil"%>

<style>
    /* Hide the spin buttons in WebKit browsers */
    input::-webkit-outer-spin-button,
    input::-webkit-inner-spin-button {
        -webkit-appearance: none;
        margin: 0;
    }

    /* Hide spin buttons in Firefox */
    input[type="number"] {
        -moz-appearance: textfield;
    }
</style>

<div class="wrapper">
	
    <!-- 상단 뒤로가기 버튼 추가 -->
    <jsp:include page="/WEB-INF/jsp/app/matching/common/topButton.jsp">
        <jsp:param value="" name="addButton" />
        <jsp:param value="요양인정번호 등록" name="addTitle" />
    </jsp:include>

	<main>
        <section class="intro">
            <form action="">
                <h3 class="title">
                    ${recipient.recipientsNm}님의<br>
                    <mark class="mk01">요양인정번호</mark>를 입력해주세요
                </h3>

                <div class="h12"></div>

                <div class="color_t_s font_sbmr">어르신에게 부여되는 고유번호예요.</div>

                <div class="h32"></div>

                <div class="center">
                    <img src="/html/page/app/matching/assets/src/images/20medi_care/pp_medi_care.svg" alt="요양인정번호">
                </div>

                <div class="h20"></div>

                <div class="flex_input_btn">
                    <input id="inputLno" type="text" inputmode="numeric" pattern="[0-9]*"
                           class="input_basic" maxlength="11"
                           placeholder="L 없이 숫자 10자리 입력" oninput="handleLnoInput()">
                    <a id="lnoSearchBtn" class="waves-effect btn-large btn_white btn_primary disabled" onclick="registerLno()">조회</a>
                </div>

                <div class="h40"></div>

                <div class="d-flex align-items-center gap04">
                    <img class="w20" src="/html/page/app/matching/assets/src/images/04icon/finger_right.png">
                    <div class="font_sbmb">요양인정번호 확인방법</div>
                </div>

                <div class="h12"></div>

                <div class="back_F5F5F5 pad_16_16_20 radius12">
                    <img src="/html/page/app/matching/assets/src/images/20medi_care/img_medi_care_guide.png" class="img_reset" alt="요양인정번호 확인방법">

                    <div class="h20"></div>

                    <ul class="welfase_step_area s02 no_line">
                        <li>
                            <div class="font_sbmr">
                                장기요양인정서를 준비해 주세요.
                            </div>
                        </li>
                        <li>
                            <div class="font_sbmr">
                                인정번호에서 L 뒤에 나오는 <span class="font_sbmb color_t_danger_b">숫자 10자리만 입력</span>해주세요.
                            </div>
                        </li>
                    </ul>
                </div>

                <div class="h40"></div>

                <div class="h12 marW-20 back_F7F7F7"></div>

                <div class="h40"></div>

                <div class="d-flex align-items-center gap08">
                    <img src="/html/page/app/matching/assets/src/images/18icon/valid_error02.svg">
                    <div class="font_sblb">요양인정번호가 없다면?</div>
                </div>

                <div class="h08"></div>

                <div class="color_t_s font_sbmr">
                    인정등급 테스트 후 상담을 신청하면 발급을 도와드려요.
                </div>

                <div class="h24"></div>

                <div class="list_link noti radius12 back_FFF5E6 noShadow" onclick="location.href='/matching/simpletest/simple/intro'">
                    <div class="d-flex align-items-center gap08">
                        <div>
                            <img class="w54" src="/html/page/app/matching/assets/src/images/08etc/test_80.svg">
                        </div>
                        <div>
                            <div class="font_sbms_2">인정등급 간편 테스트</div>
                            <div class="marT4 color_t_s font_ssr line_clamp_2">장기요양 혜택, 빠르게 확인하세요.</div>
                        </div>
                    </div>
                </div>

                <div class="h40"></div>

                <div class="h12 marW-20 back_F7F7F7"></div>

                <div class="h40"></div>


                <div class="font_sblb">유의사항</div>

                <div class="h16"></div>

                <ul class="list_dept1 gray_dot">
                    <li class="color_t_s font_sbsr">요양인정번호는 어르신 위임 완료 후 진행해주세요. 요양인정번호 조회 후 수정할 수 없어요.</li>
                </ul>

                <div class="h40"></div>
            </form>
        </section>
    </main>
</div>

<script>
    let registrationReleaseTime;

    function handleLnoInput() {
        const $inputLno = $('#inputLno');
        $inputLno.val(fitLnoToPattern($inputLno.val()));
        if ($inputLno.val().length === 11) {
            $('#lnoSearchBtn').removeClass('disabled');
        } else {
            $('#lnoSearchBtn').addClass('disabled');
        }
    }

    function fitLnoToPattern(lno) {
        if (!lno) return '';
        if (lno.startsWith('L')) return lno.slice(0, 1) + lno.slice(1, 11).replace(/[^0-9]/g, '');
        return 'L' + lno.slice(0, 10).replace(/[^0-9]/g, '');
    }

    const lnoPattern = /^L[0-9]{10}$/;

    function registerLno() {
        const $inputLno = $('#inputLno');
        if (!lnoPattern.test($inputLno.val())){
			showAlertPopup('요양인정번호 확인 후 다시 시도해주세요.');
			return;
		}

        if (isNotReleaseRegistration()) {
            showNotReleaseRegistrationPopup();
            return;
        }
        callPostAjaxIfFailOnlyMsg(
            '/matching/membership/recipients/longerm/check.json',
            {
                mbrUniqueId : "${recipient.mbrUniqueId}",
                recipientsNo : Number("${recipient.recipientsNo}"),
                recipientsNm : "${recipient.recipientsNm}",
                rcperRcognNo : $inputLno.val().slice(1),
                mustCallbackJs : true
            },
            handleLongtermCheckResult
        );
    }

    function isNotReleaseRegistration() {
        return registrationReleaseTime !== undefined && registrationReleaseTime > Date.now();
    }

    function showNotReleaseRegistrationPopup() {
        const minutes = getMinutesUntilRegistrationRelease();
        showAlertPopup('요양인정번호 확인 후 다시 시도해주세요. (' + minutes + '분 후 다시 시도)');
    }

    function getMinutesUntilRegistrationRelease() {
        if (registrationReleaseTime === undefined) return 0;
        const now = new Date();
        const diffInMillis = registrationReleaseTime.getTime() - now.getTime();
        return Math.floor(diffInMillis / (1000 * 60));
    }

    async function handleLongtermCheckResult(result) {
        if (result.wasTooManyTryToRegistLno === true) {
            refreshRegistrationReleaseTime(result.lastConfirmedTime);
            return;
        }
        if (hasError(result)) return;

        showToastMsg('정상적으로 조회되었어요', function() { location.href = "/matching/main/service"});
        registrationReleaseTime = null;
        $("#inputLno").attr("disabled", "disabled")
        $('#lnoSearchBtn').addClass('disabled');
    }

    function refreshRegistrationReleaseTime(lastConfirmedTime) {
        const nextRegistrationReleaseTime = new Date(lastConfirmedTime);
        nextRegistrationReleaseTime.setMinutes(nextRegistrationReleaseTime.getMinutes() + 10);
        registrationReleaseTime = nextRegistrationReleaseTime;
    }

    function hasError(result) {
        return result.msg !== undefined && result.msg.length > 0;
    }

    $(function() {
        const mustDelegateToElderly = "${recipient.verificationYn}" !== 'Y';
        if (mustDelegateToElderly) showDelegateConfirmPopup();
    });

    async function showDelegateConfirmPopup() {
        const answer = await showConfirmPopup('어르신 동의가 필요해요.', '정확한 서비스 이용을 위해 어르신의 동의가 필요해요. 어르신 위임을 진행해주세요.', '위임하기');
        if (answer === 'confirm') {
            moveToDelegateToElderly();
        } else {
            backBtnEvent();
        }
    }

    function moveToDelegateToElderly() {
        const qsMap = {
            "type": "rcperRcognNoRegist",
            "recipientsNo": "${recipient.recipientsNo}",
            "recipientsGender": "${recipient.gender}",
            "recipientsRelationCd": "${recipient.relationCd}"
        }
        location.href = "/matching/membership/info/identityRecipientMandate?" + (new JsCommon()).fn_queryString_fromMap(qsMap);
    }
</script>
