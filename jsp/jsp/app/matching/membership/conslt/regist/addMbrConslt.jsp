<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script>
    /* data 필수 항목들
        prevPath, recipientsNo, tel, over65Yn, sido, sigugun, zip, lat, lot
    */
    function addMbrConslt(data) {
        callPostAjaxIfFailOnlyMsg(
            '/matching/membership/conslt/addMbrConslt.json',
            {
                ...data,
                mustCallbackJs : true,
                doNotDisplayError:true
            },
            function(result) {
                if (result.success == undefined || !result.success){
                    if (result.inProgressPrevPath) {
                        const isOther = data.prevPath != result.inProgressPrevPath;
                        showInProgressConsltPopup(isOther, result.inProgressConsltNo);
                    } else {
                        alertConsltApplicationFailure();
                    }
                }else{
                    fn_addMbrConslt_after(data, result);
                }
                
            }
        );
    }

    function fn_addMbrConslt_after(data, result){
        removeInLocalStorage('consltPrevPath');
        removeInLocalStorage('consltRecipientsNo');
        removeInLocalStorage('consltTel');
        
        var labelValue = data.prevPath === 'care' ? '이로움돌봄' : result.prevPathCtgryMap[data.prevPath];
	    airbridge.events.send('click_consult_matching', {label: labelValue});
        airbridge.events.send('2412click_consult_matching', {label: labelValue});

        var param = {"eventName":"2412click_consult_matching"};
        callPostAjaxIfFailOnlyMsg("/advertising/events/send.json", param, function(result) {});

        setTimeout(() => {
            location.href = '/matching/membership/conslt/complete?recipientsNo=' + data.recipientsNo
        }, 200);
    }

    async function showInProgressConsltPopup(isOther, consltNo) {
        const result = await showConfirmPopup('진행중인 ' + (isOther ? '다른 유형의 ' : '') + '상담이 있어요.', '신청내역을 보시겠어요?', '보러가기');
        if (result != 'confirm') return;

        /*백 버튼 클릭 시 상담내역 보기 -> 어르신 으로 이동하게 세팅을 한다. */
        pushHistoryStack("/matching/main/service");

        location.replace('/matching/membership/conslt/detail?consltNo=' + consltNo);
    }

    async function alertConsltApplicationFailure() {
        await showAlertPopup2('상담 신청에 실패했어요', '어르신 정보 확인 후 다시 시도해주세요.');
        location.href = '/matching/main/service';
    }
</script>