<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<title><sitemesh:title/></title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<link type="image/x-icon" href="${ctx}/static/images/favicon.ico" rel="shortcut icon">
    <!--base css styles-->
    <link rel="stylesheet" href="${ctx}/static/assets/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="${ctx}/static/assets/bootstrap/bootstrap-responsive.min.css">
    <link rel="stylesheet" href="${ctx}/static/assets/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${ctx}/static/assets/normalize/normalize.css">

    <!--flaty css styles-->
    <link rel="stylesheet" href="${ctx}/static/styles/flaty.css">
    <link rel="stylesheet" href="${ctx}/static/styles/flaty-responsive.css">

<sitemesh:head/>
</head>

<body>
    <%@ include file="/WEB-INF/layouts/header.jsp"%>
    <div id="content">
        <sitemesh:body/>
    </div>
    <script src="${ctx}/static/assets/modernizr/modernizr-2.6.2.min.js"></script>
    <!--basic scripts-->
    <!--<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>-->
    <script>window.jQuery || document.write('<script src="${ctx}/static/assets/jquery/jquery-1.10.1.min.js"><\/script>')</script>
    <script src="${ctx}/static/assets/bootstrap/bootstrap.min.js"></script>
    <script src="${ctx}/static/assets/nicescroll/jquery.nicescroll.min.js"></script>

    <!--page specific plugin scripts-->
    <script src="${ctx}/static/assets/flot/jquery.flot.js"></script>
    <script src="${ctx}/static/assets/flot/jquery.flot.resize.js"></script>
    <script src="${ctx}/static/assets/flot/jquery.flot.pie.js"></script>
    <script src="${ctx}/static/assets/flot/jquery.flot.stack.js"></script>
    <script src="${ctx}/static/assets/flot/jquery.flot.crosshair.js"></script>
    <script src="${ctx}/static/assets/flot/jquery.flot.tooltip.min.js"></script>
    <script src="${ctx}/static/assets/sparkline/jquery.sparkline.min.js"></script>

    <!--flaty scripts-->
    <script src="${ctx}/static/js/flaty.js"></script>
</body>
</html>