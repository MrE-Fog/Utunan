<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="plate" value="directioncollector"/>

<!DOCTYPE html>
<html lang="zh-cn">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>欢迎来到Utunan</title>
    <link rel="stylesheet" href="/css/common.css">
    <link rel="stylesheet" href="/css/user/directioncollector.css">
    <link rel="stylesheet" href="/css/user/usercommon.css">
    <link rel="shortcut icon" href="/images/common/favicon.ico" type="image/x-icon">
    <script> var pagenum="${PageInfo.pageNum}"</script>
</head>

<body>
<%@include file="../common/header.jsp" %>
<%@include file="common/usercard.jsp"%>
<div class="container" style="margin-top: 30px;">
    <div class="wrapper background">
        <%@include file="common/userfunction.jsp"%>
        <div class="content">
            <div class="title">
                <span>院系收藏</span>
            </div>
            <table border="0" cellpadding="6" cellspacing="0">
                <c:choose>
                    <c:when test="${PageInfo.pages==0}">

                    </c:when>
                    <c:otherwise>
                        <tr>
                            <th style="width:150px;height: 50px;">招生单位</th>
                            <th style="width:120px;">院系名称</th>
                            <th style="width:80px;">学位类型</th>
                            <th style="width:160px;">专业</th>
                            <th style="width:80px">其他</th>
                            <th style="width:40px;"></th>
                        </tr>
                    </c:otherwise>
                </c:choose>

                <c:forEach items="${Directions}" var="D">
                    <tr>
                        <td style="height: 50px;">${D.schoolName}</td>
                        <td>${D.collegeName}</td>
                        <td>${D.degreeType}</td>
                        <td>${D.directionName}</td>
                        <td><a href="">详情</a></td>
                        <td><a href="/user/directioncollector/${D.directionId}"><img src="/images/user/delete.svg"></a></td>
                    </tr>
                </c:forEach>
            </table>
            <%@include file="common/page.jsp"%>
        </div>
    </div>
</div>
<%@include file="../common/footer.jsp" %>
</body>
<script>
    trs=document.getElementsByTagName("tbody")[0].getElementsByTagName('tr');
    console.log(trs);
    if(trs.length>1){
        for(var i=1;i<=trs.length;i=i+2){
            trs[i].style.backgroundColor='rgba(0,150,136,0.1)';
        }
    }
</script>
<script src="/js/user/usercommon.js"></script>
<script src="/js/common/common.js"></script>
</html>