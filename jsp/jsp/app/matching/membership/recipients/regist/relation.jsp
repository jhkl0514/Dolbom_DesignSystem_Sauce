<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="icube.common.util.DateUtil"%>

	<div class="wrapper">
	    <!-- 상단 뒤로가기 버튼 추가 -->
		<jsp:include page="/WEB-INF/jsp/app/matching/common/topButton.jsp">
			<jsp:param value="" name="addButton" />
		</jsp:include>

		<!--http://local-on.eroum.co.kr/html/page/app/matching/assets/src/pages/F_SNR_002_eld_regi02.html-->

        <main>
            <section class="intro">

                <h3 class="title">
                    본인과의 가족관계를<br />
                    선택해주세요
                </h3>

                <div class="h32"></div>

                <div class="family_tree_area">

                    <div class="tree">
                        <div class="dept1 w50p">
                            <div class="item grandpa" code="005">
                                <span class="txt">할아버지</span>
                            </div>
                            <div class="item grandma" code="009">
                                <span class="txt">할머니</span>
                            </div>
                        </div>
                    </div>
                    <div class="tree">
                        <div class="dept1">
                            <div class="item father" code="002">
                                <span class="txt">아버지</span>
                            </div>
                            <div class="item mother" code="008">
                                <span class="txt">어머니</span>
                            </div>
                        </div>
                        <div class="dept1">
                            <div class="item p_father" code="006">
                                <span class="txt">배우자 아버지</span>
                            </div>
                            <div class="item p_mother" code="010">
                                <span class="txt">배우자 어머니</span>
                            </div>
                        </div>
                    </div>
                    <div class="tree">
                        <div class="dept1">
                            <div class="item me" code="007">
                                <span class="txt">나(본인)</span>
                            </div>
                            <div class="item partner" code="001">
                                <span class="txt">배우자</span>
                            </div>
                        </div>
                    </div>
                    <div class="tree">
                        <div class="dept2">
                            <div class="item brother" code="004">
                                <span class="txt">형제자매</span>
                            </div>
                            <div class="item child" code="003">
                                <span class="txt">자녀</span>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- family_tree_area -->





            </section>
        </main>


        <footer class="page-footer">

            <div class="relative">
                <a class="waves-effect btn-large btn_primary w100p btnEvt_me btn_disable btn next" onclick="fn_next_click($(this))">다음</a>
            </div>

        </footer>

	</div>
	<!-- wrapper -->
	
	
	<script>
        var m_redirectUrl;
        
        var _relationCd;
        var _relationNm;
		function fn_next_click(jobjTarget){
            if (jobjTarget.hasClass('btn_disable')){
                return;
            }

            var jobj = $(".item.active");
            if (jobj == undefined || jobj.length < 1){
                showAlertPopup("관계를 선택하여 주십시오");
                return;
            }

            _relationCd = jobj.attr('code');
            _relationNm = $(".item.active .txt").html();


            var url = 'check';

            callPostAjaxIfFailOnlyMsg(url, {"relationCd":_relationCd, "mbrUniqueId":"${mbrVO.getUniqueId()}"}, fn_next_cb);
		}

        async function fn_next_cb(result){
            if (result == null || result.success == undefined || !result.success){
                if (result.msg != undefined && result.msg.length > 0){
                    showAlertPopup(result.msg);
                }else{
                    showAlertPopup("어르신을 등록할 수 없습니다.");
                }
                
                return;
            }
            var jsCommon = new JsCommon();
            var qsMap = jsCommon.fn_queryString_toMap();

            if (qsMap["startStep"] == undefined || qsMap["startStep"].length < 1){
                qsMap["startStep"] = "relation";
            }
            
            qsMap['relationCd'] = _relationCd;
            m_redirectUrl = fn_convert_redirectUrl();

            if (_relationCd == '007'){
                const asyncConfirm2 = await showConfirmPopup('', '본인의 정보로 어르신이 등록돼요.', '확인');
                if (asyncConfirm2 != 'confirm'){
                    return;
                }
                
                qsMap['gender'] = "${ mbrVO.getGender() }";
                qsMap['recipientsNm'] = "${ mbrVO.getMbrNm() }";
                qsMap['brdt'] = '${ DateUtil.formatDate(mbrVO.getBrdt(), "yyyyMMdd") }';
                // qsMap['mainYn'] = "Y";
                
            }else{/*로직이 변경됨 관계만 선택하고 바로 저장으로 변경*/
                if (result.gender != undefined){
                    qsMap["gender"] = result.gender;
                }
                qsMap['recipientsNm'] = _relationNm;
                
                // var url = './name?' + jsCommon.fn_queryString_fromMap(qsMap);
                // location.href = url;
            }
			
            var url = "./regist.json";

            callPostAjaxIfFailOnlyMsg(url, qsMap, fn_regist_cb);
        }

        function fn_regist_cb(result){
            var jsCommon = new JsCommon();
            var param;
            var qsMap;

            if (m_redirectUrl.indexOf("?") >= 0){
                param = m_redirectUrl.substring(m_redirectUrl.indexOf("?") + 1);

                m_redirectUrl = m_redirectUrl.substr(0, m_redirectUrl.indexOf("?"));
                qsMap = jsCommon.fn_queryString_toMap(param);
            }else{
                qsMap = {};
            }

            if (result && result.recipientsNo){
                qsMap["recipientsNo"] = result.recipientsNo;
            }

            m_redirectUrl += "?" + jsCommon.fn_queryString_fromMap(qsMap);

            location.href = "/matching/common/complete?msg=" + encodeURIComponent("어르신이<br>등록되었어요")+"&redirectUrl="+encodeURIComponent(m_redirectUrl);
        }

        function fn_convert_redirectUrl(){
            var jsCommon = new JsCommon();
            var redirectUrlAct = '', redirectUrlOrigin = jsCommon.fn_redirect_url();

            while(true){
                try{
                    redirectUrlAct = decodeURIComponent(redirectUrlOrigin);
                    if (redirectUrlOrigin == redirectUrlAct){
                        break;
                    }else{
                        redirectUrlOrigin = redirectUrlAct;
                    }
                }catch{
                    redirectUrlAct = redirectUrlOrigin;
                    break;
                }
            }

            redirectUrlAct = redirectUrlAct.replaceAll("&amp;", "&")
            return redirectUrlAct;
        }

	</script>