<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문서 작성</title>
    <script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${kakaoScriptKey}&libraries=services"></script>
    <style>
    </style>
    
    <script>
	    var selectedMessage = "배송 전 미리 연락해주세요.";
	    var messageCode = "DLVY010";
    	
        $(function(){
			backBtnEvent = function() {
				location.href = popHistoryStack(-1) || '/matching/recipients/subMain';
			}
        	
            <%-- 기본배송지 없을 때 오픈 --%>
            if('${bassDlvyYn}' === ''){
	        	$('#modal_fullsreen_shippingReg').modal('open');
            }
            
            $('.collapsible').collapsible();
            
            // 타이핑 제한
            $('.textBox').on('input propertychange keyup', function (e) {
                let content = $(this).val();
                
                // 글자수 세기
                if (content.length == 0 || content == '') {
                    $('.textCount').text('0');
                } else {
                    $('.textCount').text(content.length);
                }
                
                // 글자수 제한
                if (content.length > 20) {
                    // 20자 부터는 타이핑 되지 않도록
                    $(this).val(content.substring(0, 20));
                    $('.textCount').text('20'); // 글자수 표시를 20으로 고정
                }
            });


            //줄 제한
            $('.textBox').keydown(function(){
                var rows = $('.textBox').val().split('\n').length;
                var maxRows = 2;
                if( rows > maxRows){
                    modifiedText = $('.textBox').val().split("\n").slice(0, maxRows);
                    $('.textBox').val(modifiedText.join("\n"));
                }
            });


            $('.evt_msgTextarea').hide();

            //[직접 입력할께요] 선택시 textarea 표시
            $('.broad_area li').click(function () {
                if ($(this).hasClass('evt_orderSelfMsg')) {

                    if ($(this).hasClass('active')) {
                        $('.evt_msgTextarea').show();
                        setTimeout(function () {
                            $('.evt_msgTextarea textarea').focus(); // 포커스에 약간의 딜레이 추가
                        }, 100);
                    }
                } else {
                    // evt_orderSelfMsg가 아닌 다른 li를 클릭하면 textarea 숨김
                    $('.evt_msgTextarea').hide();
                }
            });
            
            $(".agree_chk_area :checkbox").click(function() {
            	// 약관 동의 check
                updateOrderButtonStatus();
            });
            
        });
        
        $(document).on('click', '#modal_shipping_msg .broad_area li', function() {
        	selectedMessage = $(this).text().trim();
        	messageCode = $(this).data('code');
            updateOrderButtonStatus();
        });
        
        function updateOrderButtonStatus() {
            const isTotalChecked = $("#chk_join_t").prop("checked");
            const orderButton = $('#orderStartButton');
            
			const dlvyMngNo = document.getElementById('dlvy-hiddenMngNo').value;
        	const hasDlvyMngNo = dlvyMngNo && dlvyMngNo.trim().length > 0;
        	
            const selectedMessageValid = selectedMessage && selectedMessage.trim().length > 0;
            
            let isMessageValid = false;
            
            if (messageCode === 'DLVY060') {
                const customMessage = $('.textBox').val();
                isMessageValid = customMessage && customMessage.trim().length > 0;
            } else {
                isMessageValid = selectedMessageValid;
            }
            
            if (isTotalChecked && isMessageValid && hasDlvyMngNo) {
            	orderButton.removeClass('disabled');
                orderButton.parent().attr('onclick', 'fn_OrderStart();');
            } else {
            	orderButton.addClass('disabled');
                orderButton.parent().removeAttr('onclick');
            }
        }
        
        $(document).ready(updateOrderButtonStatus);
        
        $(document).on('input', '.evt_msgTextarea textarea', function () {
            updateOrderButtonStatus();
        });
        
        /////////////////////////////////////////////////////////////////////////// 주문하기
        async function fn_OrderStart(){
        	const dlvyMngNo = document.getElementById('dlvy-hiddenMngNo').value;
        	
        	if(dlvyMngNo == null || dlvyMngNo == ''){
        		showAlertPopup('배송지 정보를 확인해주세요.');
    			return false;
        	}
        	
        	const orderItems = []; // 주문할 아이템 배열
        	
        	$('.order_list_db').each(function() {
                const itId = $(this).data('it-id');
                const itName = $(this).data('it-name');
                const itPrice = $(this).data('it-price');
                const ioNo = $(this).data('io-no');
                const ioId  = $(this).data('io-id');
                const ioQty = $(this).data('io-qty');
                const caName = $(this).data('category-name');
				
                orderItems.push({
                	itId: itId,
                	itName: itName,
                	itPrice: itPrice,
                	ioNo: ioNo,
                	ioId : ioId,
                	ioQty : ioQty,
                	caName : caName
                });
                
            });

           	const ordererName = $('td[data-orderer-name]').data('orderer-name');
    		const ordererPhone = $('td[data-orderer-phone]').data('orderer-phone');
    	    
    	    var bplcUniqueId = '${bplcVO.uniqueId}';
    	    var bplcId = '${bplcVO.bplcId}';
            var recipientsNo = ${recipientsNo};
            var orderAbleBplcYn = '${orderAbleBplcYn}';
            
            var autoMatchingYn = 'Y'; // 자동매칭 여부
            var rejectBplcUniqueId = ''; // 거절한 사업소 유니크 아이디
            
            if(bplcUniqueId === ''){
            	<%-- 기존 매칭사업소 없는 경우 --%>
            	autoMatchingYn = 'N';
            }
            
            const isChecked = $('#chk_newlink').is(':checked');
        	if(isChecked){
        		<%-- 새로운 기관 연결 체크 선택 --%>
        		autoMatchingYn = 'N';
        		rejectBplcUniqueId = bplcUniqueId;
        		
        		bplcUniqueId = '';
        		bplcId = '';
        	}
        	
        	if(orderAbleBplcYn === 'N'){
        		<%-- 복지용구 취급안하는 사업소 --%>
        		bplcUniqueId = '';
        		bplcId = '';
				autoMatchingYn = 'N';
        	}
        	
        	if(messageCode === 'DLVY060'){
        		selectedMessage = $('.textBox').val();
        	}
        	
           	var data = {
				"items" : orderItems
				, "recipientsNo" : recipientsNo
           		, "recipientsNm" : '${recipientsNm}'
           		, "bplcUniqueId" : bplcUniqueId
           		, "bplcId" : bplcId
           		, "selfBndRt" : ${selfBndRt}
           		, "longtermInfoNo" : ${longtermInfoNo}
           		, "rcperRcognNo" : "${rcperRcognNo}"
           		, "selectedMessage" : selectedMessage
           		, "messageCode" : messageCode
           		, "totalSumPrice" : ${totalSumPrice}
           		, "dlvyMngNo" : dlvyMngNo
           		, "autoMatchingYn" : autoMatchingYn
           		, "rejectBplcUniqueId" : rejectBplcUniqueId
           		, "ordererPhone" : ordererPhone
				, mustCallbackJs : true
			}
           	
           	callPostAjaxIfFailOnlyMsg(
      			'/matching/shop/order/orderStartAction.json', 
      			data,
      			function(result) {
      				if(result.success == undefined || !result.success){
      					if (result.isLogin === false) {
    		    			location.href = '/matching/kakao/login';
    		    			return false;
    		    		} else if(result.failReason === 'fullSoldOut'){
    		    			showAlertPopup2('주문이 불가능해요', '모든 상품이 품절되어, 주문이 불가능합니다. 다른 상품을 주문해주세요.').then(() => {
    		    				const history = popHistoryStack(-1);
    		    				location.href = history;
    						});
    		    			return false;
    		    		} else if(result.failReason === 'partialSoldOut'){
    		    			showAlertPopup('품절된 상품이 있어요. 상품을 다시 확인해주세요.').then(() => {
    		    				const history = popHistoryStack(-1);
    		    				location.href = history;
    						});
    		    			return false;
    		    		} else if (result.failReason === 'notToDt'){
    		      			showAlertPopup2('인정유효기간이 지났어요', '장기요양기관에 문의해주세요.');
    		    			return false;
    		      		} else if (result.failReason === 'notRemainAmt'){
    		      			showAlertPopup2('장기요양급여가 부족해요', '남은 장기요양급여가 상품의 급여가보다 부족해서 구매할 수 없어요.');
    		    			return false;
    		      		} else if (result.failReason === 'notSelfBndRt'){
    		      			showAlertPopup2('금액을 다시 불러올게요', '본인부담률이 변경되어 가격을 다시 불러 올게요.<br>최종 금액은 꼭 장기요양기관을 통해 확인해주세요.');
    		    			return false;
    		      		} else{
          					showAlertPopup('주문이 실패했습니다. 관리자에게 문의 바랍니다.');
        					return false;
    		    		}
      				} else{
      					
      					// 에어브릿지 이벤트 추가(주문요청완료)
      					fn_SendAirbridgeEventOrderComplete(orderItems, result.ordMCd, ${totalSumPriceOrigin}, recipientsNo, '${mbrUniqueId}');
      					
      					setTimeout(function() {
      						location.href = '/matching/shop/order/orderComplete?recipientsNo='+recipientsNo;
      		            }, 100);
		    			return false;
      				}
      			}
      		);
        }
        
        
    </script>
</head>
<body class="">
	<%-- 약관동의 모달연결 --%>
	<jsp:include page="/WEB-INF/jsp/app/matching/shop/modal/agreeTermsModal.jsp" />
	
	<%-- 배송지목록 모달연결 --%>
	<jsp:include page="/WEB-INF/jsp/app/matching/shop/modal/dlvyModal.jsp" />
	
    <div class="wrapper">
        <header>
            <nav class="top">
                <a class="btn_back waves-effect" onclick="backBtnEvent();">
                    <span class="icon"></span>
                    <c:set var="name" value="${recipientsNm}" />
					<c:if test="${fn:length(recipientsNm) > 10}">
					    <c:set var="name" value="${fn:substring(recipientsNm, 0, 10)}..." />
					</c:if>
                    <span class="txt">${name}님의 주문요청</span>
                </a>
                <div class="d-flex">

                </div>
            </nav>
        </header>

        <main>
            <section class="default noPad">
                <div class="padH24W20">
                    <div class="font_sblb">주문요청 상품</div>
                    
                    <c:set var="globalIndex" value="0" scope="page"/>
                    
                    <c:forEach var="categoryEntry" items="${categoryMap}">
	                    <div class="h20"></div>
	                    <div class="font_sbms">${categoryEntry.key}</div>
	                    <div class="h12"></div>
	                    <div class="box_order_list padH16W12">
	                    
	                    	<c:forEach var="item" items="${categoryEntry.value}" varStatus="status">
		                        <div class="order_list_db" data-it-id="${item.careItemVO.itId}" 
		                        					data-io-no="${item.ioNo}" 
		                        					data-io-id="<c:forEach var='option' items='${item.optionsList}' varStatus='status'>${option.value}<c:if test='${!status.last}'>|</c:if></c:forEach>" 
		                        					data-category-name="${categoryEntry.key}" data-it-name="${item.careItemVO.itName}"
		                        					data-io-qty="${item.quantity}" data-it-price="${item.careItemVO.itCustPrice}">
		                            <div class="img_area">
		                                <c:choose>
			                           		<c:when test="${not empty item.careItemVO.itImg1}">
			                           			<img src="${careHostUrl}/data/item/${item.careItemVO.itImg1}" alt="">
			                           		</c:when>
			                           		<c:otherwise>
			                           			<div class="no_Thumb_Img">
				                                    <img src="/html/page/app/matching/assets/src/images/04icon/back_trans.png" alt="thumb_img">
				                                </div>
			                           		</c:otherwise>
			                           </c:choose>
		                            </div>
		                            <ul class="od_txt">
		                                <li class="font_sbsr">${item.careItemVO.itName}</li>
		                                <li class="breadcrumb_area marB2">
			                                <c:if test="${item.ioNo ne 0}">
			                                	<c:if test="${not empty item.ioId || item.ioId ne 0}">
				                                 	<c:if test="${not empty item.optionsList}">
														<c:choose>
											                <c:when test="${fn:length(item.optionsList) >= 2}">
											                    <c:forEach var="option" items="${item.optionsList}" varStatus="status">
											                        <c:if test="${status.index == 0}">
											                            <span class="color_t_s font_ssr">옵션 : ${option.value}</span>
											                        </c:if>
											                        <c:if test="${status.index > 0}">
											                            <span class="color_t_s font_ssr">${option.value}</span>
											                        </c:if>
											                    </c:forEach>
											                </c:when>
											
											                <c:when test="${fn:length(item.optionsList) == 1}">
											                    <c:forEach var="option" items="${item.optionsList}">
											                        <span class="color_t_s font_ssr">옵션 : ${option.value}</span>
											                    </c:forEach>
											                </c:when>
											            </c:choose>
											        </c:if>
												</c:if>
			                                </c:if>
		                                    <span class="color_t_s font_ssr">${item.quantity}개</span>
		                                </li>
		                                <li class="font_sbsb"><fmt:formatNumber value="${item.sumPrice}" type="number" pattern="#,###"/>원</li>
		                            </ul>
		                        </div>
		                        <c:if test="${!status.last}">
					                <hr class="marH20">
					            </c:if>
	                        </c:forEach>
	                    </div>
	                    <!-- bder_box_01 -->
                    </c:forEach>
                </div>
                <!-- padH24W20 -->
                
                <div class="h12 back_F7F7F7"></div>
                <div class="padH24W20">
                    <div class="font_sblb">총 예상 본인부담금</div>
                    <div class="h20"></div>
                    <div class="align_between_center">
                        <div class="breadcrumb_area">
                            <span class="font_sbss">${totalQuantity}개</span>
                        </div>
                        <div class="font_sblb"><fmt:formatNumber value="${totalSumPrice}" type="number" pattern="#,###"/>원</div>
                    </div>
                    <div class="h32"></div>
                    <div class="list_noti_danger color_t_danger font_sbss">
                        필요한 상품을 한번에 주문해주세요. 주문요청시 배송완료 전까지 추가 주문이 어려워요. 
                    </div>
    
                    <ul class="list_dept1 gray_dot marT12">
                        <li class="color_t_s font_sbsr">최종 결제금액 및 결제방법은 장기요양기관을 통해 확인해주세요. </li>
                        <li class="color_t_s font_sbsr marT12">장기요양기관의 주문 검토 과정에서, 본인부담률 등 총 예상 금액이 변동 될 수 있어요.</li>
                    </ul>
                </div>
                <!-- padH24W20 -->
                <div class="h12 back_F7F7F7"></div>
                <div class="padH24W20">
                    <div class="font_sblb">주문자 정보</div>
                    <div class="h20"></div>
                    <table class="table_basic small_2">
                        <colgroup>
                            <col style="width:50%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th class="font_sbmr">주문자 이름</th>
                                <td class="font_sbmr"data-orderer-name="${mbrVO.mbrNm}">${mbrVO.mbrNm}</td>
                            </tr>
                            <tr>
                                <th class="font_sbmr">주문자 연락처</th>
                                <td class="font_sbmr" data-orderer-phone="${mbrVO.mblTelno}">${mbrVO.mblTelno}</td>
                            </tr>
                            <tr>
                                <th class="font_sbmr">어르신 이름</th>
                                <td class="font_sbmr">${recipientsNm}</td>
                            </tr>
                            <tr>
                                <th class="font_sbmr">요양인정번호</th>
                                <td class="font_sbmr">L${fn:substring(rcperRcognNo, 0, fn:length(rcperRcognNo) - 3)}***</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- padH24W20 -->
                
                <div class="h12 back_F7F7F7"></div>
                
                <c:choose>
                	<c:when test="${bassDlvyVO eq null || bassDlvyYn eq null}">
                	<div class="padH24W20">
	                    <div class="align_between_center">
	                        <div class="font_sblb">배송지 정보</div>
	                        <div id="dlvyListBtn">
	                        	<a class="waves-effect btn btn_cancel modal-trigger" href="#modal_fullsreen_shippingList" >배송지 목록</a>
	                        </div>
	                    </div>
	                    <div class="h20"></div>
	                    <div id="divyContainerByOrderForm">
	                    	<input type="hidden" id="dlvy-hiddenMngNo" name="dlvyMngNo" value="">
	                    	<div class="box_order_list padH24W20 radius16 center">
		                        <div class="color_t_s font_sbmr ">배송지를 등록해주세요.</div>
		                        <div class="h16"></div>
		                        <a class="waves-effect btn btn-middle btn_primary w120 modal-trigger" href="#modal_fullsreen_shippingReg">배송지 추가</a>
		                    </div>
	                    </div>
	                    <div id="diffDlvy" class="vaild_txt ok marT12" style="display:none;">
	                        주문자 정보와 다른 어르신이 선택되었어요.<br>
	                        변경하시려면 배송지목록을 선택해서 추가해주세요.
	                    </div>
	                </div>
                	</c:when>
                	<c:otherwise>
                	<div class="padH24W20">
	                    <div class="align_between_center">
	                        <div class="font_sblb">배송지 정보</div>
	                        <div id="dlvyListBtn">
	                        	<a class="waves-effect btn btn_cancel modal-trigger" href="#modal_fullsreen_shippingList" >배송지 목록</a>
	                        </div>
	                    </div>
	                    <div class="h20"></div>
	                    <div id="divyContainerByOrderForm">
	                    	<div class="box_order_list padH24W20 radius16">
		                        <div class="d-flex align-items-center gap08">
		                            <div class="font_sbmb" id="dlvy-name">${bassDlvyVO.dlvyNm}</div>
		                            <div id ="badge-default" class="badge_greenLight">기본 배송지</div>
		                        </div>
		                        <div class="h08"></div>
		                        <span id="dlvy-mblTelno" class="font_sbsr">${bassDlvyVO.mblTelno}</span>
		                        <p id="dlvy-addr" class="font_sbsr marT4">
		                            ${bassDlvyVO.addr}&nbsp;${bassDlvyVO.daddr}[${bassDlvyVO.zip}]
		                        </p>
		                        <input type="hidden" id="dlvy-hiddenMngNo" name="dlvyMngNo" value="${bassDlvyVO.dlvyMngNo}">
		                        <div class="h16"></div>
		                        <a class="input_basic fake_select broad_evt modal-trigger" data-code="DLVY010" href="#modal_shipping_msg">배송 전 미리 연락해주세요.</a>
		                        <div class="evt_msgTextarea">
		                            <div class="relative marT8">
		                                <textarea rows="3" class="input_basic textBox" maxlength="20" style="height:110px !important;"></textarea>
		                                <div class="textLengthWrap">
		                                    <span class="textCount">0</span>
		                                    <span class="textTotal">/20</span>
		                                </div>
		                            </div>
		                        </div>
		                    </div>
	                    </div>
	                    <c:if test="${bassDlvyVO.dlvyNm ne recipientsNm}">
		                    <div id="diffDlvy" class="vaild_txt ok marT12">
		                        주문자 정보와 다른 어르신이 선택되었어요.<br>
		                        변경하시려면 배송지목록을 선택해서 추가해주세요.
		                    </div>
	                    </c:if>
	                </div>
                	</c:otherwise>
                </c:choose>
                
                
                <!-- padH24W20 -->
                <div class="h12 back_F7F7F7"></div>
                <c:if test="${bplcVO ne null}">
               	<c:choose>
               		<c:when test="${orderAbleBplcYn eq 'Y'}">
               			<%-- 주문취급 사업소--%>
		                <div class="padH24W20">
		                    <div class="font_sblb">장기요양기관</div>
		                    <div class="h20"></div>
		                    <div class="box bder_style01 radius08">
		                        <div class="img_area back_EEEEEE">
		                            <object data="/html/page/app/matching/assets/src/images/08etc/bp_40.svg"></object>
		                        </div>
		                        <div class="ctn_area">
		                            <div class="font_sbms">${bplcVO.bplcNm}</div>
		                            <div class="color_t_s font_sbsr">
		                                ${bplcVO.addr}
		                            </div>
		                        </div>
		                    </div>
		
		                    <div class="h12"></div>
		                    <ul class="collapsible default">
		                        <li>
		                            <div class="collapsible-header">
		                                <span class="color_t_s font_sbss">새로운 장기요양기관을 원하세요?</span>
		                                <span class="arrow"></span>
		                            </div>
		                            <div class="collapsible-body color_t_s font_sbsr">
		                                다른 장기요양기관 연결을 원하시면 아래 체크박스에 체크해 주세요
		                                <div class="h12"></div>
		                                <input type="checkbox" name="" id="chk_newlink" class="chk02">
		                                <label for="chk_newlink" class="color_tp_s font_sbsr">새로운 장기요양기관 연결 </label>
		
		                            </div>
		                        </li>
		                    </ul>
		                </div>
               		</c:when>
               		<c:otherwise>
               			<%-- --주문취급하지 않을 때--%>
		                <div class="padH24W20">
		                    <div class="font_sblb">장기요양기관</div>
		                    <div class="h20"></div>
		                    <div class="box_order_list pad16 back_FAFAFA center color_t_s font_sbmr">
		                        새로운 장기요양기관으로<br>
		                        연결해드릴게요
		                    </div>
		                    <div class="h20"></div>
		                    <div class="color_tp_s font_sbsr">최근 연결된 장기요양기관은 주문을 진행하지 않아요.</div>
		                    <hr class="marH08">
		                    <div class="order_imgList">
		                        <div class="img_area bp_40"></div>
		                        <div class="color_t_s font_sbsr">${bplcVO.bplcNm} (${bplcVO.addr})</div>
		                    </div>
		                </div>
               		</c:otherwise>
               	</c:choose>
                <div class="h12 back_F7F7F7"></div>
                </c:if>
               
                
                <div class="agree_chk_area">
                <div class="padH24W20">
                    <div class="font_sblb">약관 동의가 필요해요</div>
                    <div class="h20"></div>
                    <input type="checkbox" name="" id="chk_join_t" class="chk02 large border_gray total_evt">
                    <label for="chk_join_t">주문 내용 확인 및 전체 약관 동의</label>
                    <div class="h20"></div>
                    <div class="group_chk_area">
                        <span class="icon_btn i_right waves-effect modal-trigger" data-target="modal_fullsreen_terms_1"></span>
                        <div>
                            <input type="checkbox" name="" id="chk_j01" class="chk01_2 large total_evt_sub">
                            <label for="chk_j01">(필수) 개인정보 수집 및 이용동의</label>
                        </div>
                    </div>
                    <div class="group_chk_area">
                        <span class="icon_btn i_right waves-effect modal-trigger" data-target="modal_fullsreen_terms_2"></span>
                        <div>
                            <input type="checkbox" name="" id="chk_j02" class="chk01_2 large total_evt_sub">
                            <label for="chk_j02">(필수) 개인정보 제 3자 정보 제공동의</label>
                        </div>
                    </div>
                </div>
                <div class="h80"></div>
				</div>
            </section>
        </main>


        <footer class="page-footer">
            <div class="relative" onclick="fn_OrderStart();">
                <a class="waves-effect btn-large btn_primary w100p disabled" id="orderStartButton">주문요청</a>
            </div>
        </footer>




    </div>
    <!-- wrapper -->



	<!-- Modal modal_shipping_msg -->
	<div id="modal_shipping_msg" class="modal bottom-sheet">
	
	    <div class="modal_header">
	        <h4 class="modal_title">배송메모를 선택해주세요</h4>
	        <div class="close_x modal-close waves-effect"></div>
	    </div>
	
	    <div class="modal-content">
	
	
	        <ul class="broad_area">
			    <li class="modal-close active" data-code="DLVY010">배송 전 미리 연락해주세요.</li>
			    <li class="modal-close" data-code="DLVY020">문 앞에 놓아주세요.</li>
			    <li class="modal-close" data-code="DLVY030">부재 시 연락해 주세요.</li>
			    <li class="modal-close" data-code="DLVY040">경비실에 맡겨주세요.</li>
			    <li class="modal-close" data-code="DLVY050">택배함에 놓아주세요.</li>
			    <li class="modal-close evt_orderSelfMsg" data-code="DLVY060">직접 입력할게요.</li>
			</ul>
	        <div class="h20"></div>
	
	    </div>
	
	</div>
	<!-- modal end -->
	
</body>