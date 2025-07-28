<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


				<!-- 사업소 선택 -->
                <div class="modal fade" id="bplcModal" tabindex="-1">
                    <div class="modal-dialog modal-2xl modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <p>장기요양기관 선택</p>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="close"></button>
                            </div>
                            <div class="modal-body">
								
                                <ul class="nav tab-list tab-full">
									<li class="nav-item">
										<a class="active" data-bs-toggle="pill" data-bs-target="#fieldRecmd" data-rcmdtn-yn="Y" 
											type="button" role="tab" aria-controls="fieldRecmd" aria-selected="true">추천 장기요양기관</a>
									</li>
									<li class="nav-item">
										<a data-bs-toggle="pill" data-bs-target="#fieldAll" data-rcmdtn-yn=""  
											type="button" role="tab" aria-controls="fieldAll" aria-selected="true">장기요양기관 찾기</a>
									</li>
                                </ul>
                                <div class="tab-content mt-5">
									<div>
										<div  class="tab-pane fade active show" id="fieldRecmd">
											<table class="table-detail">
												<colgroup>
													<col class="w-43">
													<col>
													<col class="w-43">
													<col>
												</colgroup>
												<tbody>
													<tr>
														<th scope="row"><label >인정등급 대리신청</label></th>
														<td colspan="3">${htmlDrawMap.get("htmlRcmdtnInsteadRcperrcognYn")}</td>
													</tr>
												</tbody>
											</table>
										</div>
										<div  class="tab-pane fade" id="fieldAll">
											<table class="table-detail">
												<colgroup>
													<col class="w-43">
													<col>
													<col class="w-43">
													<col>
												</colgroup>
												<tbody>
													<tr>
														<th scope="row"><label for="modalSrchSido">시/도 선택</label></th>
														<td>
															<select name="modalSrchSido" id="modalSrchSido" class="form-control w-52">
																<option value="">선택</option>
															</select>
														</td>
														<th scope="row"><label for="modalSrchGugun">구/군 선택</label></th>
														<td>
															<select name="modalSrchGugun" id="modalSrchGugun" class="form-control w-52">
																<option value="">선택</option>
															</select>
														</td>
													</tr>
													<tr>
														<th scope="row"><label for="modalSrchText">장기요양기관명</label></th>
														<td><input type="text" class="form-control w-full" id="modalSrchText" name="modalSrchText"></td>
														<th scope="row"><label for="modalSrchId">장기요양기관ID</label></th>
														<td><input type="text" class="form-control w-full" id="modalSrchId" name="modalSrchId"></td>
													</tr>
													<tr>
														<th scope="row"><label >상담가능 유형</label></th>
														<td>${htmlDrawMap.get("htmlAllConsltAbleType")}</td>
														<th scope="row"><label >인정등급 대리신청</label></th>
														<td>${htmlDrawMap.get("htmlAllInsteadRcperrcognYn")}</td>
													</tr> 
													<tr>
														<th scope="row"><label >L번호 미보유자 처리</label></th>
														<td>${htmlDrawMap.get("htmlAllHandleNoRcperrcognYn")}</td>
														<th scope="row"><label >인증서 등록</label></th>
														<td>${htmlDrawMap.get("htmlAllConsltAutoTy")}</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
									
									<div class="btn-group mt-4">
										<button type="button" class="btn-primary large w-36" id="modalSrchBplcBtn">검색</button>
									</div>

									<p class="mt-1 text-title2">장기요양기관 목록</p>
									<!-- 일반 테이블-->
									<table id="popGrdMaster" width="98%"></table>
									 <div id="popGrdPager"></div>
									

                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn large btn-primary w-36 f_modalSelBplc">선택</button>
                                <button type="button" class="btn large btn-secondary w-36 f_modalCancel" data-bs-dismiss="modal" aria-label="close">취소</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- //사업소 선택 -->

<script>
</script>