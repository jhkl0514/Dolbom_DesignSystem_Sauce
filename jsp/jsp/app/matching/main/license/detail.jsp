<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


  <div class="wrapper">

        <!-- 상단 뒤로가기 버튼 추가 -->
        <jsp:include page="/WEB-INF/jsp/app/matching/common/topButton.jsp">
            <jsp:param value="" name="addButton" />
        </jsp:include>
    

        <main>
            <section class="default noPad">

                <div class="h12"></div>
                
                <div id="licenseDetail" style="padding:10px 20px; font-size:16px;"></div>

            </section>
        </main>
        
  </div>
  <!-- wrapper -->
  

	<script>
		var srchName = '${libraryName}';
	
		//오픈소스 상세 출력
		function loadLicenseJson() {
			fetch('/html/page/app/matching/license.json')
			.then(function(response) {
				return response.json();
			})
			.then(function(licenseJson) {
				for(var i=0; i<licenseJson.length; i++) {
					var licenseInfo = licenseJson[i];
					if (licenseInfo.libraryName === srchName) {
						var template = '⦁ Library Name : ' + licenseInfo.libraryName + '<br>';
						template += '⦁ Version : ' + licenseInfo.version + '<br>';
						if (licenseInfo._license) {
							template += '⦁ License : ' + licenseInfo._license + '<br>';	
						}
						template += '<br><br>'
						if (licenseInfo._licenseContent) {
							template += licenseInfo._licenseContent.replaceAll('\n', '<br>');	
						}
						
						$('#licenseDetail').html(template);
					}
				}
			});
		}
		
	
		$(function() {
			$("body").addClass("back_gray");
			
			loadLicenseJson();
		});
	</script>