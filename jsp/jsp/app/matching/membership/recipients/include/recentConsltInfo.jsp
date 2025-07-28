<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%-- 이 페이지를 사용하려면 아래의 매개변수에 값을 넘겨줘야 함 --%>
<c:set var="consltType" value="${param.prevPath}"/>
<c:set var="consltStatus" value="${param.consltSttus}"/>
<c:set var="consltTypeName" value="${param.consltTypeName}"/>
<c:set var="consltRegDt" value="${param.consltRegDt}"/>

<c:choose>
    <%-- 복지용구 상담 이미지 --%>
    <c:when test="${consltType eq 'equip_ctgry' || consltType eq 'weltool_info'}">
        <c:set var="consltImageKind" value=" trans_02 "/>
    </c:when>
    <%-- 간편테스트, 돌봄 상담 이미지 --%>
    <c:otherwise>
        <c:set var="consltImageKind" value=" trans_01 "/>
    </c:otherwise>
</c:choose>
<c:choose>
    <%-- 상담완료, 취소 회색 배경 --%>
    <c:when test="${consltStatus eq 'CS06' || consltStatus eq 'CS03' || consltStatus eq 'CS04' || consltStatus eq 'CS09'}"><c:set var="consltImageStatus" value=" ok "/> </c:when>
    <%-- 상담중 청색 배경 --%>
    <c:otherwise> <c:set var="consltImageStatus" value=" ing "/></c:otherwise>
</c:choose>

<div class="img_area ${consltImageKind} ${consltImageStatus}">
    <span class="txt font_sss">
        <c:choose>
            <%-- 상담정보가 있을 때 --%>
            <c:when test="${consltStatus eq 'CS01' || consltStatus eq 'CS07'}">신청<br>완료</c:when>
            <c:when test="${consltStatus eq 'CS02' || consltStatus eq 'CS08'}">상담<br>연결중</c:when>
            <c:when test="${consltStatus eq 'CS05' || consltStatus eq 'CS10'}">상담<br>진행중</c:when>
            <c:when test="${consltStatus eq 'CS06'}">상담<br>완료</c:when>
            <c:otherwise>상담취소</c:otherwise>
        </c:choose>
    </span>
</div>

<div>
    <div class="font_sbss">${consltTypeName}</div>
    <div class="marT4">
        <span class="color_t_s font_sbsr">${consltRegDt}</span>
    </div>
</div>
