<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문요청상세</title>
    <style>

    </style>

    <script type="text/javascript">
	    $(document).ready(function() {
	        const urlParams = new URLSearchParams(window.location.search);
	        const openModal = urlParams.get('openModal');
	        
	        if (openModal === 'true') {
	        	if('${bplc}' != '' && '${isVisibleAssignedBplc}' === 'true'){
	            	$('#modal_counPlace').modal('open');
	        	}
	
	            urlParams.delete('openModal');
	            const newUrl = window.location.pathname + '?' + urlParams.toString();
	            window.history.replaceState({}, document.title, newUrl);
	        }
	    });
	    
	    async function fn_checkCancelYn() {
	        var ordStatusCd = '${detail.ordStatusCd}';
	        
	        if (ordStatusCd == 'DBO810' || ordStatusCd == 'DBO820' || ordStatusCd == 'DBO830') {
	            showToastMsg('이미 취소된 주문입니다.');
	            return;
	        }
	        
	        if (ordStatusCd === 'DBO110' || ordStatusCd === 'DBO210') {
	            $('#modal_fullsreen_orderCancel').modal('open');
	            return;
	        } else {
	            showAlertPopup('주문취소를 원하는 경우 장기요양기관에 연락해주세요.').then(() => {
	                $('#modal_counPlace').modal('open');
	            });
	        }
	    }
	    
	    function openMemoModal(memoTxt, memoTitle) {
	        document.querySelector('#modal_orderMemo .modal_title').innerText = memoTitle;
	        document.querySelector('#modal_orderMemo .modal-content .font_sbmr').innerText = memoTxt;

	        const modal = M.Modal.getInstance(document.querySelector('#modal_orderMemo'));
	        modal.open();
	    }
		
    </script>

</head>

<body>
    <div class="wrapper">

        <jsp:include page="/WEB-INF/jsp/app/matching/common/topButton.jsp">
            <jsp:param value="주문요청상세" name="addTitle" />
            <jsp:param value="true" name="addHome" />
        </jsp:include>


        <main>
            <section class="default noPad">
                <div class="padH12W20">
                    <table class="table_basic small_2">
                        <colgroup>
                            <col style="width:120px;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th class="color_t_s font_sbmr">주문 일시</th>
                                <td class="font_sbmr"><fmt:formatDate value="${detail.regDt}" pattern="yyyy.MM.dd a hh:mm" /></td>
                            </tr>
                            <tr>
                                <th class="color_t_s font_sbmr">주문서 번호</th>
                                <td class="font_sbmr">${detail.ordMCd}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                
                <div class="h12 back_F7F7F7"></div>

                <div class="pad20">
					<c:choose>
						<c:when test="${bplc ne null and isVisibleAssignedBplc}">
							<div class="align_between_center">
		                        <div class="font_sbls">${bplc.bplcNm}</div> 
		
		                        <a class="rounded waves-effect btn btn_cancel align_center gap08 modal-trigger" href="#modal_counPlace">
		                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16" fill="none">
		                                <g clip-path="url(#clip0_7674_6560)">
		                                  <path fill-rule="evenodd" clip-rule="evenodd" d="M7.99967 2.08301C4.73199 2.08301 2.08301 4.73199 2.08301 7.99967C2.08301 11.2674 4.73199 13.9163 7.99967 13.9163C11.2674 13.9163 13.9163 11.2674 13.9163 7.99967C13.9163 4.73199 11.2674 2.08301 7.99967 2.08301ZM0.583008 7.99967C0.583008 3.90356 3.90356 0.583008 7.99967 0.583008C12.0958 0.583008 15.4163 3.90356 15.4163 7.99967C15.4163 12.0958 12.0958 15.4163 7.99967 15.4163C3.90356 15.4163 0.583008 12.0958 0.583008 7.99967ZM7.99967 7.31201C8.41389 7.31201 8.74967 7.6478 8.74967 8.06201V10.8675C8.74967 11.2817 8.41389 11.6175 7.99967 11.6175C7.58546 11.6175 7.24967 11.2817 7.24967 10.8675V8.06201C7.24967 7.6478 7.58546 7.31201 7.99967 7.31201ZM7.99967 4.50651C7.58546 4.50651 7.24967 4.8423 7.24967 5.25651C7.24967 5.67072 7.58546 6.00651 7.99967 6.00651H8.00523C8.41944 6.00651 8.75523 5.67072 8.75523 5.25651C8.75523 4.8423 8.41944 4.50651 8.00523 4.50651H7.99967Z" fill="#333333"/>
		                                </g>
		                                <defs>
		                                  <clipPath id="clip0_7674_6560">
		                                    <rect width="16" height="16" fill="white"/>
		                                  </clipPath>
		                                </defs>
		                            </svg>
		                            <span class="color_tp_s font_sbss">정보</span>
		                        </a>
		                    </div>
						</c:when>
						<c:otherwise>
							<div class="color_t_t font_sbls">어르신 장기요양기관</div>
						</c:otherwise>
					</c:choose>
                    
                    <div class="h20"></div>
                    
					<c:forEach var="item" items="${detail.shopOrderItemList}">
                    <div class="box_order_list">
                    	<c:choose>
                    		<c:when test="${item.delYn eq 'Y'}">
                    			<div class="font_sbmb marB8 color_t_danger">
		                        	주문취소
		                        </div>
                    		</c:when>
                    		<c:otherwise>
	                    		<div class="font_sbmb marB8 ${item.ordStatusCd.matches('DBO8(10|20|30)|DBO7(10|20|30|40)') ? 'color_t_danger' : ''}">
		                        	<c:out value="${orderStatusMap[item.ordStatusCd]}"/>
		                        </div>
                    		</c:otherwise>
                    	</c:choose>
                        
                        <div class="order_list_db">
                            <div class="img_area" onclick="location.href='/matching/shop/item/view?itId=${item.itId}&recipientsNo=${detail.recipientsNo}';">
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
                            	<a href="/matching/shop/item/view?itId=${item.itId}&recipientsNo=${detail.recipientsNo}">
                                	<li class="font_sbss">${item.longtermCategoryName}</li>
                                	<li class="color_t_s font_ssr marT2">${item.itName}</li>
                                </a>
                                <li class="breadcrumb_area marB2">
                                	<c:if test="${not empty item.ioId}">
	                                	<c:if test="${not empty item.optionsList}">
											<c:choose>
								                <c:when test="${fn:length(item.optionsList) >= 2}">
								                    <c:forEach var="option" items="${item.optionsList}" varStatus="status">
								                        <c:if test="${status.index == 0}">
								                            <span class="color_t_s font_ssr">${option.value}</span>
								                        </c:if>
								                        <c:if test="${status.index > 0}">
								                            <span class="color_t_s font_ssr">${option.value}</span>
								                        </c:if>
								                    </c:forEach>
								                </c:when>
								
								                <c:when test="${fn:length(item.optionsList) == 1}">
								                    <c:forEach var="option" items="${item.optionsList}">
								                        <span class="color_t_s font_ssr">${option.value}</span>
								                    </c:forEach>
								                </c:when>
								            </c:choose>
										</c:if>
                                    </c:if>
                                    <span class="color_t_s font_ssr">${item.ordQuantity}개</span>
                                </li>
                                <li class="d-flex gap04">
                                    <span class="font_sbsb"><fmt:formatNumber value="${item.ordSelfPrice}" type="number" pattern="#,###"/>원</span>
                                </li>
                            </ul>
                        </div>

                        <div class="h16"></div>
                        <c:if test='${item.ordStatusCd == "DBO810" || item.ordStatusCd == "DBO820" || item.ordStatusCd == "DBO830" || item.delYn == "Y"}'>
	                        <c:set var="memoTitle" value="취소사유" />
	                        <a class="waves-effect btn btn-middle btn_cancel w100p modal-trigger" 
	                        	href="#modal_orderMemo"
	                        	onclick="openMemoModal('${item.canclResn}', '취소사유')">
	                            <span class="color_tp_s font_sbss">취소사유</span>
	                        </a>
                        </c:if>
                        <c:if test='${item.ordStatusCd == "DBO710" || item.ordStatusCd == "DBO720" || item.ordStatusCd == "DBO730" || item.ordStatusCd == "DBO740"}'>
	                        <c:set var="memoTitle" value="반품사유" />
	                        <a class="waves-effect btn btn-middle btn_cancel w100p"
	                        	href="#modal_orderMemo"
	                        	onclick="openMemoModal('${item.canclResn}', '반품사유')">
	                            <span class="color_tp_s font_sbss">반품사유</span>
	                        </a>
                        </c:if>
                    </div>
                    <!-- box_order_list -->
                    
                    <div class="h12"></div>
					</c:forEach>
                </div>
                <!-- pad20 -->

                <div class="h12 back_F7F7F7"></div>
                <div class="padH24W20">
                    <div class="font_sblb">총 예상 본인부담금</div>
                    <div class="h20"></div>
                    <div class="align_between_center">
                        <div class="breadcrumb_area">
                            <span class="font_sbss">${detail.sumItemQuantity}개</span>
                        </div>
                        <div class="font_sblb"><fmt:formatNumber value="${sumItemOrdSelfPrice}" type="number" pattern="#,###"/>원</div>
                    </div>

                    <div class="h32"></div>
                    <ul class="list_dept1 gray_dot">
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
                                <td class="font_sbmr">${detail.mbrNm}</td>
                            </tr>
                            <tr>
                                <th class="font_sbmr">주문자 연락처</th>
                                <td class="font_sbmr">${detail.mblTelNo}</td>
                            </tr>
                            <tr>
                                <th class="font_sbmr">어르신 이름</th>
                                <c:set var="name" value="${detail.recipientsNm}" />
								<c:if test="${fn:length(detail.recipientsNm) > 10}">
								    <c:set var="name" value="${fn:substring(detail.recipientsNm, 0, 10)}..." />
								</c:if>
                                <td class="font_sbmr">${name}</td>
                            </tr>
                            <tr>
                                <th class="font_sbmr">요양인정번호</th>
                                <td class="font_sbmr">L${fn:substring(detail.rcperRcognNo, 0, fn:length(detail.rcperRcognNo) - 3)}***</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- padH24W20 -->

                <div class="h12 back_F7F7F7"></div>
                <div class="padH24W20">
                    <div class="font_sblb">배송지 정보</div>
                    <div class="h20"></div>
                    <table class="table_basic small_2">
                        <colgroup>
                            <col style="width:50%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th class="font_sbmr">받는분</th>
                                <td class="font_sbmr">${detail.deliveryName}</td>
                            </tr>
                            <tr>
                                <th class="font_sbmr">받는분 연락처</th>
                                <td class="font_sbmr">${detail.deliveryTel}</td>
                            </tr>
                            <tr>
                                <th class="font_sbmr">주소</th>
                                <td class="font_sbmr">${detail.deliveryAddr1}<br/>${detail.deliveryAddr2}</td>
                            </tr>
                            <tr>
                                <th class="font_sbmr">배송메모</th>
                                <td class="font_sbmr">${detail.deliveryMemoEtc}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- padH24W20 -->

                <div class="h12 back_F7F7F7"></div>

                <div class="pad_24_20_40">
                    <div class="font_sblb">주문 유의사항</div>
                    <div class="h16"></div>
                    <div class="font_sbss">정확한 정보는 장기요양 기관에 문의해주세요.</div>
                    <ul class="list_dept1 gray_dot marT8">
                        <li class="color_t_s font_sbsr">장기요양기관에서 검토 후, 주문 진행이 이루어져요.</li>
                        <li class="color_t_s font_sbsr">장기요양기관에 본인부담금을 지불하셔야 주문이 가능해요.</li>
                        <li class="color_t_s font_sbsr">최종결제금액 및 결제방법은 장기요양기관에서 확인해주세요.</li>
                        <li class="color_t_s font_sbsr">복지용구 주문 시점이나, 어르신의 장기요양정보에 따라 주문정보가 다를 수 있어요.</li>
                        <li class="color_t_s font_sbsr">교환/반품시, 장기요양기관에 문의해야해요.</li>
                        <li class="color_t_s font_sbsr">주문취소는 [주문접수], [주문연결중]상태에서만 가능해요. 이후에는 장기요양기관에 직접 문의하여 취소해주세요.</li>
                    </ul>
                    <ul class="list_dept1 black_dot marT8">
                        <li class="font_sbss">복지용구의 A/S는 장기요양기관에서 안내 할 책임이 있음을 알려드려요.</li>
                    </ul>

                </div>
                
                <c:if test="${detail.ordStatusCd eq 'DBO110' || detail.ordStatusCd eq 'DBO210'}">
	                <!-- pad_24_20_40 -->
	                <div class="h12 back_F7F7F7"></div>
	                <a class="waves-effect padH16W20 w100p color_t_s font_sbmr modal-trigger" onclick="fn_checkCancelYn()">주문취소</a>
				</c:if>
				
            </section>
        </main>
    </div>
    <!-- wrapper -->
	
	<%-- 주문취소 모달연결 --%>
	<jsp:include page="/WEB-INF/jsp/app/matching/shop/modal/orderCancelModal.jsp" />
	
	<%-- 사업소 정보 바텀바 연결 --%>
	<jsp:include page="/WEB-INF/jsp/app/matching/common/modal/bplcBottomModal.jsp">
	    <jsp:param name="bplcNm" value="${bplc.bplcNm}"/>
	    <jsp:param name="addr" value="${bplc.addr}"/>
	    <jsp:param name="daddr" value="${bplc.daddr}"/>
	    <jsp:param name="picTelno" value="${bplc.picTelno}"/>
	</jsp:include>
	
	<%-- 취소/반품 사유 모달연결 --%>
	<jsp:include page="/WEB-INF/jsp/app/matching/shop/modal/orderMemoModal.jsp" />
	
</body>