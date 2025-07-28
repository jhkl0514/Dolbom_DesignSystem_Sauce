<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    <div class="wrapper">

		<!-- 상단 뒤로가기 버튼 추가 -->
		<jsp:include page="/WEB-INF/jsp/app/matching/common/topButton.jsp" />


        <main>
            <section class="intro">

                <h3 class="title">도움을 드릴 수 있어 뿌듯해요</h3>

                <div class="h10"></div>
                
                <div class="color_t_s font_sbmr">아시는 분들도 도움을 받도록 공유 해주세요</div>

                <div class="h64"></div>

                <div class="center">
                    <img src="/html/page/app/matching/assets/src/images/09people/pp_02.svg" alt="공유">
                </div>

            </section>
        </main>


        <footer class="page-footer">

            <div class="relative">
                <a class="waves-effect btn-large btn_primary w100p modal-trigger" href="#modal_share">추천하기</a>
            </div>

        </footer>

    </div>
    <!-- wrapper -->


	<!-- 추천하기 모달 -->
	<jsp:include page="/WEB-INF/jsp/app/matching/main/share/bottomSheet.jsp">
		<jsp:param value="추천하기" name="title" />
	</jsp:include>
	
