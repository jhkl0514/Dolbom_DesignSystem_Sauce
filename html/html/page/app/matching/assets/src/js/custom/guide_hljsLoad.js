


hljs.initHighlightingOnLoad();

document.addEventListener('DOMContentLoaded', (event) => {
    document.querySelectorAll('pre code').forEach((el) => {
        el.parentNode.classList.add('hljs');

        // 복사 버튼 생성
        let button = document.createElement("a");
        button.innerHTML = ""; //📄
        button.className = "copy-button";
        el.parentNode.appendChild(button);

        // 복사 기능 추가
        button.addEventListener("click", function () {
            let text = el.innerText;

            // Clipboard API 사용
            if (navigator.clipboard && window.isSecureContext) {
                navigator.clipboard.writeText(text).then(() => {
                    showCopied(button);
                }).catch(err => {
                    console.warn('Clipboard API 실패, fallback으로 복사 시도', err);
                    fallbackCopy(text, button);
                });
            } else {
                // HTTPS가 아니거나 Clipboard API 미지원 브라우저
                fallbackCopy(text, button);
            }
        });
    });

    // ✅ 복사 성공 시 애니메이션 처리
    function showCopied(button) {
        button.innerHTML = "Copied!";
        button.classList.add('copy_active');
        setTimeout(() => {
            button.innerHTML = "";
            button.classList.remove('copy_active');
        }, 2000);
    }

    // ✅ fallback 방식 복사 처리
    function fallbackCopy(text, button) {
        const textarea = document.createElement('textarea');
        textarea.value = text;
        textarea.style.position = 'fixed';
        textarea.style.top = 0;
        textarea.style.left = 0;
        textarea.style.width = '1px';
        textarea.style.height = '1px';
        textarea.style.padding = 0;
        textarea.style.border = 'none';
        textarea.style.outline = 'none';
        textarea.style.boxShadow = 'none';
        textarea.style.background = 'transparent';

        document.body.appendChild(textarea);
        textarea.focus();
        textarea.select();

        try {
            let successful = document.execCommand('copy');
            if (successful) {
                showCopied(button);
            } else {
                console.error('Fallback 복사 실패');
            }
        } catch (err) {
            console.error('Fallback 복사 중 예외 발생:', err);
        }

        document.body.removeChild(textarea);
    }
});








$(function(){

    $('pre.hljs').each(function(){


        $thisVal = $(this).find('code').prop('className');
        if($thisVal.includes('html')){
            langVal = 'HTML';
        }
        
        else if($thisVal.includes('scss')){
            langVal = 'SCSS';
        }
        
        else if($thisVal.includes('css')){
            langVal = 'CSS';
        }



        $(this).prepend('<div class="titleArea"><span>'+ langVal +'</span></div>');

        $(this).find('.copy-button').appendTo($(this).find('.titleArea'));
    });
   

});