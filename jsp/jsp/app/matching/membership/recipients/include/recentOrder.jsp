<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%-- 이 페이지를 사용하려면 아래의 매개변수에 값을 넘겨줘야 함 --%>
<c:set var="ordCtgryIds" value="${param.ordCtgryIds}" />
<c:set var="ordRegDt" value="${param.ordRegDt}"/>
<c:set var="ordItemThumbnail" value="${param.ordItemThumbnail}"/>

<div class="order_img_area">
    <c:choose>
        <c:when test="${empty ordItemThumbnail}">
            <div class="no_Thumb_Img">
                <img src="/html/page/app/matching/assets/src/images/04icon/back_trans.png" alt="">
            </div>
        </c:when>
        <c:otherwise>
            <img id="orderImage" src="${ordItemThumbnail}" alt="">
        </c:otherwise>
    </c:choose>
    
</div>

<div>
    <div id="orderCategoryNames" class="font_sbss line_clamp_1"></div>
    <div class="marT4">
        <span class="color_t_s font_ssr">${ordRegDt}</span>
    </div>
</div>

<script>
    const CATEGORY_MAP = {
        '10a0': { name: '성인용보행기' },
        '2080': { name: '수동휠체어' },
        '1050': { name: '지팡이' },
        '1090': { name: '안전손잡이' },
        '1080': { name: '미끄럼방지 매트' },
        '1070': { name: '미끄럼방지 양말' },
        '1010': { name: '욕창예방 매트리스' },
        '1040': { name: '욕창예방 방석' },
        '1030': { name: '자세변환용구' },
        '1020': { name: '요실금 팬티' },
        '10b0': { name: '목욕의자' },
        '10c0': { name: '이동변기' },
        '1060': { name: '간이변기' },
        '10d0': { name: '경사로' }
    };

    const BASE_IMAGE_PATH = '/html/page/app/matching/assets/src/images/';

    class OrderView {
        constructor(categoryIdsString) {
            this.categoryIds = this.parseJavaList(categoryIdsString);
            this.init();
        }

        parseJavaList(listString) {
            return listString.replace(/[\[\]\s]/g, '').split(',');
        }

        init() {
            this.updateCategoryNames();
        }

        updateCategoryNames() {
            let formattedNames = this.formatCategoryNames();
            $('#orderCategoryNames').text(formattedNames);
        }

        formatCategoryNames() {
            if (this.categoryIds.length === 1) {
                return this.getCategoryName(this.categoryIds[0]);
            }
            return this.getCategoryName(this.categoryIds[0]) + ' 외 ' + (this.categoryIds.length - 1) + '개';
        }

        getCategoryName(categoryId) {
            const categoryInfo = this.findCategoryInfo(categoryId);
            return categoryInfo ? categoryInfo.name : '';
        }

        findCategoryInfo(categoryId) {
            const foundEntry = Object.entries(CATEGORY_MAP).find(function(entry) {
                return categoryId.startsWith(entry[0]);
            });
            return foundEntry ? foundEntry[1] : null;
        }
    }

    $(function() {
        new OrderView('${ordCtgryIds}');
    });
</script>