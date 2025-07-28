<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<div class="wrapper">
	    <!-- 상단 뒤로가기 버튼 추가 -->
		<jsp:include page="/WEB-INF/jsp/app/matching/common/topButton.jsp">
			<jsp:param value="" name="addButton" />
		</jsp:include>

		<!--http://local-on.eroum.co.kr/html/page/app/matching/assets/src/pages/F_SNR_002_eld_regi03.html-->

        <main>
            <section class="intro">
				<c:set var="deptClass" value="dept1" />
				<c:if test="${imgClass eq 'brother' || imgClass eq 'child'}">
					<c:set var="deptClass" value="dept2" />
				</c:if>
				
                <div class="family_sel ${deptClass}">
                    <div class="item ${imgClass} active">
                        <span class="txt">${relationNm}</span>
                    </div>
                    <div>
                        <!-- <span class="color_tp_p font_shs">꽃분이</span><span class="color_t_p font_sblr">님,</span> -->
                    </div>
                </div>

                <div class="h24"></div>

                <h3 class="title">
                    어르신의 이름을<br />
                    입력해주세요
                </h3>

                <div class="h32"></div>

                <input type="text" class="input_basic name keycontrol hangul filled_enabled" targetFilledEnabled=".btn.next" value="${recipientsNm}" ${disabled}>
                <div class="vaild_txt disNone error name">이름을 입력해 주세요.</div>

            </section> 
        </main>

		<footer class="page-footer">

            <div class="relative">
                <a class="waves-effect btn-large btn_primary w100p btn_disable btn next" onclick="fn_next_click()">다음</a>
            </div>

        </footer>

	</div>
	<!-- wrapper -->
	
	
	<script>

        var _jsCommon;
        $(function () {
            _jsCommon = new JsCommon();
            _jsCommon.fn_keycontrol();
        });
        function fn_next_click(){
            var jobjInput = $('input[type="text"].name');
            var jobjVali = $('div.vaild_txt.name');

            if (jobjInput.val().length < 2){
                jobjInput.addClass("bder_danger");
                jobjVali.removeClass("disNone");
                return;
            }

            jobjInput.removeClass("bder_danger");
            jobjVali.addClass("disNone");

            var jsCommon = new JsCommon();
            var qsMap = jsCommon.fn_queryString_toMap();

            qsMap['recipientsNm'] = jobjInput.val();
            qsMap['mbrUniqueId'] = "${mbrUniqueId}";
            
            var url = './check';
            callPostAjaxIfFailOnlyMsg(url, qsMap, fn_result_cb);
        }
        
		function fn_result_cb(result){
			var url;
            
            var jobjInput = $('input[type="text"].name');


            var jsCommon = new JsCommon();
            var qsMap = jsCommon.fn_queryString_toMap();

            if (qsMap['gender'] == undefined){
                url = './gender';
            }else{
                url = './birth';
            }
            
            qsMap['recipientsNm'] = jobjInput.val();

			location.href = url + '?' + jsCommon.fn_queryString_fromMap(qsMap);
		}


	</script>