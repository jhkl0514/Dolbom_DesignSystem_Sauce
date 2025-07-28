<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script>
    async function checkInProgressConsltOrOrder(
        inProgressConsltOrOrder,
        onInProgressThingNotExists,
        hasMatchingBplc,
        currentPrevPath,
        inProgressConsltPopupText
    ) {
        async function showInProgressConsltPopup() {
            const isOtherType = currentPrevPath !== inProgressConsltOrOrder.conslt.prevPath;

            const title = inProgressConsltPopupText && inProgressConsltPopupText.title
                ? inProgressConsltPopupText.title
                : '진행중인 ' + (isOtherType ? '다른 유형의 ' : ' ') + '상담이 있어요.';

            const message = inProgressConsltPopupText && inProgressConsltPopupText.message
                ? inProgressConsltPopupText.message
                : '신청내역을 보시겠어요?';

            return showConfirmPopup(title, message, '보러가기');
        }

        async function showInProgressOrderPopup() {
            const message = hasMatchingBplc && !inProgressConsltOrOrder.order.rejectBplcUniqueId
                ? '주문건 완료 후 다시 신청 가능해요. 빠른 신청을 원하시면 연결된 장기요양기관에 문의해주세요.'
                : '주문건 완료 후 다시 신청 가능해요. 곧 장기요양기관이 배정될 예정이니 해당 장기요양기관에 문의해주세요.';
            return showConfirmPopup('진행중인 주문이 있어요.', message, '보러가기');
        }
        
        if (!inProgressConsltOrOrder) return onInProgressThingNotExists();

        const result = inProgressConsltOrOrder.type === 'conslt'
            ? await showInProgressConsltPopup()
            : await showInProgressOrderPopup();
        if (result !== 'confirm') return;

        /*백 버튼 클릭 시 상담내역 보기 -> 어르신 으로 이동하게 세팅을 한다. */
        popHistoryAfterPath(["subMain", "service"]);
        
        const nextPath = inProgressConsltOrOrder.type === 'conslt'
            ? '/matching/membership/conslt/detail?consltNo=' + inProgressConsltOrOrder.conslt.consltNo
            : '/matching/shop/order/detail?ordMCd=' + inProgressConsltOrOrder.order.ordMCd;
        location.replace(nextPath);
    }
</script>
