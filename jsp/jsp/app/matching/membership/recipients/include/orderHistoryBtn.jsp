<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%-- 이 페이지를 사용하려면 아래의 매개변수에 값을 넘겨줘야 함 --%>
<c:set var="recipientNo" value="${param.recipientNo}"/>

<div class="h08"></div>

<a class="d-flex align-items-center justify-content-end marT4 marB4" href="/matching/shop/order/list?recipientsNo=${recipientNo}">
  <span class="color_t_s font_sbsr">주문요청내역 보기</span>
  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16" fill="none">
    <path fill-rule="evenodd" clip-rule="evenodd" d="M5.64645 3.64645C5.84171 3.45118 6.15829 3.45118 6.35355 3.64645L10.3536 7.64645C10.5488 7.84171 10.5488 8.15829 10.3536 8.35355L6.35355 12.3536C6.15829 12.5488 5.84171 12.5488 5.64645 12.3536C5.45118 12.1583 5.45118 11.8417 5.64645 11.6464L9.29289 8L5.64645 4.35355C5.45118 4.15829 5.45118 3.84171 5.64645 3.64645Z" fill="#999999"/>
  </svg>
</a>
