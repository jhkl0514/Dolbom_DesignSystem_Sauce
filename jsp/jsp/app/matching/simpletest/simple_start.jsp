<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="wrapper">
	
    <!-- 상단 뒤로가기 버튼 추가 -->
    <jsp:include page="/WEB-INF/jsp/app/matching/common/topButton.jsp">
        <jsp:param value="간편테스트" name="addTitle" />
    </jsp:include>

    <main>
        <section class="intro">

            <h2 class="font_h2">
                인정등급<br>
                간편 테스트
            </h2>

            <div class="h32"></div>

            <div class="center">
                <img src="/html/page/app/matching/assets/src/images/11easy/easy_01.svg" alt="인정등급 간편테스트">
            </div>

            <div class="h32"></div>

            <p class="color_t_s font_scx">
                ※ 보건복지부에서 고시한 장기 요양 등급 판정 기준을 근거로 만들어진 테스트로, 실제 판정 결과와 상이할 수 있어요
            </p>


        </section>
    </main>
    
    <footer class="page-footer">

        <div class="relative">
            <a class="waves-effect btn-large btn_primary w100p btn next">시작하기</a>
        </div>

    </footer>

</div>
<script>
    $(function() {
        
        $(".btn.next").off('click').on('click', function(){
            fn_move_test();
        });
    });

    async function fn_move_test(){
        var bLogin = false;
        if ("${_matMbrSession.loginCheck}" != "true"){
            bLogin = true;
            const asyncConfirm2 = await showConfirmPopup('로그인해주세요', '어르신 돌봄을 진행하실려면 로그인이 필요해요.', '로그인하기');
            if (asyncConfirm2 != 'confirm'){
                return;
            } 

            location.href = "/matching/loginRedirect?loginReturnUrl=" + location.pathname + location.search;
            return;
        }

        var url;
        if (!bLogin){
            var recipientsNo = "${recipientsNo}";
            if (isNaN(recipientsNo) || recipientsNo == "0"){
                const asyncConfirm2 = await showConfirmPopup('어르신을 등록해 주세요', '혜택을 받으려면 정확한 어르신 정보가 필요해요.', '등록하기');
                if (asyncConfirm2 != 'confirm'){
                    return;
                }else{
                    url = '/matching/membership/recipients/regist/relation?redirectUrl=' + encodeURIComponent(location.pathname + location.search)
                }

                location.href = url;
                return;
            }
        }

        location.href = "/matching/simpletest/test/050?testTy=simple&recipientsNo=${recipientsNo}";
    }
</script>