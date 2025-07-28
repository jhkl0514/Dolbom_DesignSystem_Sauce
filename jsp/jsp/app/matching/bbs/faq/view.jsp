<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/html/core/script/ckeditor5-online-builder/sample/ckview.css?v=<spring:eval expression="@version['assets.version']"/>"/>

<div class="wrapper">
	
    <!-- 상단 뒤로가기 버튼 추가 -->
    <jsp:include page="/WEB-INF/jsp/app/matching/common/topButton.jsp">
        <jsp:param value="" name="addButton" />
        <jsp:param value="자주 묻는 질문 상세" name="addTitle" />
    </jsp:include>

    

    <main>
        <section class="default">

            <div class="color_t_s font_sbsr">${nttVO.ctgryNm}</div>
            <div class="font_sblb marT4">${nttVO.ttl}</div>

            <div class="h32"></div>

            <hr>
            
            <div class="h32"></div>
            
            <div class="content ck-content">
                ${nttVO.cn}

            </div>


        </section>
    </main>


</div>

<script>
    
</script>