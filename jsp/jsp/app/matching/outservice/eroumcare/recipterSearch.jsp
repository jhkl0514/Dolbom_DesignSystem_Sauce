<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="icube.common.util.DateUtil"%>

<!--
    이로움케어에서 수급자 정보를 가지고 롱텀에 조회를 할때 사용하는 화면
    기본 데이터 :  mbrRecipientsVO
-->
<div class="eroumon recipient search" style="width: calc(100% - 110px); padding: 15px 50px ; border: #ddd 2px solid; background-color: #f5f5f5; text-align: left; vertical-align: middle;border-radius: 0.3rem;font-size: 14px; font-weight:bold;color:#777;line-height:10px;"> 
    <input type="hidden" id="penNum" value="${mbrRecipientsVO.getRcperRcognNo()}">
    수급자 성명&nbsp;&nbsp;<input type="text" id="penNm" value="${mbrRecipientsVO.getRecipientsNm()}" style="border:1px solid #ddd;width:146px;" class="input-sm" autocomplete="off">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    생년월일&nbsp;&nbsp;<input type="text" id="BRDT" value='${DateUtil.convertDate(mbrRecipientsVO.getBrdt(), "yyyy-MM-dd")}' style="border:1px solid #ddd;width:180px;" maxlength="10" class="input-sm" autocomplete="off" placeholder="생년월일 입력">
    <br><br>
    인정유효기간(시작일자) <input type="text" id="penExpiStDtm" name="penExpiStDtm"  style="border:1px solid #ddd;width:180px;" class="input-sm" autocomplete="off" placeholder="시작일자 입력">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    인정등급&nbsp;&nbsp;
        <select name="penRecGraCd" id="penRecGraCd" class="input-sm" style="width: 80px;border:1px solid #ddd;">
            <option value="" >선택</option>
            <option value="01">1등급</option>
            <option value="02">2등급</option>
            <option value="03">3등급</option>
            <option value="04">4등급</option>
            <option value="05">5등급</option>
            <option value="06">6등급</option>
          </select>
    <br><br>
          
    <span style="position:relative;line-height:30px;margin-bottom:10px;">요양인정번호</span>&nbsp;&nbsp;
    <span style="position:absolute;margin-top:5px;padding:0px 10px;background:<c:if test="${empty mbrRecipientsVO.getRcperRcognNo()}">#4568e3</c:if><c:if test="${!empty mbrRecipientsVO.getRcperRcognNo()}">#e34545</c:if>;color:#fff;font-size:10px;border-radius: 3px;line-height:20px;">
        <c:if test="${empty mbrRecipientsVO.getRcperRcognNo()}">없어요</c:if>
        <c:if test="${!empty mbrRecipientsVO.getRcperRcognNo()}">있어요</c:if>
    </span>
    <span style="margin-left:56px;">
        <input type="text" id="penNum2" value="" placeholder="L을 제외한 숫자만 입력" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" style="border:1px solid #ddd;width:350px;" maxlength="10" class="input-sm" autocomplete="off">
    </span>
    <br><br>
    <span style="font-size:12px;font-weight:normal;line-height:15px;">
        ＊'있어요'로 표기된 경우 별도로 L번호를 입력하지 않아도 조회가 가능합니다.<br>
        ＊ 수급자의 L번호가 잘못 입력되어 조회가 불가할 경우, 새로 입력하여 시도해 보시기 바랍니다.
    </span>
    <br><br>
    <div style="text-align:center;">
        <input type="button" value="조회하기" id="recipient_info" class="btn" style="padding:5px 15px;background-color:#333333;color:#fff;font-size: 14px;"> 
    </div>
</div>