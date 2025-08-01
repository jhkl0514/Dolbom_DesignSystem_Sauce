<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="page-content">
	
	<div style="">
        이 페이지는 메일발송 테스트 목적으로만 만들어진 페이지 입니다.
        <br>
        주문의 상태와 일치해야 정확한 메일이 발송 됩니다.
    </div>
	
	<br>
    <fieldset>
        <table class="table-detail">
            <colgroup>
                <col class="w-43">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><label for="contents" class="require">메일 발송 종류</label></th>
                    <td>
                        <div class="form-group">
                            <div class="form-check-group">
                                <c:forEach items="${mailSendTyCdList}" var="iem" varStatus="status">
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="mailty" id="search-item-mailty-${status.index}" value="${iem.key}">
                                        <label class="form-check-label" for="search-item-mailty-${status.index}">${iem.value}</label>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><label for="contents" class="require">주문번호</label></th>
                    <td>
                        <input type="text" class="form-control w-100 " id="ordrCd" name="ordrCd">
                    </td>
                </tr>
                <tr>
                    <th scope="row"><label for="contents" class="">주문 상세 번호</label></th>
                    <td>
                        <input type="text" class="form-control w-100 " id="ordrDtlCd" name="ordrDtlCd">
                    </td>
                </tr>
                <tr>
                    <th scope="row"><label for="contents" class="require">발송자 아이디</label></th>
                    <td>
                        <input type="text" class="form-control w-100 " id="ordrrId" name="ordrrId">
                    </td>
                </tr>
                
                
            </tbody>
        </table>
    </fieldset>
    <br/>
    <div>
		<button class="btn-primary shadow w-52" onclick="sendCall('${mailSendTy}')">발송</button>
	</div>
</div>

<script>
    function sendCall(sendKind){

        var data = {'ordrCd':$('input[type="text"][name="ordrCd"]').val()
                    , 'ordrDtlCd':$('input[type="text"][name="ordrDtlCd"]').val()
                    , 'ordrrId':$('input[type="text"][name="ordrrId"]').val()
                    , 'mailTy':$('input[type="radio"][name="mailty"]:checked').val()
                    , sendKind
        }

        if (data.ordrCd.length < 2){
            alert("주문번호를 입력하여 주십시오.")
            return;
        }

        if (data.ordrrId.length < 2){
            alert("주문자 아이디를 입력하여 주십시오.")
            return;
        }

        if (data.mailTy == undefined || data.mailTy.length < 2){
            alert("메일발송 종류를 선택하여 주십시오.")
            return;
        }

        if ((data.mailTy=="MAILSEND_ORDR_MNG_RETURN" || data.mailTy=="MAILSEND_ORDR_MNG_REFUND" || data.mailTy=="MAILSEND_ORDR_SCHEDULE_CONFIRM_ACTION" || data.mailTy=="MAILSEND_ORDR_SCHEDULE_CONFIRM_NOTICE")
            && data.ordrDtlCd.length < 2){
            alert("주문상세번호를 입력해야 합니다.")
            return;
        }

        if (sendKind == 'mail'){
            jsCallApi.call_api_post_json(this, "/_mng/sysmng/test/ordrsend/ordrMailSend.json", 'mailSendCb', data);
        }else if (sendKind == 'biztalk'){
            jsCallApi.call_api_post_json(this, "/_mng/sysmng/test/ordrsend/ordrBiztalkSend.json", 'mailSendCb', data);
        }else{
            alert("sendKind 확인")
        }
        
    }

    function mailSendCb(result, fail, data, param){
        if (result == undefined){
            alert("결과를 받지 못 했습니다. 개발자에게 문의하여 주십시오")
            return;
        }

        if (!result.success){
            alert("결과를 받지 못 했습니다. 개발자에게 문의하여 주십시오")
            return;
        }

        if (data.sendKind == 'biztalk'){
            alert(result.phoneno + " 발송하였습니다.")
        }else{
            alert(result.email + " 발송하였습니다.")
        }
        
    }
</script>