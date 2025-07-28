<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품목록없음</title>
    
    <style>
    </style>
    <script>
    	var recipientsNo = '${recipientsNo}';
	    function openShopCartPop(){
	    	location.href = '/matching/shop/item/shopCartPop?recipientsNo='+recipientsNo;
	    	return false;
	    }
    </script>
</head>
<body class="back_gray">
    <div class="wrapper align_center">
        <header>
            <nav class="top">
                <a class="btn_back waves-effect" onclick="backBtnEvent()">
                    <span class="icon"></span>
                    <span class="txt">${mainCategoryNames}</span>
                </a>
                <div class="d-flex">
                    <div class="icon_area waves-effect">
                        <div class="icon_cart i_cart" onclick="openShopCartPop();">
                        	<%-- 장바구니 count --%>
                        	<c:choose>
                        		<c:when test="${cartTotalCnt == 0}"></c:when>
                        		<c:when test="${cartTotalCnt < 100}">
		                            <span class="num">${cartTotalCnt}</span>
                        		</c:when>
                        		<c:otherwise>
                        			<span class="num _99">99+</span>
                        		</c:otherwise>
                        	</c:choose>
                        </div>
                    </div>
                </div>
            </nav>
        </header>

        <div class="center">
            <img src="/html/page/app/matching/assets/src/images/08etc/cart_default.svg"
                class="w120" alt="구매 가능한 상품이 없어요">
            <div class="h12"></div>
            <p class="font_sblb">
                구매 가능한 상품이 없어요
            </p>
            <div class="h04"></div>
            <p class="color_t_s font_sbmr">
                다른 복지용구를 확인해보세요.
            </p>
            <div class="h32"></div>
            
            <a class="waves-effect btn btn-middle btn_primary w180" onclick="location.href='/matching/welfareinfo/using/view?mbrUniqueId=${mbrUniqueId}&recipientsNo=${recipientsNo}';">놓친 복지용구 받기</a>
        </div>

    </div>
    <!-- wrapper -->
</body>