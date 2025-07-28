<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    <!-- bottom_sheet.js -->
    <script type="text/javascript" src="/html/page/app/matching/assets/src/js/custom/script_bottom_sheet.js" defer></script>

    <!-- bottom_sheet.js -->
    <script type="text/javascript" src="/html/page/app/matching/assets/src/js/custom/script_bottom_sheet.js" defer></script>

<div class="wrapper">
	
    <!-- 상단 뒤로가기 버튼 추가 -->
    <jsp:include page="/WEB-INF/jsp/app/matching/common/topButton.jsp" flush="true">
        <jsp:param value="" name="addButton" />
        <jsp:param value="true" name="addCustom1" />
        <jsp:param value="복지용구소개" name="addCustom1Text" />
        <jsp:param value="show-modal welInfo" name="addCustom1CssClass" />
        
    </jsp:include> 

    <main>
        <section class="intro">

            <!--a class="top_txt show-modal welInfo">복지용구 소개 [모달핸들]</a-->

            <h3 class="title">
                필요한 복지용구를<br>
                선택하세요
            </h3>

            <div class="h40"></div>

            <ul class="wel_select_area">
                
                <li id="10a0" ctgryCd="10a0" class="walkerForAdults 10a0 <c:if test='${fn:indexOf(careCtgryList,"10a0") >= 0}'>active</c:if>">
                    <div class="img_area">
                        <img src="/html/page/app/matching/assets/src/images/02tool/tool02_01.svg" alt="성인용 보행기">
                    </div>
                    <span class="txt">성인용 보행기</span>
                </li>
                <li id="2080" ctgryCd="2080" class="wheelchair 2080 <c:if test='${fn:indexOf(careCtgryList,"2080") >= 0}'>active</c:if>">
                    <div class="img_area">
                        <img src="/html/page/app/matching/assets/src/images/02tool/tool02_02.svg" alt="수동휠체어">
                    </div>
                    <span class="txt">수동휠체어</span>
                </li>
                <li id="1050" ctgryCd="1050" class="cane 1050 <c:if test='${fn:indexOf(careCtgryList,"1050") >= 0}'>active</c:if>">
                    <div class="img_area ">
                        <img src="/html/page/app/matching/assets/src/images/02tool/tool02_03.svg" alt="지팡이">
                    </div>
                    <span class="txt">지팡이</span>
                </li>

                <li id="1090" ctgryCd="1090" class="safetyHandle 1090 <c:if test='${fn:indexOf(careCtgryList,"1090") >= 0}'>active</c:if>">
                    <div class="img_area">
                        <img src="/html/page/app/matching/assets/src/images/02tool/tool02_04.svg" alt="안전손잡이">
                    </div>
                    <span class="txt">안전손잡이</span>
                </li>
                <li id="1080" ctgryCd="1080" class="antiSlipProduct 1080 <c:if test='${fn:indexOf(careCtgryList,"1080") >= 0}'>active</c:if>">
                    <div class="img_area">
                        <img src="/html/page/app/matching/assets/src/images/02tool/tool02_05.svg" alt="미끄럼방지 매트">
                    </div>
                    <span class="txt">미끄럼방지<br>매트</span>
                </li>
                <li id="1070" ctgryCd="1070" class="antiSlipSocks 1070 <c:if test='${fn:indexOf(careCtgryList,"1070") >= 0}'>active</c:if>">
                    <div class="img_area">
                        <img src="/html/page/app/matching/assets/src/images/02tool/tool02_06.svg" alt="미끄럼방지 양말">
                    </div>
                    <span class="txt">미끄럼방지<br>양말</span>
                </li>

                <li id="1010" ctgryCd="1010" class="mattress 1010 <c:if test='${fn:indexOf(careCtgryList,"1010") >= 0}'>active</c:if>">
                    <div class="img_area">
                        <img src="/html/page/app/matching/assets/src/images/02tool/tool02_07.svg" alt="욕창예방 매트리스">
                    </div>
                    <span class="txt">욕창예방<br>매트리스</span>
                </li>
                <li id="1040" ctgryCd="1040" class="cushion 1040 <c:if test='${fn:indexOf(careCtgryList,"1040") >= 0}'>active</c:if>">
                    <div class="img_area">
                        <img src="/html/page/app/matching/assets/src/images/02tool/tool02_08.svg" alt="욕창예방 방석">
                    </div>
                    <span class="txt">욕창예방 방석</span>
                </li>
                <li id="1030" ctgryCd="1030" class="changeTool 1030 <c:if test='${fn:indexOf(careCtgryList,"1030") >= 0}'>active</c:if>">
                    <div class="img_area">
                        <img src="/html/page/app/matching/assets/src/images/02tool/tool02_09.svg" alt="자세변환용구">
                    </div>
                    <span class="txt">자세변환용구</span>
                </li>

                <li id="1020" ctgryCd="1020" class="panties 1020 <c:if test='${fn:indexOf(careCtgryList,"1020") >= 0}'>active</c:if>">
                    <div class="img_area">
                        <img src="/html/page/app/matching/assets/src/images/02tool/tool02_10.svg" alt="요실금 팬티">
                    </div>
                    <span class="txt">요실금 팬티</span>
                </li>
                <li id="10b0" ctgryCd="10b0" class="bathChair 10b0 <c:if test='${fn:indexOf(careCtgryList,"10b0") >= 0}'>active</c:if>">
                    <div class="img_area">
                        <img src="/html/page/app/matching/assets/src/images/02tool/tool02_11.svg" alt="목욕의자">
                    </div>
                    <span class="txt">목욕의자</span>
                </li>
                <li id="10c0" ctgryCd="10c0" class="mobileToilet 10c0 <c:if test='${fn:indexOf(careCtgryList,"10c0") >= 0}'>active</c:if>">
                    <div class="img_area">
                        <img src="/html/page/app/matching/assets/src/images/02tool/tool02_12.svg" alt="이동변기">
                    </div>
                    <span class="txt">이동변기</span>
                </li>

                <li id="1060" ctgryCd="1060" class="portableToilet 1060 <c:if test='${fn:indexOf(careCtgryList,"1060") >= 0}'>active</c:if>">
                    <div class="img_area">
                        <img src="/html/page/app/matching/assets/src/images/02tool/tool02_13.svg" alt="간이변기">
                    </div>
                    <span class="txt">간이변기</span>
                </li>
                <li id="10d0" ctgryCd="10d0" class="inRunway 10d0 <c:if test='${fn:indexOf(careCtgryList,"10d0") >= 0}'>active</c:if>">
                    <div class="img_area">
                        <img src="/html/page/app/matching/assets/src/images/02tool/tool02_14.svg" alt="경사로">
                    </div>
                    <span class="txt">경사로</span>
                </li>
            </ul>


        </section>
    </main>

    <footer class="page-footer">

        <div class="relative">
            <a id="next_btn" class="waves-effect btn-large btn_primary w100p btn_evt btn_disable" onclick="handleNextBtnClick()"></a>
        </div>

    </footer>


</div>




    <!-- new modal-->
    <!-- 복지용구 소개 -->
    <div id="welInfo_modal" class="bottom-sheet_handle">
        <div class="sheet-overlay"></div>
        <div class="content">
            <div class="drag_handle_area drag-icon">
                <span class="drag_handle"></span>
            </div>
            <div class="modal_header">
                <h4 class="modal_title">복지용구 소개</h4>
                <div class="close_x close_modal"></div>
            </div>
            <div class="modal-content">

                <div class="">
                    <div class="box_sub01">
                        <div class="img_area">
                            <img src="/html/page/app/matching/assets/src/images/01tool/tool01_01.svg" alt="보행기">
                        </div>
                        <div class="ctn_area">
                            <div class="font_sblb">성인용 보행기</div>
    
                            <p class="color_t_s font_sbmr">
                                걸어 다니기 불편하신 경우 실내·외에서 혼자서 이동할 수 있도록 도와드려요
                            </p>
                        </div>
                    </div>
                    <!-- box_sub01 -->
    
                    <div class="box_sub01">
                        <div class="img_area">
                            <img src="/html/page/app/matching/assets/src/images/01tool/tool01_02.svg" alt="휠체어">
                        </div>
                        <div class="ctn_area">
                            <div class="font_sblb">수동휠체어</div>
    
                            <p class="color_t_s font_sbmr">
                                걸으실 수 없거나 장시간 걷기가 곤란한 경우 이동할 수 있도록 도와드려요
                            </p>
                        </div>
                    </div>
                    <!-- box_sub01 -->
    
                    <div class="box_sub01">
                        <div class="img_area">
                            <img src="/html/page/app/matching/assets/src/images/01tool/tool01_03.svg" alt="지팡이">
                        </div>
                        <div class="ctn_area">
                            <div class="font_sblb">지팡이</div>
    
                            <p class="color_t_s font_sbmr">
                                걸어 다니기 불편한 경우 이동할 수 있도록 도와드려요
                            </p>
                        </div>
                    </div>
                    <!-- box_sub01 -->
    
                    <div class="box_sub01">
                        <div class="img_area">
                            <img src="/html/page/app/matching/assets/src/images/01tool/tool01_04.svg" alt="안전손잡이">
                        </div>
                        <div class="ctn_area">
                            <div class="font_sblb">안전손잡이</div>
    
                            <p class="color_t_s font_sbmr">
                                앉거나 일어설 때 손잡이를 잡으면 안전하게 움직일 수 있어요
                            </p>
                        </div>
                    </div>
                    <!-- box_sub01 -->
    
                    <div class="box_sub01">
                        <div class="img_area">
                            <img src="/html/page/app/matching/assets/src/images/01tool/tool01_05.svg" alt="미끄럼방지 매트">
                        </div>
                        <div class="ctn_area">
                            <div class="font_sblb">미끄럼방지 매트</div>
    
                            <p class="color_t_s font_sbmr">
                                미끄러지지 않도록 하여 미끄럼 사고를 예방해요
                            </p>
                        </div>
                    </div>
                    <!-- box_sub01 -->
    
                    <div class="box_sub01">
                        <div class="img_area">
                            <img src="/html/page/app/matching/assets/src/images/01tool/tool01_06.svg" alt="미끄럼방지 양말">
                        </div>
                        <div class="ctn_area">
                            <div class="font_sblb">미끄럼방지 양말</div>
    
                            <p class="color_t_s font_sbmr">
                                실내에서 미끄러지지 않도록 도와드려요
                            </p>
                        </div>
                    </div>
                    <!-- box_sub01 -->
    
                    <div class="box_sub01">
                        <div class="img_area">
                            <img src="/html/page/app/matching/assets/src/images/01tool/tool01_07.svg" alt="욕창예방매트리스">
                        </div>
                        <div class="ctn_area">
                            <div class="font_sblb">욕창예방매트리스</div>
    
                            <p class="color_t_s font_sbmr">
                                누워서 생활하는 어르신의 욕창 예방을 위해 체중을 분산 시키고 통풍을 원활하게 해요
                            </p>
                        </div>
                    </div>
                    <!-- box_sub01 -->
    
                    <div class="box_sub01">
                        <div class="img_area">
                            <img src="/html/page/app/matching/assets/src/images/01tool/tool01_08.svg" alt="욕창예방방석">
                        </div>
                        <div class="ctn_area">
                            <div class="font_sblb">욕창예방방석</div>
    
                            <p class="color_t_s font_sbmr">
                                장시간 앉아 생활하는 어르신의 욕창 예방을 위해 체중을 분산 시키고 통풍을 원활하게 해요
                            </p>
                        </div>
                    </div>
                    <!-- box_sub01 -->
    
                    <div class="box_sub01">
                        <div class="img_area">
                            <img src="/html/page/app/matching/assets/src/images/01tool/tool01_09.svg" alt="자세변환용구">
                        </div>
                        <div class="ctn_area">
                            <div class="font_sblb">자세변환용구</div>
    
                            <p class="color_t_s font_sbmr">
                                장시간 앉아 생활하는 어르신의 자세와 위치를 바꾸기 쉽도록 도와드려요
                            </p>
                        </div>
                    </div>
                    <!-- box_sub01 -->
    
                    <div class="box_sub01">
                        <div class="img_area">
                            <img src="/html/page/app/matching/assets/src/images/01tool/tool01_10.svg" alt="요실금팬티">
                        </div>
                        <div class="ctn_area">
                            <div class="font_sblb">요실금팬티</div>
    
                            <p class="color_t_s font_sbmr">
                                요실금 증상이 있는 어르신이 쾌적한 일상생활을 할 수 있도록 도와드려요
                            </p>
                        </div>
                    </div>
                    <!-- box_sub01 -->
    
                    <div class="box_sub01">
                        <div class="img_area">
                            <img src="/html/page/app/matching/assets/src/images/01tool/tool01_11.svg" alt="목욕의자">
                        </div>
                        <div class="ctn_area">
                            <div class="font_sblb">목욕의자</div>
    
                            <p class="color_t_s font_sbmr">
                                자세를 유지하도록 하여 편안하게 목욕을 할 수 있어요
                            </p>
                        </div>
                    </div>
                    <!-- box_sub01 -->
    
                    <div class="box_sub01">
                        <div class="img_area">
                            <img src="/html/page/app/matching/assets/src/images/01tool/tool01_12.svg" alt="이동변기">
                        </div>
                        <div class="ctn_area">
                            <div class="font_sblb">이동변기</div>
    
                            <p class="color_t_s font_sbmr">
                                화장실로 이동하기 어려운 어르신이 용변을 쉽고 안전하게 볼 수 있도록 도와드려요
                            </p>
                        </div>
                    </div>
                    <!-- box_sub01 -->
    
                    <div class="box_sub01">
                        <div class="img_area">
                            <img src="/html/page/app/matching/assets/src/images/01tool/tool01_13.svg" alt="간이변기">
                        </div>
                        <div class="ctn_area">
                            <div class="font_sblb">간이변기</div>
    
                            <p class="color_t_s font_sbmr">
                                누워서 생활하시거나 소변 조절이 어려운 어르신이 용변을 쉽고 안전하게 볼 수 있도록 도와드려요
                            </p>
                        </div>
                    </div>
                    <!-- box_sub01 -->
    
                    <div class="box_sub01">
                        <div class="img_area">
                            <img src="/html/page/app/matching/assets/src/images/01tool/tool01_14.svg" alt="경사로">
                        </div>
                        <div class="ctn_area">
                            <div class="font_sblb">경사로</div>
    
                            <p class="color_t_s font_sbmr">
                                실·내외에서 수동휠체어 또는 성인용보행기 이용 시 편하고 안전하게 이동할 수 있어요
                            </p>
                        </div>
                    </div>
                    <!-- box_sub01 -->
    
       
    
                </div>



            </div>

        </div>
    </div>
    <!-- welInfo_modal -->


<jsp:include page="/WEB-INF/jsp/app/matching/common/checkExistInProgressConslt.jsp" />

<script>
    function handleNextBtnClick() {
        if ($(".wel_select_area li.active").length < 1){
            showAlertPopup("최소 1개를 선택해 주세요.");
            return;
        }
        const ctgryCds = $(".wel_select_area li.active").map((idx, element) => {
            return element.getAttribute("ctgryCd");
        }).get();
        const param = {recipientsNo:"${recipient.recipientsNo}", ctgryCds};
        callPostAjaxIfFailOnlyMsg("addMbrRecipientsGdCds.json", param, handleInProgressThing);
    }
    
    function handleInProgressThing() {
        const inProgressConsltOrOrder = '${inProgressConsltOrOrder}' && JSON.parse('${inProgressConsltOrOrder}');
        
        const handleInProgressThingNotExist = function() {
            showToastMsg('관심복지용구가 설정되었어요', function() {
                location.replace('/matching/membership/conslt/infoConfirm?prevPath=equip_ctgry&recipientsNo=${recipient.recipientsNo}');
            });
        }
        const isOtherConsltExist = inProgressConsltOrOrder.type === 'conslt'
            ? inProgressConsltOrOrder.conslt.prevPath !== 'equip_ctgry'
            : false;
        checkInProgressConsltOrOrder(
            inProgressConsltOrOrder,
            handleInProgressThingNotExist,
            Boolean('${recipient.consultBplcUniqueId != null && !recipient.consultBplcUniqueId.isEmpty()}'),
            'equip_ctgry',
            {
                title: '관심 설정되었어요',
                message: '진행중인 ' + (isOtherConsltExist ? '다른 유형의 ' : '') + '상담이 있어요. 신청내역을 보시겠어요?'
            }
        )
    }

    $(function () {
        initNextBtn();
        initWelSelectBtnClickListener();
        refreshNextBtnActiveState();
    });

    function initNextBtn() {
        if ('${inProgressConsltOrOrder}') {
            $('#next_btn').text('관심 설정하기');
        } else {
            $('#next_btn').text('혜택 상담받기');
        }
    }
    
    // 복지용구 선택 버튼 초기화
    function initWelSelectBtnClickListener() {
        $('.wel_select_area li').on('click', function () {
            if ($(this).hasClass('active') == true) {
                $(this).removeClass('active');
            } else {
                $(this).addClass('active');
            }
            refreshNextBtnActiveState();
        });
    }
    
    function refreshNextBtnActiveState() {
        const isSelected = $('.wel_select_area').find('.active').length > 0;
        if (isSelected) {
            //버튼 활성화
            $('.btn_evt').removeClass('btn_disable');
        }else{
            $('.btn_evt').addClass('btn_disable');
        }
    }

    
		// Function to handle modal button click
		const handleModalButtonClick = (e) => {
		    const btn = e.currentTarget;
		    const modalId = btn.classList.contains("region01_btn_evt") ? "#region01_modal" : //시도군 선택 region 1~3
		                    btn.classList.contains("region02_btn_evt") ? "#region02_modal" : 
		                    btn.classList.contains("region03_btn_evt") ? "#region03_modal" :
		                    btn.classList.contains("welInfo") ? "#welInfo_modal" : null; //관심복지용구 선택
		    if (modalId) {
		        const targetSheet = document.querySelector(modalId);
		        hideBottomSheet();
		        showBottomSheet(targetSheet);
		    }
		};

		// Add event listeners to all show-modal buttons
		const addShowModalListeners = () => {
		    const allShowModalBtns = document.querySelectorAll(".show-modal");
		    allShowModalBtns.forEach(btn => {
		        btn.addEventListener("click", handleModalButtonClick);
		    });
		};

        // Initial setup for existing buttons
		addShowModalListeners();
</script>