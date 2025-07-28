<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="wrapper">
	
    <!-- 상단 뒤로가기 버튼 추가 -->
    <jsp:include page="/WEB-INF/jsp/app/matching/common/topButton.jsp">
        <jsp:param value="" name="addButton" />
        <jsp:param value="관심 복지용구" name="addTitle" />
        <jsp:param value="true" name="addShare" /> 
    </jsp:include>

    <main>
        <section class="intro">


            <h2 class="title color_primary">
                관심 복지용구
            </h2>

            <h3 class="title marT4">
                신체활동이 불편하다면?<br>
                복지용구 지원받기
            </h3>

            <div class="h64"></div>

            <div class="relative">
                <dotlottie-player src="/html/page/app/matching/assets/lottie/welfareinfo_interest_intro.lottie" background="transparent" speed="1" style="width: 100%; height: auto; position: absolute;bottom: 0;" loop autoplay></dotlottie-player>
                <div style="aspect-ratio: 9/6;"></div>
            </div>
            

            <div class="box marW-20">
                <div class="img_area">
                    <img src="/html/page/app/matching/assets/src/images/08etc/money03_40_2.svg" alt="혜택">
                </div>
                <div class="ctn_area">
                    <h5 class="title">받을 수 있는 혜택 확인</h5>

                    <p class="color_t_s font_sbmr">
                        관심있는 복지용구를 장기요양금액으로 85%~100% 지원받아 이용할 수 있는 지 알려드려요.
                    </p>
                </div>

            </div>
            <!-- box -->

            <div class="box marW-20">
                <div class="img_area">
                    <img src="/html/page/app/matching/assets/src/images/08etc/tool_40.svg" alt="추천">
                </div>
                <div class="ctn_area">
                    <h5 class="title">필요한 복지용구 추천</h5>

                    <p class="color_t_s font_sbmr">
                        다양한 복지용구 상품 중 어르신 상황에 적합한 상품을 추천해드려요.
                    </p>
                </div>

            </div>
            <!-- box -->

            <div class="box marW-20">
                <div class="img_area">
                    <img src="/html/page/app/matching/assets/src/images/08etc/document_40.svg" alt="추천">
                </div>
                <div class="ctn_area">
                    <h5 class="title">간편한 구매 신청</h5>

                    <p class="color_t_s font_sbmr">
                        필요한 복지용구 상품을 간편하게 구매할 수 있도록 도와드려요.
                    </p>
                </div>

            </div>
            <!-- box -->

        </section>
    </main>

    <footer class="page-footer">

        <div class="relative">
            <a class="waves-effect btn-large btn_primary w100p btn next">복지용구 지원받기 </a>
        </div>

    </footer>

    <jsp:include page="/WEB-INF/jsp/app/matching/membership/recipients/popups/brdtUpdate.jsp" />
    
</div>

<script>
    $(function () {
        $("body").addClass("back_gray02");

        $(".btn.next").off('click').on('click', function(){
            if (false && "${recipientsNo}".length > 0 && "${recipientsNo}" != "0" && "${recipientsBrdt}".length < 2){
                fn_recipients_brdtUpdate_init("${recipientsNo}");
            } else {
                fn_next_click();
            }
        });
    });

    var _jsCommon;
    async function fn_next_click(){
        var bLogin = false;
        if ("${_matMbrSession.loginCheck}" == "false"){
            bLogin = true;
            const asyncConfirm2 = await showConfirmPopup('로그인해주세요', '관심복지용구를 등록하실려면 로그인이 필요해요.', '로그인하기');
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
        _jsCommon = new JsCommon();
        var qsMap = _jsCommon.fn_queryString_toMap();

        qsMap["recipientsNo"] = "${recipientsNo}";

        url = 'choice';
        location.href = url + "?" +_jsCommon.fn_queryString_fromMap(qsMap);
    }
</script>