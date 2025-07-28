<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="icube.manage.dto.dolbom.shop.ShopOrderMasterUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문요청내역</title>
    <style>
    </style>

    <script>
    </script>
</head>

<body class="back_gray">
    <div class="wrapper">
        <jsp:include page="/WEB-INF/jsp/app/matching/common/topButton.jsp">
            <jsp:param value="주문요청내역" name="addTitle" />
        </jsp:include>
        
        <main>
            <section class="default noPad">
        	<c:forEach var="list" items="${list}" varStatus="status">
                <div class="h12 back_F5F5F5"></div>
                <div class="order_detail_date">
                    <span class="font_sblb"><fmt:formatDate value="${list.regDt}" pattern="yyyy.MM.dd" /></span>
                    <a class="flex_center gap04 padH8W16">
                        <span class="color_t_s font_sbss" onclick="location.href='/matching/shop/order/detail?ordMCd=${list.ordMCd}';">주문상세</span>
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16" fill="none">
                            <path fill-rule="evenodd" clip-rule="evenodd" d="M5.64645 3.64645C5.84171 3.45118 6.15829 3.45118 6.35355 3.64645L10.3536 7.64645C10.5488 7.84171 10.5488 8.15829 10.3536 8.35355L6.35355 12.3536C6.15829 12.5488 5.84171 12.5488 5.64645 12.3536C5.45118 12.1583 5.45118 11.8417 5.64645 11.6464L9.29289 8L5.64645 4.35355C5.45118 4.15829 5.45118 3.84171 5.64645 3.64645Z" fill="#333333"/>
                        </svg>
                    </a>
                </div>
                <!-- order_detail_date -->
                <div class="padH24W20 back_white">
                    <c:choose>
                    	<c:when test="${list.bplcNm ne '' and ShopOrderMasterUtil.isVisibleAssignedBplc(list)}">
                    		<div class="font_sblb">${list.bplcNm}</div>
                    	</c:when>
                    	<c:otherwise>
                    		<div class="color_t_t font_sblb">어르신 장기요양기관</div>
                    	</c:otherwise>
                    </c:choose>
                    <c:forEach var="item" items="${list.shopOrderItemList}">
                    <div class="h16"></div>
                    <div class="box_order_list">
                    	<c:choose>
                    		<c:when test="${item.ordStatusCd eq 'DBO810' || item.ordStatusCd eq 'DBO820' || item.ordStatusCd eq 'DBO830'}">
		                        <div class="color_t_danger font_sbmb marB8"><c:out value="${orderStatusMap[item.ordStatusCd]}"/></div>
                    		</c:when>
                    		<c:otherwise>
		                        <div class="font_sbmb marB8"><c:out value="${orderStatusMap[item.ordStatusCd]}"/></div>
                    		</c:otherwise>
                    	</c:choose>
                        <div class="order_list_db">
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
                                <li class="font_sbss">${item.longtermCategoryName}</li>
                                <li class="color_t_s font_ssr marT2">${item.itName}</li>
                                <li class="breadcrumb_area marB2">
                                	<c:if test="${not empty item.ioId && item.ioId ne ''}">
									    <c:set var="ioId" value="${item.ioId}" />
									    
									    <c:if test="${not empty item.optionsList}">
											<c:set var="size" value="" />
											<c:set var="color" value="" />
											
											<c:forEach var="option" items="${item.optionsList}">
								                <c:choose>
								                    <c:when test="${option.title == '색상'}">
								                        <c:set var="color" value="${option.value}" />
								                    </c:when>
								                    <c:when test="${option.title == '사이즈'}">
								                        <c:set var="size" value="${option.value}" />
								                    </c:when>
								                </c:choose>
								            </c:forEach>
										</c:if>
										<c:choose>
											<c:when test="${not empty size and not empty color}">
												<span class="color_t_s font_ssr">${size}</span>
												<span class="color_t_s font_ssr">${color}</span>
											</c:when>
											<c:when test="${not empty size}">
												<span class="color_t_s font_ssr">${size}</span>
											</c:when>
											<c:when test="${not empty color}">
												<span class="color_t_s font_ssr">${color}</span>
											</c:when>
											<c:otherwise>
											</c:otherwise>
										</c:choose>
									</c:if>
                                    <span class="color_t_s font_ssr">${item.ordQuantity}개</span>
                                </li>
                                <li class="d-flex gap04">
                                    <span class="font_sbss">예상금액</span>
                                    <span class="font_sbsb"><fmt:formatNumber value="${item.ordSelfPrice}" type="number" pattern="#,###"/>원</span>
                                </li>
                            </ul>
                        </div>
                    </div>
                    </c:forEach>
                    <!-- box_order_list -->
                </div>

            </c:forEach>
            </section>
        </main>

    </div>
    <!-- wrapper -->
</body>