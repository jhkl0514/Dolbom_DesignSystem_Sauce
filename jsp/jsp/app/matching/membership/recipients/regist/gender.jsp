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
                        <span class="color_tp_p font_shs">${recipientsNm}</span><span class="color_t_p font_sblr">님,</span>
                    </div>
                </div>

                <div class="h24"></div>

                <h3 class="title">
                    어르신의 성별을<br />
                    선택해주세요
                </h3>

                <div class="h40"></div>
                
                <ul class="chip_area c02 gender">

                    <li gender="M">남성</li>
                    <li gender="W">여성</li>
                </ul>

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

            $('.chip_area.c02 li').each(function(){

                $(this).click(function () {
                    //버튼 활성화 클래스변경
                    $(this).parent('.chip_area.c02').find('li').removeClass('active');
                    $(this).addClass('active');
                    $('.btn.next').removeClass('btn_disable');
                });


            });
        });
        function fn_next_click(){
			var url = './birth';

            var jsCommon = new JsCommon();
            var qsMap = jsCommon.fn_queryString_toMap();
            qsMap['recipientsNm'] = decodeURI(qsMap['recipientsNm']);
            qsMap['gender'] = $(".gender li.active").attr('gender');

			location.href = url + '?' + jsCommon.fn_queryString_fromMap(qsMap);
		}


	</script>