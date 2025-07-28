<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<div class="wrapper">
    <jsp:include page="/WEB-INF/jsp/app/matching/common/topButton.jsp">
        <jsp:param value="비밀번호 재확인" name="addTitle" />
    </jsp:include>

    <main>
        <section class="intro">
            <h3 class="title">
                안전한 탈퇴를 위해<br>
                비밀번호를 다시 한 번 입력해주세요
            </h3>

            <div class="h40"></div>

            <form action="">
                <label for="idInput" class="input_label">아이디</label>
                <input placeholder="아이디를 입력해주세요." id="idInput" type="text" class="input_basic" value="${mbrId}" disabled>

                <div class="h32"></div>

                <label for="passwordInput" class="input_label">비밀번호</label>
                <input id="passwordInput" type="password" class="input_basic" value="">
                <div id="requestPasswordMessage" class="vaild_txt error disNone">비밀번호를 입력해주세요</div>
            </form>

            <div class="h40"></div>
        </section>
    </main>

    <footer class="page-footer">
        <div class="relative">
            <a class="waves-effect btn-large btn_primary w100p" onclick="handleConfirmBtnClick()">확인</a>
        </div>
    </footer>
</div>

<script src="/html/core/vendor/rsa/RSA.min.js"></script>

<script>
    function handleConfirmBtnClick() {
        const $passwordInput = $("#passwordInput");
        const $requestPasswordMessage = $("#requestPasswordMessage");
        
        if (!$passwordInput.val()) {
            $passwordInput.addClass('bder_danger');
            $requestPasswordMessage.removeClass('disNone');
            return;
        }

        const rsaPublicKeyModulus = '${publicKeyModulus}';
        const rsaPublicKeyExponent = '${publicKeyExponent}';

        const mbrId = $('#idInput').val();
        const mbrPw = $('#passwordInput').val();
        const encPw = f_rsa_enc(mbrPw, rsaPublicKeyModulus, rsaPublicKeyExponent);

        const url = '/matching/membership/loginWhdwlAction';
        const data = {mbrId, encPw};
        const successCallback = function (result) {
            location.href = '/matching/membership/info/whdwlAction';
        };
        callPostAjaxIfFailOnlyMsg(url, data, successCallback);
    }

    function f_rsa_enc(v, rpkm, rpke) {
        let rsa = new RSAKey();
        rsa.setPublic(rpkm,rpke);
        return rsa.encrypt(v);
    }
</script>