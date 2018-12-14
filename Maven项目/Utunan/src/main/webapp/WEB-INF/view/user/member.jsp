<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="plate" value="myspace"/>
<!DOCTYPE html>
<html lang="zh-cn">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>欢迎来到Utunan</title>
    <link rel="shortcut icon" href="/images/common/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="/css/common.css">
    <link rel="stylesheet" href="/css/user/userhome.css">
</head>

<body>
<%@include file="../common/header.jsp" %>
<%@include file="common/usercard.jsp" %>
<div class="container" style="margin-top: 30px;">
    <div class="wrapper background">
        <div class="content" id="content">
            <div class="title">
                <span>个人资料</span>
            </div>
            <div class="userinfoform">
                <form id="userinfoform" action="/user/changeInfo" method="post">
                    <nav>
                        <li>
                            <label for="userNickName">昵&emsp;&emsp;称</label>
                            <input type="text" id="userNickName" name="userNickName" value="${User.userNickName}"
                                   placeholder="${User.userNickName}"/>
                        </li>
                        <li>
                            <label for="dreamSchool">目标院校</label>
                            <input type="text" id="dreamSchool" name="dreamSchool" value="${User.dreamSchool}"
                                   placeholder="${User.dreamSchool}"/>
                        </li>
                        <li>
                            <label for="userSchool">本科院校</label>
                            <input type="text" id="userSchool" name="userSchool" value="${User.userSchool}"
                                   placeholder="${User.userSchool}"/>
                        </li>
                        <li>
                            <label for="userTelephone">绑定手机</label>
                            <input type="hidden" id="userTelephone" name="userTelephone" value="${User.userTelephone}"/>
                            <span style="line-height: 32px;">${User.userTelephone}</span>
                            <span><a href="/user/settings#userfunction"><img src="/images/user/edit.svg"></a></span>
                        </li>
                        <li>
                            <label for="userEmail">绑定邮箱</label>

                            <input type="hidden" id="userEmail" name="userEmail" value="${User.userEmail}"
                                   placeholder="${User.userEmail}"/>
                            <span style="line-height: 32px;">${User.userEmail==null?"用户未设置邮箱":User.userEmail}</span>
                            <span><a href="/user/settings#changeemail"><img src="/images/user/edit.svg"></a></span>
                        </li>
                        <li>
                            <label for="examTime">考研年份</label>
                            <select name="examTime" id="examTime" autofocus="autofocus">
                                <c:forEach begin="2019" end="2024" var="i">
                                    <c:choose>
                                        <c:when test="${User.examTime==i}">
                                            <option value="${i}" selected="true">${i}</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="${i}">${i}</option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </select>
                        </li>
                        <li>
                            <label>注册时间</label>
                            <span style="line-height: 32px;"><fmt:formatDate value="${User.registerTime }" type="date"
                                                                             pattern="yyyy-MM-dd HH:mm:ss"/></span>
                        </li>
                        <li class="userop">
                            <button type="submit">提交</button>
                            <button type="reset">撤销</button>
                        </li>

                    </nav>
                </form>
            </div>
            /div>
        </div>
    </div>
    <%@include file="../common/footer.jsp" %>
</body>
<script src="/js/user/usercommon.js"></script>
<script src="/js/common/common.js"></script>
<script src="/js/jquery-1.8.3.min.js"></script>
<script src="/js/user/amazeui.min.js" charset="utf-8"></script>
<script src="/js/user/cropper.min.js" charset="utf-8"></script>
<script src="/js/user/custom_up_img.js" charset="utf-8"></script>
</html>