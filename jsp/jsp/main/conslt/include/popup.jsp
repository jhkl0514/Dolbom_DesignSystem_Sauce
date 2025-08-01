<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="x-ua-compatible" content="ie=edge">

    <title></title>

    <!-- plugin -->
    <link rel="stylesheet" href="/html/core/vendor/swiperjs/swiper-bundle.css">
    <script src="/html/core/vendor/jquery/jquery-3.6.0.min.js"></script>
    <script src="/html/core/vendor/swiperjs/swiper-bundle.min.js"></script>
    <script src="/html/core/vendor/masonry/masonry.pkgd.min.js"></script>

    <link rel="stylesheet" href="/html/page/index/assets/style/style.min.css">
</head>
<body>
	<div class="p-4 md:p-5">
		<p class="text-xl text-center font-bold md:text-2xl">장기요양기관</p>
		<table class="table-list text-center mt-4 md:mt-5">
			<colgroup>
				<col class="w-[18%] min-w-15">
				<col>
			</colgroup>
			<thead>
				<tr>
					<th scope="col"><p>No</p></th>
					<th scope="col"><p>업체명</p></th>
				</tr>
			</thead>
			<tbody>
				<tr class="top-border">
					<td></td>
					<td></td>
				</tr>
				<c:forEach var="resultList" items="${bplcList}" varStatus="status">
					<tr>
						<td>${status.index +1}</td>
						<td>${resultList.bplcNm }</td>
					</tr>
				</c:forEach>
				<tr class="bot-border">
					<td></td>
					<td></td>
				</tr>
			</tbody>
		</table>
	</div>
</body>