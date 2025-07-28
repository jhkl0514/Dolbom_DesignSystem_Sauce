<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    <c:if test="${source == 'eroumcare'}">
        <link rel="stylesheet" href="${requestDomain}/html/page/admin/assets/style/new_modal.css?v=<spring:eval expression="@version['assets.version']"/>"/>
    </c:if>

    <div class="eroumon ${cssAddClass} modal_contents">
        <div class="modal_top">
            <h3>재가센터상담</h3>
            <p>
                상담받을 연락처
                <strong>${mbrTelno}</strong>
            </p>
        </div>
        
        <div class="modal_con">
            <p>상담정보</p>
            <p>어르신 돌봄 필요 시간</p>
        </div>
        <div class="senior_imgWrap">
            <div>
                <img
                    src="${requestDomain}/html/page/admin/assets/images/time_img${simpleTestVO.getCareTime()}.svg"
                    alt="${matchingCareTime[simpleTestVO.getCareTime()]} 이미지"
                />
            </div>
            <p>${matchingCareTime[simpleTestVO.getCareTime().toString()]}</p>
        </div>

        <c:if test="${source == 'eroumon'}">
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
                                    placeholder="${mbrRecipientsVO.getRecipientsNm()}"
                                    disabled
                                />
                            </td>
                            <th scope="row">요양인정번호</th>
                            <td>
                                <input
                                    type="text"
                                    class="form-control large"
                                    placeholder="${mbrRecipientsVO.getRcperRcognNo()}"
                                    disabled
                                />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </fieldset>
        </c:if>
    

        
    </div>
    