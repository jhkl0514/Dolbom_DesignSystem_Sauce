<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

			<div class="modal modal-default fade" id="${param.modalId}" tabindex="-1" aria-hidden="true">
	            <div class="modal-dialog modal-dialog-centered">
	                <div class="modal-content">
	                    <div class="modal-header">
	                        <h2 class="text-title">${param.title}</h2>
	                        <button data-bs-dismiss="modal" class="btn-close">닫기</button>
	                    </div>
	
	                    <div class="modal-body" style="padding:0; margin:20px 0px;">
	                    	<div class="grid-con" width="100%">
								<table id="popGrdMaster" width="98%"></table>
								<div id="popGrdPager"></div>
							</div>
	                    </div>
	                    
	                    <!--div class="modal-footer">
	                        <button type="button" class="btn btn-warning large w-full f_close" >닫기</button>
	                    </div-->
	                </div>
	            </div>
	        </div>

