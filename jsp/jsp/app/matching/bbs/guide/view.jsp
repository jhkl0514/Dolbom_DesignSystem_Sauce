<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/html/core/script/ckeditor5-online-builder/sample/ckview.css?v=<spring:eval expression="@version['assets.version']"/>"/>

<div class="wrapper">
	
    <!-- 상단 뒤로가기 버튼 추가 -->
    <jsp:include page="/WEB-INF/jsp/app/matching/common/topButton.jsp">
        <jsp:param value="" name="addButton" />
        <jsp:param value="true" name="addShare" />
    </jsp:include> 

    <main>
        <section class="default">
          
            <div class="color_t_s font_ssr">${nttVO.ctgryNm}</div>

            <h3 class="title marT4">${nttVO.ttl}</h3>

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