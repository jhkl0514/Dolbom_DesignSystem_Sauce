<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


    <!-- 이벤트페이지 OEOS-730 202412 -->
    <style>

        .evtPageTop{display: flex;justify-content: center;

            /* background: linear-gradient(#C8E7E1 881px, #ffffff 0px); */
            background: url('/html/page/index/assets/images/event/event_top_bgLine.png') repeat-x left top;
            
            
            img{width: 100%;}
        
        }

        .popup_detail_area{display: flex;flex-direction: column; gap:20px;margin-bottom: 48px;}
        .popup_button_area{display: flex;flex-direction: column; align-items: center; gap:16px;margin-bottom: 48px;
        
            .pc_area{display: none;}
        }


        .popup_imgMO{display: block;width: 100%;}
        .popup_imgPC{display: none;}

        .popup_notice_area{background-color: #ECECEC;
            .content{padding: 40px 20px;}

            .notice_list li{text-indent: -20px;padding-left: 20px;margin-bottom: 6px;font-size: 15px;}

        }


        /* 768px 이상 pc */
        @media (min-width: 768px) {

            .evtPageTop{
            
                img{max-width: 1920px;width: auto;}
                
            }

            .popup_detail_area{gap:26px;margin-bottom: 120px;}
            .popup_button_area{gap:30px;margin-bottom: 120px;
            
                .pc_area{display: grid;grid-template-columns: 1fr 1fr; gap: 36px 20px;

                    :nth-child(1){grid-column: 1 / span 2;}

                }
                
            }

            .popup_imgMO{display: none;}
            .popup_imgPC{display: block;}


            .popup_notice_area{
                .content{padding: 54px 200px;}

                .notice_list li{font-size: 20px;}
                
                
            }

            
        }
        
    </style>
    <!-- 이벤트페이지 OEOS-730 202412 end -->


            <!-- 이벤트 페이지 OEOS-730 202412 -->
            <div class="evtPageWrap">
                <div class="evtPageTop">
                    <!-- mobile -->
                    <img class="popup_imgMO" src="/html/page/index/assets/images/event/event_top_mo.png" alt="pc_event">
                    <!-- pc -->
                    <img class="popup_imgPC" src="/html/page/index/assets/images/event/event_top_pc.png" alt="pc_event">
                </div>
    
    
                <div class="content">
    
                    <div class="popup_detail_area">
                        <!-- mobile -->
                        <img class="popup_imgMO" src="/html/page/index/assets/images/event/box1_mo.png" alt="이벤트 참여 방법">
                        <img class="popup_imgMO" src="/html/page/index/assets/images/event/box2_mo.png" alt="이벤트 참여 기간">
                        <img class="popup_imgMO" src="/html/page/index/assets/images/event/box3_mo.png" alt="당첨자 발표">
                        <img class="popup_imgMO" src="/html/page/index/assets/images/event/box4_mo.png" alt="참여 경품">
                        <img class="popup_imgMO" src="/html/page/index/assets/images/event/box5_mo.png" alt="부모님과의 감동 사연 예시">
                        <!-- pc -->
                        <img class="popup_imgPC" src="/html/page/index/assets/images/event/box1_pc.png" alt="이벤트 참여 방법">
                        <img class="popup_imgPC" src="/html/page/index/assets/images/event/box2_pc.png" alt="이벤트 참여 기간">
                        <img class="popup_imgPC" src="/html/page/index/assets/images/event/box3_pc.png" alt="당첨자 발표">
                        <img class="popup_imgPC" src="/html/page/index/assets/images/event/box4_pc.png" alt="참여 경품">
                        <img class="popup_imgPC" src="/html/page/index/assets/images/event/box5_pc.png" alt="부모님과의 감동 사연 예시">
                            
                    </div>
                    <!-- popup_detail_area -->
    
                    <div class="popup_button_area">
                        
                        <!-- mobile -->
                        <a class="popup_imgMO" href="https://docs.google.com/forms/d/e/1FAIpQLScPueFoBJKxv-_-fj-uQe3j9wdJap7ijIWbw53EcmGE45M2ug/viewform" target="_blank">
                            <img src="/html/page/index/assets/images/event/btn01_mo.png" alt="감동사연 이벤트 참여하기">
                        </a>
                        <a class="popup_imgMO" href="https://play.google.com/store/apps/details?id=kr.co.eroum.dolbom" target="_blank">
                            <img src="/html/page/index/assets/images/event/btn02_mo.png" alt="이로움돌봄 앱 다운받기">
                        </a>
                        <a class="popup_imgMO" href="https://www.instagram.com/p/DDqlA1qTvSF/?utm_source=ig_web_copy_link&igsh=MzRlODBiNWFlZA==" target="_blank">
                            <img src="/html/page/index/assets/images/event/btn03_mo.png" alt="인스타그램 공유하고 당첨확률 UP!">
                        </a>
    
                        <!-- pc -->
                        <div class="pc_area">
                            
                            <a class="popup_imgPC" href="https://docs.google.com/forms/d/e/1FAIpQLScPueFoBJKxv-_-fj-uQe3j9wdJap7ijIWbw53EcmGE45M2ug/viewform" target="_blank">
                                <img src="/html/page/index/assets/images/event/btn01_pc.png" alt="감동사연 이벤트 참여하기">
                            </a>
    
                            <a class="popup_imgPC" href="" data-bs-toggle="modal" data-bs-target="#dbapp_modal">
                                <img src="/html/page/index/assets/images/event/btn02_pc.png" alt="이로움돌봄 앱 다운받기">
                            </a>
                            <a class="popup_imgPC" href="https://www.instagram.com/p/DDqlA1qTvSF/?utm_source=ig_web_copy_link&igsh=MzRlODBiNWFlZA==" target="_blank">
                                <img src="/html/page/index/assets/images/event/btn03_pc.png" alt="인스타그램 공유하고 당첨확률 UP!">
                            </a>
    
                        </div>
            
                    </div>
                    <!-- popup_button_area -->
                    
                </div>
    
                <div class="popup_notice_area">
    
                    <div class="content">
    
                        <div class="mb-5 text-xl font-semibold md:text-3xl ">주의사항</div> 
    
                        <ul class="text-base md:text-xl notice_list">
                            <li>※ 한 아이디당 1회만 참여 가능합니다.</li>
                            <li>※ 신규회원 기존회원 모두 참여 가능합니다.</li>
                            <li>※ 기존에 상담신청 완료하신 분들도 모두 참여 가능합니다.</li>
                            <li>※ 구글폼 미제출 시 이벤트 참여 불가합니다.</li>
                            <li>※ 보내주신 사연은 향후 이로움돌봄 마케팅 자료로 활용될 수 있습니다.</li>
                            <li>※ 경품의 제세공과금은 (주)티에이치케이컴퍼니 부담입니다.</li>
                            <li>※ 잘못된 개인정보 입력, 기타 사유 등으로 인해 당첨자에게 연락이 불가능하거나 경품이 분실, 오발송 또는 반송될 경우 재발송되지 않으며 당사에서 책임지지 않습니다.</li>
                        </ul>
    
                    </div>
    
                </div>
                <!-- popup_notice -->
    
            </div>
            <!-- 이벤트 페이지 OEOS-730 202412 end -->
    
    