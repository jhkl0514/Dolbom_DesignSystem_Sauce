<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<div id="modal_static_resource" class="modal fullscreen">
    <div class="modal_header">
        <h4 class="modal_title"></h4>
        <div class="close_x waves-effect" onclick="closeStaticResourceModal(event)"></div>
    </div>
    <iframe id="container_iframe" src="" width="100%" height="90%" style="border: none;"></iframe>
</div>

<script>
    function closeStaticResourceModal(event) {
        event.stopPropagation();
        $('#modal_static_resource').modal('close');
    }

    $(function () {
        $('#modal_static_resource').modal({
            show: false
        });

        $(document).on('click', '[data-static-resource-url]', function (e) {
            e.preventDefault();
            const staticResourceUrl = $(this).data('static-resource-url');
            setModalTitleFromStaticResource(staticResourceUrl);
            $('#container_iframe').attr('src', staticResourceUrl);
            $('#modal_static_resource').modal('open');
        });

        // iframe 안에서는 data-static-resource-url 속성이 포함된 요소를 클릭했을 때를 감지할 수 없어서
        // 부모 페이지에서 메시지를 받아서 팝업을 열도록 함
        window.addEventListener('message', function (event) {
            if (event.origin !== window.location.origin) return;

            const data = event.data;
            if (data.type === 'openStaticResourceModal') {
                $('#container_iframe').attr('src', data.staticResourceUrl);
                $('#modal_static_resource').modal('open');
            }
        });
    })

    function setModalTitleFromStaticResource(url) {
        $.get(url).then(response => {
            const parser = new DOMParser();
            const doc = parser.parseFromString(response, 'text/html');
            $('#modal_static_resource .modal_title').text(doc.title);
        });
    }
</script>
