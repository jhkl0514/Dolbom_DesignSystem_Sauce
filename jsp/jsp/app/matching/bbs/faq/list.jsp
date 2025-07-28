<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="wrapper">
	

    <!-- 상단 뒤로가기 버튼 추가 -->
    <jsp:include page="/WEB-INF/jsp/app/matching/common/topButton.jsp">
        <jsp:param value="" name="addButton" />
        <jsp:param value="자주 묻는 질문" name="addTitle" />
    </jsp:include>


    <main>
        <section class="default bottom_0 pad020">
            <c:forEach var="resultList" items="${listVO.listObject}" varStatus="status">
                <c:set var="pageParam" value="nttNo=${resultList.nttNo}&amp;curPage=${listVO.curPage}" />
                <a href="./view?${pageParam}" class="block">
                    <div class="waves-effect list_link exp01 bder_bottom">
                        <div>
                            <div class="color_t_s font_ssr">${resultList.ctgryNm}</div>
                            <div class="font_sbms marT4">${resultList.ttl}</div>
                        </div>
                    </div>
                </a>
            </c:forEach>
            

        </section>
    </main>

</div>

<script>
    $(function () {
        

    });
</script>