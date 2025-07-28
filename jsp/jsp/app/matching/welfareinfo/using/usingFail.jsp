<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="wrapper">
	
    <!-- 상단 뒤로가기 버튼 추가 -->
    <jsp:include page="/WEB-INF/jsp/app/matching/common/topButton.jsp">
        <jsp:param value="" name="addButton" />
        <jsp:param value="놓친 복지용구 받기" name="addTitle" />
        <jsp:param value="true" name="addHome" /> 
    </jsp:include>

    <main>
        <section class="relative default noPad">
            <div class="back_F5F5F5 padH24W20">
                <div class="card radius08 modal-trigger">
                    <div class="card-content pad_24_20_20">
                        <div class="font_sbsr">남은 장기요양급여</div>
                        <div class="color_t_t font_shm marT2">${failReason}</div>
                        <div class="h20"></div>
                        <a class="waves-effect btn btn-middle btn_default w100p align_center gap08" onclick='handleMoveBtnClick()'>
                            <span class="color_tp_s font_sbss">${failReason == "조회 실패" ? "자주 묻는 질문 이동" : "인정등급 재발급 신청"}</span>
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16" fill="none">
                                <path fill-rule="evenodd" clip-rule="evenodd"
                                      d="M5.52864 3.52827C5.78899 3.26792 6.2111 3.26792 6.47145 3.52827L10.4714 7.52827C10.7318 7.78862 10.7318 8.21073 10.4714 8.47108L6.47145 12.4711C6.2111 12.7314 5.78899 12.7314 5.52864 12.4711C5.26829 12.2107 5.26829 11.7886 5.52864 11.5283L9.05723 7.99967L5.52864 4.47108C5.26829 4.21073 5.26829 3.78862 5.52864 3.52827Z"
                                      fill="#333333" />
                            </svg>
                        </a>
                    </div>
                </div>
            </div>
            <div class="center">
                <div class="h40"></div>
                <div class="h32"></div>
                <div class="center">
                    <img src="/html/page/app/matching/assets/src/images/08etc/icon_no_docu.svg" alt="복지용구 없음">
                    <div class="h16"></div>
                    <div class="color_t_s font_sbsr">받을 수 있는 복지용구가 없어요</div>
                </div>
                <div class="h32"></div>
                <div class="h40"></div>
            </div>

            <div class="h12 back_F7F7F7"></div>

            <div class="pad_24_20_20">
                <div class="font_sblb">유의사항</div>
                <div class="h16"></div>
                <ul class="list_dept1 gray_dot">
                    <li class="color_t_s font_sbsr">장기요양정보 조회 시점에 따라 정보가 다를 수 있어요. </li>
                </ul>
                <div class="h20"></div>
            </div>
        </section>
    </main>

    <footer class="page-footer">

    </footer>

    
</div>

<script>
    function handleMoveBtnClick() {
        if ("${failReason}" === "조회 실패") {
            location.href = "/matching/bbs/faq/list";
        } else {
            location.href = "/matching/simpletest/simple/intro?recipientsNo=${param.recipientsNo}";
        }
    }
</script>
