<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
		<!-- 약관 보기 상세 팝업 -->
		
		<!-- modal_terms_view -->
		<div id="modal_termskind_view" class="modal fullscreen terms view" terms_kind="">

			<div class="modal_header">
			<h4 class="modal_title">개인정보 3자제공 동의</h4>
			<div class="close_x modal-close waves-effect"></div>
			</div>
	
			<div class="modal-content pad20 no_footer">
	
				<a class="input_basic fake_select bder_valid modal-trigger evt_history" href="#modal_termskind_history">이전 버전 보기</a>

				<div class="h16"></div>

				<div class="history_area">
					<iframe class="termsView" src="" width="100%" height="98%"></iframe>
				</div>
			</div>
	
		</div>


		
		<!-- modal_terms_view -->
		<div id="modal_termskind_history" class="modal bottom-sheet">

			<div class="modal_header">
				<h4 class="modal_title">이전 버전 보기</h4>
				<div class="close_x modal-close waves-effect"></div>
			</div>

			<div class="modal-content">

				<ul class="broad_area">
					<c:forEach var="itemOne" items="${modalTermsHistoryList}" varStatus="status">
						<c:if test="${modalTermsViewVO.getTermsDt() eq itemOne.getTermsDt()}">
							<li class="modal-close active" terms-no="${itemOne.getTermsNo()}">${itemOne.getTermsDt()}</li>
						</c:if>
						<c:if test="${modalTermsViewVO.getTermsDt() ne itemOne.getTermsDt()}">
							<li class="modal-close" terms-no="${itemOne.getTermsNo()}">${itemOne.getTermsDt()}</li>
						</c:if>
					</c:forEach>
				</ul>

				<div class="h32"></div>
		
			</div>
			<!-- modal-content --> 

		</div>


		
	// 추가 js
	<script>

		function fn_terms_view_modal_call(terms_kind){
			$('#modal_termskind_history').attr("terms_kind", terms_kind);
			$('#modal_termskind_view .evt_history').text("이전 버전 보기");

			callPostAjaxIfFailOnlyMsg(
					'/matching/terms/'+terms_kind+'/list.json', 
					{"mustCallbackJs":true},
					fn_terms_modal_view_list_cb
				);
		}

		function fn_terms_modal_view_list_cb(result){
			if (result.termsVO == undefined || result.termsList == undefined || result.termsList.length < 1){
				return;
			}

			$('#modal_termskind_view .modal_title').text(result.termsKindNm);
			$("#modal_termskind_view .modal-content .history_area iframe.termsView").attr("src", "/matching/terms/" + result.termsVO.termsNo)

			var ifor, ilen = result.termsList.length;
			var termsDt = result.termsVO.termsDt;

			var str;
			var itemOne;
			var list = [];
			for(ifor=0 ; ifor<ilen ; ifor++){
				itemOne =result.termsList[ifor];

				if (termsDt == itemOne.termsDt){
					str = '<li class="modal-close active" terms-no="'+itemOne.termsNo+'">'+itemOne.termsDt+'</li>';
				}else{
					str = '<li class="modal-close" terms-no="'+itemOne.termsNo+'">'+itemOne.termsDt+'</li>';
				}

				list.push(str);
			}

			$('#modal_termskind_history .broad_area').html(list.join(''));
			
			// 약관 보기 셀렉트 선택
			$('#modal_termskind_history .broad_area li').click(function() {

				$('#modal_termskind_history .broad_area li').removeClass("active");

				$(this).addClass("active")

				fn_terms_modal_history_clicked($(this));
			});
		}
			

		function fn_terms_modal_view_one_cb(result){
			$("#modal_termskind_view .modal-content .history_area").html(result.contentBody)
		}

		function fn_terms_modal_history_clicked(jobj){
			var thisTxt = jobj.text();

			$('#modal_termskind_view .evt_history').text(thisTxt);
			var termsNo = $('#modal_termskind_history').attr("terms_no");

			$("#modal_termskind_view .modal-content .history_area iframe.termsView").html("/matching/terms/" + termsNo)
			
		}
		
		$(function(){
		});
	</script>