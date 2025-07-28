<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="modal fade" id="modal-matching-bplc-hist" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <p>매칭 기관 이력 확인</p>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="close"></button>
            </div>
            <div class="modal-body">
                <table class="table-list">
                    <colgroup>
                        <col style="width: 40%">
                        <col style="width: 30%">
                        <col style="width: 30%">
                    </colgroup>
                    <thead>
                        <tr>
                            <th scope="col">매칭 기관</th>
                            <th scope="col">매칭 일자</th>
                            <th scope="col">상세</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- 매칭 이력 데이터 -->
                    </tbody>
                </table>
            </div>
            <div id="modal-footer" class="modal-footer pagination md:w-3/4 mx-auto mt-4">
                <!-- 페이징 UI -->
            </div>
        </div>
    </div>
</div>

<script src="/html/core/script/commonPagingUi.js?v=<spring:eval expression="@version['assets.version']"/>" type="text/javascript" ></script>

<script>
    function fetchAndRenderMatchingBplcHist(mbrUniqueId, recipientsNo) {
        const $parent = $('#modal-footer');
        const pageSize = 10;
        const blockSize = 10;
        const onPageBtnClick = async (pageNo) => {
            try {
                const response = await $.ajax({
                    url: '/_mng/mbr/recipients/matchingBplcHist.json',
                    data: { 
                        curPage: pageNo,
                        mbrUniqueId,
                        recipientsNo
                     }
                });
                drawPageData(response.list);
                return response;
            } catch (error) {
                console.error(error);
            }
        }
        drawPagingUI($parent, pageSize, blockSize, onPageBtnClick);
    }

    function drawPageData(data) {
        const $tbody = $('#modal-matching-bplc-hist .table-list tbody');
        $tbody.empty();

        data.forEach(matchingBplcHist => {
            $tbody.append(`
                <tr>
                    <td>${"${matchingBplcHist.isDeleted ? '-' : matchingBplcHist.matchingBplcNm}"}</td>
                    <td>${"${matchingBplcHist.matchingDt}"}</td>
                    <td>${"${matchingBplcHist.isDeleted ? matchingBplcHist.detail : createDetailLink(matchingBplcHist.detail)}"}</td>
                </tr>
            `);
        });
    }

    function createDetailLink(detail) {
        if (!detail) return '-';
        const link = detail.isConslt
            ? '/_mng/consult/recipter/view?consltNo=' + detail.consltNo
            : '/_mng/dolbom/shop/order/detail.form?ordMId=' + detail.ordMId;
        return '<a href="' + link + '" class="underline">' + detail.text + '</a>';
    }
</script>