<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


  <div class="wrapper">

        <!-- 상단 뒤로가기 버튼 추가 -->
        <jsp:include page="/WEB-INF/jsp/app/matching/common/topButton.jsp">
            <jsp:param value="" name="addButton" />
            <jsp:param value="오픈소스 라이선스" name="addTitle" />
        </jsp:include>
    

        <main>
            <section class="default noPad">

                <div class="h12"></div>

                <div id="divLicenseList" class="box_normal padH16W20">
                </div>

            </section>
        </main>
        
  </div>
  <!-- wrapper -->
  

	<script>
		
		//오픈소스 목록 불러오기
		function loadLicenseJson() {
			fetch('/html/page/app/matching/license.json')
			.then(function(response) {
				return response.json();
			})
			.then(function(licenseJson) {
				var template = '';
				for(var i=0; i<licenseJson.length; i++) {
					var licenseInfo = licenseJson[i];
					template += '<div class="waves-effect list_link href font_sbms" onclick="goDetail(this);">'
						+ licenseInfo.libraryName 
						+ '</div>';
				}
				$('#divLicenseList').html(template);
			});
		}
		
		//오픈소스 상세 이동
		function goDetail(target) {
			var libraryName = $(target).text();
			location.href = '/matching/license/detail?libraryName=' + libraryName;
		}
		
	
		$(function() {
			$("body").addClass("back_gray");
			
			loadLicenseJson();
		});
	</script>