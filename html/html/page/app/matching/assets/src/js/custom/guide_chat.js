//guide_chat.js

$(function () {
    // 챗 질답영역 chatUnit로 감쌈
    $('[class^="boxChatArea"].bot_recv').wrap('<div class="chatUnit"></div>');

    // 버튼 선택(라디오 버튼)
    $('.chk_area input:radio').each(function () {
        
        $(this).on('click', function () {

            // ★★★★ 라디오 버튼 선택유무 checked 안된상태에서만 동작처리
            if ($(this).data('wasChecked')) {

                // ** checked 된 상태 - [Stop]
                
                $(this).prop('checked', true); // 선택 상태 유지

            } else {

                // ** checked 안된 상태 - [Go]
                $('.chk_area :radio').data('wasChecked', false); // 다른 라디오의 상태 초기화
                $(this).data('wasChecked', true); // 현재 라디오를 선택 상태로 설정


                // 텍스트
                var thisTxt = $(this).next('span').text();

                // 타이틀
                var thisTarget = $(this).parents('[class^="boxChatArea"]').attr('title');

                // step 넘버
                var thisTargetChatValue = thisTarget.substr(5, 10);

                // step 넘버+1
                var stepPlus = ++thisTargetChatValue;

                // 다음 step 요소 선택
                var $nextStep = $('[title="step_' + stepPlus + '"]').addClass('active');

                // **임시** 선택 버튼 변경 시 기존 챗 disabled 처리
                $(this).parents('.chatUnit').find('.boxChatArea.bot_trans').addClass('disabled');


                    // ★★ 재클릭할 때 기존 답변 챗(bot_trans) 유무에 따른 처리
                    if ($(this).parents('[class^="boxChatArea"]').next('div.boxChatArea').hasClass('bot_trans')) {

                        //답변챗 있을때

                        // 브라우저 하단 기준으로 스크롤
                        function scrollToBottom(target) {
                            var offsetTop = $(target).offset().top + 45 + 32; //45 : 답변챗 높이 / 32 : gap 32px
                            var windowHeight = window.innerHeight;
                            $('html, body').animate({
                                scrollTop: offsetTop - windowHeight + $(target).outerHeight() + 20 // 하단 여백 추가
                            }, 800);
                        }

                        scrollToBottom($nextStep);


                        $('<div class="boxChatArea bot_trans" title="tr_' + thisTarget + '">'
                                + '<div class="box_chat">'
                                    + thisTxt
                                + '</div>'
                            + '</div>'
                        ).appendTo($(this).parents('.chatUnit'));
                    } else {

                        //답변챗 없을때 - 처음상태

                        // 브라우저 하단 기준으로 스크롤
                        function scrollToBottom(target) {
                            var offsetTop = $(target).offset().top + 45;
                            var windowHeight = window.innerHeight;
                            $('html, body').animate({
                                scrollTop: offsetTop - windowHeight + $(target).outerHeight() + 20 // 하단 여백 추가
                            }, 800);
                        }

                        scrollToBottom($nextStep);


                        $('<div class="boxChatArea bot_trans" title="tr_' + thisTarget + '">'
                                + '<div class="box_chat">'
                                    + thisTxt
                                + '</div>'
                            + '</div>'
                        ).appendTo($(this).parents('.chatUnit'));
                    }


            }
            //라디오 버튼 선택유무 if 문 끝.





        });
    });
});



$(function () {
    // 체크박스 버튼 선택 시 하단 선택완료 버튼 활성화
    $('.chk_area input:checkbox').click(function () {
        var checked = $(this).closest('.chk_area').find(':checkbox:checked').length;

        if (checked > 0) {
            $(this).closest('.chk_area').siblings('.evtBtn_checkbox').removeClass('disabled');
        } else {
            $(this).closest('.chk_area').siblings('.evtBtn_checkbox').addClass('disabled');
        }
    });

    // 선택완료 버튼
    $('.evtBtn_checkbox').click(function () {
        if ($(this).hasClass('disabled')) return; // 버튼이 비활성화된 경우 동작하지 않음

        // 선택된 체크박스의 텍스트를 배열에 저장
        let selectedTexts = [];
        $(this).siblings('.chk_area').find('input:checked').each(function () {
            selectedTexts.push($(this).next('span').text());
        });
        
        // 선택한 텍스트를 ", "로 연결하여 하나의 문자열로 변환
        let selectedTextOutput = selectedTexts.join(', ');

        // 타이틀
        thisTarget = $(this).parents('[class^="boxChatArea"]').attr('title');

        // step 넘버
        var thisTargetChatValue = thisTarget.substr(5, 10);

        // step 넘버+1
        var stepPlus = ++thisTargetChatValue;

        // 다음 step 요소 선택
        var $nextStep = $('[title="step_' + stepPlus + '"]').addClass('active');

        // 브라우저 하단 기준으로 스크롤
        function scrollToBottom(target) {
            var offsetTop = $(target).offset().top;
            var windowHeight = window.innerHeight;
            $('html, body').animate({
                scrollTop: offsetTop - windowHeight + $(target).outerHeight() + 20 // 하단 여백 추가
            }, 800);
        }

        // **임시** 선택 버튼 변경 시 기존 챗 disabled 처리
        $(this).parents('.chatUnit').find('.boxChatArea.bot_trans').addClass('disabled');

        // 답변 챗 생성 및 추가
        $('<div class="boxChatArea bot_trans" title="tr_' + thisTarget + '">'
            + '<div class="box_chat">'
                + selectedTextOutput // 선택한 항목 텍스트 추가
            + '</div>'
        + '</div>'
        ).appendTo($(this).parents('.chatUnit'));

        // 다음 스텝으로 스크롤 이동
        scrollToBottom($nextStep);
    });
});
