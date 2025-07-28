<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="wrapper">
	
    <!-- 상단 뒤로가기 버튼 추가 -->
    <jsp:include page="/WEB-INF/jsp/app/matching/common/topButton.jsp">
        <jsp:param value="" name="addButton" />
        <jsp:param value="어르신 돌봄" name="addTitle" />
    </jsp:include>



    <main>
        <section class="intro">

            <h2 class="title color_tp_pp ">
                어르신 돌봄
            </h2>
            <h3 class="title marT4">
                어르신에게 맞는<br>
                돌봄 서비스 지원받기
            </h3>

            <div class="h64"></div>

            <div class="align_center">
                <dotlottie-player src="/html/page/app/matching/assets/lottie/simpletest_care_intro.lottie" background="transparent" speed="1" style="width: 320px; height: 200px;" loop autoplay></dotlottie-player>
            </div>

            <div class="h64"></div>

            <div class="font_sblb">혼자 계시지 않도록 돌봄 신청</div>

            <div class="h08"></div>


            <p class="font_sbmr">
                돌봄이 필요한 시간을 선택하세요. 어르신에게 맞는 돌봄 서비스를 장기요양금액을 지원받고 이용할 수 있어요.
            </p>
            <div class="h40"></div>

            <div class="box_normal padH24W20 marW-20">

                <div class="font_sblb">다양한 돌봄 혜택</div>

                <div class="h20"></div>

                <div class="card bder">

                    <div class="box pad20">
                        <div class="img_area">
                            <img src="/html/page/app/matching/assets/src/images/08etc/emotion_40.svg" alt="정서케어">
                        </div>
                        <div class="ctn_area">
                            <h5 class="title">정서케어</h5>
    
                            <p class="color_t_s font_sbmr">
                                어르신들의 말벗이 되어 친구처럼, 자녀처럼 지내며 정서적 안정을 도와드려요.
                            </p>
                        </div>
                    </div>

                </div>
                <!-- card -->

                <div class="h16"> </div>

                <div class="card bder">

                    <div class="box pad20">
                        <div class="img_area">
                            <img src="/html/page/app/matching/assets/src/images/08etc/accompany_40.svg" alt="외출동행">
                        </div>
                        <div class="ctn_area">
                            <h5 class="title">외출동행(병원동행)</h5>
    
                            <p class="color_t_s font_sbmr">
                                병원 외래가 필요하시다면 스케줄에 맞춰 동행해드려요.
                            </p>
                        </div>
                    </div>

                </div>
                <!-- card -->

                <div class="h16"> </div>

                <div class="card bder">

                    <div class="box pad20">
                        <div class="img_area">
                            <img src="/html/page/app/matching/assets/src/images/08etc/bokji09_40.svg" alt="치매케어">
                        </div>
                        <div class="ctn_area">
                            <h5 class="title">치매케어</h5>
    
                            <p class="color_t_s font_sbmr">
                                국가 공인 치매 교육을 받은 요양보호사님과 치매에 대한 교육 및 케어를 진행해요.
                            </p>
                        </div>
                    </div>

                </div>
                <!-- card -->

                <div class="h20"></div>

                <div class="font_sbmr">이 외에도 신체활동, 인지활동 등 어르신 상황에 따라 받을 수 있는 혜택을 확인해보세요.</div>
                
            </div>
            <!-- box -->


        </section>
    </main>

    
		<footer class="page-footer">

            <div class="relative">
                <a class="waves-effect btn-large btn_primary w100p btn next">돌봄 지원받기</a>
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
    async function fn_next_click(){

        var bLogin = false;
        var url;
        if ("${_matMbrSession.loginCheck}" != "true"){
            bLogin = true;
            const asyncConfirm2 = await showConfirmPopup('로그인해주세요', '어르신 돌봄을 진행하실려면 로그인이 필요해요.', '로그인하기');
            if (asyncConfirm2 != 'confirm'){
                return;
            } 

            location.href = "/matching/loginRedirect?loginReturnUrl=" + location.pathname + location.search;
            return;
        }

        if (!bLogin){
            var recipientsCnt = "${recipientsCnt}";
            if (recipientsCnt == "" || parseInt(recipientsCnt) == 0){
                const asyncConfirm = await showConfirmPopup('어르신을 등록해 주세요', '혜택을 받으려면 정확한 어르신 정보가 필요해요.', '등록하기');
                if (asyncConfirm != 'confirm'){
                    return;
                }else{
                    url = '/matching/membership/recipients/regist/relation?redirectUrl=' + encodeURIComponent(location.pathname + location.search)
                }

                location.href = url;
                return;
            }
        }

        location.href = 'time' + location.search + ((location.search.indexOf("?") >= 0)? "&" :"?") + "recipientsNo=${recipientsNo}";;

    }
</script>