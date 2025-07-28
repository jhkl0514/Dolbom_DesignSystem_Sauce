<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/html/page/admin/assets/style/new_modal.css?v=<spring:eval expression="@version['assets.version']"/>"/>

<div class="modal fade" id="weltool-info" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <p>수급자 상담정보 상세</p>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="close"></button>
            </div>
            <div class="modal-body">
                <div class="eroumon modal_contents">
                    <div class="modal_top">
                        <h3>요양정보(복지용구)</h3>
                        <p>
                            상담받을 연락처
                            <strong>${mbrConsltVO.mbrTelno}</strong>
                        </p>
                    </div>
                    
                    <div class="text-base modal_con">
                        <p class="font-bold ">상담정보</p>
                        <p class="font-medium">1. 계약완료된 복지용구 확인을 요청한 수급자입니다.</p>
                        <p class="font-medium">2. 수급자가 구매 또는 대여 가능한 복지용구 상담을 진행바랍니다.</p>
                        <p class="text-[#838383]">※ 요양정보(계약완료/구매예상)는 데이터 조회 시점에 따라 실제와 다를 수 있으니 참고용으로만 사용바랍니다.</p>
                    </div>
        
                    <fieldset class="mt-10">
                        <legend class="text-title2">요양정보</legend>
                        <table class="table-detail">
                            <colgroup>
                                <col class="w-43" />
                                <col />
                                <col class="w-43" />
                                <col />
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row">수급자 성명</th>
                                    <td>
                                        <input
                                            type="text"
                                            class="form-control large"
                                            placeholder="${mbrConsltVO.mbrNm}"
                                            disabled
                                        />
                                    </td>
                                    <th scope="row">요양인정번호</th>
                                    <td>
                                        <input
                                            type="text"
                                            class="form-control large"
                                            placeholder="${mbrRecipientsVO.rcperRcognNo}"
                                            disabled
                                        />
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </fieldset>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary btn-large" onclick="$(this).closest('.modal').find('.modal-header .btn-close').click()">
                        확인
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>