<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
		<!-- 본인과의 가족관계 팝업 -->

		<!-- modal_terms_view -->
		<div id="modal_recipient_relation_view" class="modal recipient relation view bottom-sheet" terms_kind="">

			<div class="modal_header">
			<h4 class="modal_title">본인과의 가족관계 수정</h4>
			<div class="close_x modal-close waves-effect"></div>
			</div>
	
			<div class="modal-content pad20 no_footer">
	
				<div class="h16"></div>

				<div class="family_tree_area">

                    <div class="tree">
                        <div class="dept1 w50p">
                            <div class="item grandpa" code="005" gender="M">
                                <span class="txt">할아버지</span>
                            </div>
                            <div class="item grandma" code="009" gender="W">
                                <span class="txt">할머니</span>
                            </div>
                        </div>
                    </div>
                    <div class="tree">
                        <div class="dept1">
                            <div class="item father" code="002" gender="M">
                                <span class="txt">아버지</span>
                            </div>
                            <div class="item mother" code="008" gender="W">
                                <span class="txt">어머니</span>
                            </div>
                        </div>
                        <div class="dept1">
                            <div class="item p_father" code="006" gender="M">
                                <span class="txt">배우자 아버지</span>
                            </div>
                            <div class="item p_mother" code="010" gender="W">
                                <span class="txt">배우자 어머니</span>
                            </div>
                        </div>
                    </div>
                    <div class="tree">
                        <div class="dept1">
                            <div class="item me" code="007">
                                <span class="txt">나(본인)</span>
                            </div>
                            <div class="item partner" code="001">
                                <span class="txt">배우자</span>
                            </div>
                        </div>
                    </div>
                    <div class="tree">
                        <div class="dept2">
                            <div class="item brother" code="004">
                                <span class="txt">형제자매</span>
                            </div>
                            <div class="item child" code="003">
                                <span class="txt">자녀</span>
                            </div>
                        </div>
                    </div>

                </div>
			</div>
	
		</div>


		
	// 추가 js
	<script>
		// async function fn_recipient_relation_modal_call(relationCd){
		// 	var popup = new JsMvpModalRecipientRelaction(window, '#modal_recipient_relation_view', 'modal_recipient_relation_view')
		// 
		// 	var answer = await popup.fn_show_popup({relationCd : '001'});
		// 	if (answer != 'confirm') { return }
		// 
		// 	var relation = popup.fn_selected_value();
		// }

		class JsMvpModalRecipientRelaction extends JsHouse2309PopupMaterialize{
			fn_init_sub_component(){
				var owner = this;
				
			}

			fn_show_cls_popup(param){
				if (param == undefined || param.relationCd == undefined || param.relationCd == ""){
					$(this._cls_info.pageModalfix + ' .family_tree_area div.item').removeClass('active');
				}else{
					$(this._cls_info.pageModalfix + ' .family_tree_area div.item[code!='+param.relationCd+']').removeClass('active');

					$(this._cls_info.pageModalfix + ' .family_tree_area div.item[code ='+param.relationCd+']').addClass('active');
				}
				
			}

			fn_selected_value(){
				var jobj = $(this._cls_info.pageModalfix + ' .family_tree_area div.item.active');

				var data = {relationCd:$('.family_tree_area div.item.active').attr("code")
							, relationNm:$('.family_tree_area div.item.active .txt').html()
						};

				if (jobj.attr("gender") != undefined){
					data.gender = jobj.attr("gender");
				}
				return data;
			}

			async fn_async(){
				var owner = this;

				$(owner._cls_info.pageModalfix + ' .modal-close').off('click');
				
				return new Promise((resolve, reject) => {
					$(owner._cls_info.pageModalfix + ' .family_tree_area div.item').off('click').on('click', function(){

						var code = $(this).attr('code');

						$(owner._cls_info.pageModalfix + ' .family_tree_area div.item[code!='+code+']').removeClass('active');
						$(owner._cls_info.pageModalfix + ' .family_tree_area div.item[code ='+code+']').addClass('active');

						owner.fn_close_popup();
						resolve('confirm');
					});
					
					$(owner._cls_info.pageModalfix + ' .modal-close').off('click') .on('click', function(){
						owner.fn_close_popup();
						resolve('reject');
					});
				  })
			}
		}

		$(function(){
		});
	</script>