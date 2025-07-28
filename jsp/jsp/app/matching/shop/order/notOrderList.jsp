<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <div class="wrapper align_center">
        <jsp:include page="/WEB-INF/jsp/app/matching/common/topButton.jsp">
            <jsp:param value="주문요청내역" name="addTitle" />
        </jsp:include>

        <div class="center">
            <img src="/html/page/app/matching/assets/src/images/08etc/order_default.svg" class="w120" alt="주문요청내역이 없어요">
            <div class="h12"></div>
            <div class="font_sblb">
                주문요청내역이 없어요
            </div>
            <div class="h04"></div>
            <p class="color_t_s font_sbmr">
                놓치고 있는 복지용구를 바로 신청하세요
            </p>
            <div class="h32"></div>
            
            <a class="waves-effect btn btn-middle btn_primary w180" onclick="location.href='/matching/welfareinfo/using/view?mbrUniqueId=${mbrUniqueId}&recipientsNo=${recipientsNo}';">놓친 복지용구 받기</a>
        </div>

    </div>
    <!-- wrapper -->
</body>