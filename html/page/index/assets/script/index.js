var winSize = null;
var resize  = false;

$(function() {
    //공지 닫기
    $('.notice-close').on('click', function() {
        $(this).closest('aside').addClass('is-closed');
    });

    //퀵메뉴 닫기
    $('#quick .moveTop').on('click', function() {
        $(window).scrollTop(0);
    });

    //네비게이션
    $('#navigation').on('mouseleave', function() {
        $('#navigation, #navigation *').removeClass('is-hover');
    });

    $('#navigation a').on('mouseenter focus mouseleave focusout', function(e) {
        var navi   = $('#navigation');
        var target = $(this).parent();
        var parent = $(this).closest('.nav-item');

        if(e.type === 'mouseleave') {
            if(target.hasClass('nav-sub-item')) target.removeClass('is-hover');
        } else if(e.type === 'focusout') {
            if(parent.is(':last-child') && target.is(':last-child') && target.hasClass('nav-sub-item')) navi.removeClass('is-hover').find('li').removeClass('is-hover');
        } else {
            navi.addClass('is-hover');
    
            target.addClass('is-hover').siblings().each(function() {
                $(this).removeClass('is-hover').find('li').removeClass('is-hover');
            });
            
            parent.addClass('is-hover').siblings().each(function() {
                $(this).removeClass('is-hover').find('li').removeClass('is-hover');
            });
        }
    });

    $()

    $(window).on('load', function() {
        setTimeout(function() {
            $('#visual').addClass('is-active');
        }, 200)
    })

    $(window).on('scroll load', function() {
        if($(window).scrollTop() > 60) {
            $('#notice').addClass('is-active');
        } else {
            $('#notice').removeClass('is-active');
        }

        if($(window).scrollTop() > $(window).outerHeight() * 0.75) {
            $('#quick').addClass('is-active');
        } else {
            $('#quick').removeClass('is-active');
        }
        
        if($(this).scrollTop() > $('#header').outerHeight() * 1.25) {
            $('body').addClass('is-scroll');
        } else {
            $('body').removeClass('is-scroll');
        }

        let floatingEl = $('.grade-floating');
        if ( ($(window).scrollTop() > $('#header').outerHeight() * 5) && $(window).scrollTop() + $(window).outerHeight() < $(document).outerHeight()) {
            floatingEl.addClass('is-active');
        } else {
            floatingEl.removeClass('is-active');
        }

    });

    $(window).on('load resize', function(e) {
        resize  = (winSize !== null && $(window).outerWidth() === winSize[0]) ? false : true;
        winSize = [$(window).outerWidth(), $(window).outerHeight()];
        
        if(e.type === 'load' || (e.type === 'resize' && resize)) {
            $('.main-visual, #visual').css({'max-height': $(window).outerHeight() - $('#header').outerHeight()});
        }
    });


    ////// 추가 leemw
    //하단 드롭다운메뉴 토글
    $('.btn_menu_dropdown').on('click', function () {

        if ($(this).hasClass('active') == true) {
            $(this).parents('.btn_menu_dropdown_area').removeClass('relative');
            $(this).removeClass('active');
            $('.menu_dropdown').removeClass('active');
        } else {
            $(this).parents('.btn_menu_dropdown_area').addClass('relative');
            $(this).addClass('active');
            $('.menu_dropdown').addClass('active');
        }

    });

    //스크롤 발생시 드롭다운 닫음처리
    $(window).scroll(function(){

        if($('.btn_menu_dropdown').hasClass('active') == true){
            
            $('.btn_menu_dropdown').parents('.btn_menu_dropdown_area').removeClass('relative');
            $('.btn_menu_dropdown').removeClass('active');
            $('.menu_dropdown').removeClass('active');

        }


    });

    //이로움온 돌봄앱 하단버튼
    //*기존 .grade-floating 동작안되서 새로 만듬
    $(window).on('scroll load', function () {

        if ( ($(window).scrollTop() > $('#header').outerHeight() * 5)
                &&
            $(window).scrollTop() + $(window).outerHeight() < $(document).outerHeight() - 200) {
                
            $('.floating_dbapp').addClass('is-active');
        } else {
            $('.floating_dbapp').removeClass('is-active');
        }

    
    });



    //모달하단 sheet 새로 생성
    $('#modal_bottom_sheet').click(function(){

        $('.modal_bottom_sheet').addClass('active');
        $('.modal_back').addClass('active');

    });

    $('.close_x, .modal_back').click(function(){

        $('.modal_bottom_sheet').removeClass('active');
        $('.modal_back').removeClass('active');
        
    });



});