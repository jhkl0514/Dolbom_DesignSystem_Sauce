<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<ul class="nav tab-list tab-full">
	<li><a href="./bplc" ${fn:indexOf(_curPath,'/bplc') > -1 ? 'class="active"' : ''}>기관 별</a></li>
	<li><a href="./dt" ${fn:indexOf(_curPath,'/dt') > -1 ? 'class="active"' : ''}>신청일 별</a></li>
</ul>
