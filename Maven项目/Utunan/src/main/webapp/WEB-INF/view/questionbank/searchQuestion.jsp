<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 孙程程
  Date: 2018/12/3
  Time: 16:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>在无边无际的题库中摸索</title>
</head>
<body>
    <c:if test="${empty searchValue}">
        <form action="/searchResult" method="post">
            <input type="text" name="searchValue" value="${totleQuestion}">
            <input type="submit" value="好题尽在优图南">
        </form>
    </c:if>
    <c:if test="${not empty searchValue}">
        <table>
            <tr>
                <td>题目ID</td>
                <td>章节名称</td>
                <td>题目内容</td>
                <td>题目类型</td>
            </tr>
            <c:forEach items="${questionList}" var="question">
            <tr>
                <td>${question.questionId}</td>
                <td>${question.chapterName}</td>
                <td>${question.questionContent}</td>
                <td>${question.questionType}</td>
            </tr>
            </c:forEach>
        </table>
        <nav id="page" class="page">
            <li class="home"><a href="/${url }?searchValue=${searchValue}">首页</a></li>
            <li class="next"><a href="/${url }?searchValue=${searchValue}&pageNum=${PageInfo.prePage}">上一页</a></li>
            <c:forEach var="i" begin="${PageInfo.navigateFirstPage}" end="${PageInfo.navigateLastPage}">
                <li class="pagenum"><a name="${i}" href="/${url }?searchValue=${searchValue}&pageNum=${i}">${i}</a></li>
            </c:forEach>
            <c:choose>
                <c:when test="${PageInfo.nextPage==0}">
                    <li class="next"><a href="/${url }?searchValue=${searchValue}&pageNum=${PageInfo.pages}">下一页</a></li>
                </c:when>
                <c:otherwise>
                    <li class="next"><a href="/${url }?searchValue=${searchValue}&pageNum=${PageInfo.nextPage}">下一页</a></li>
                </c:otherwise>
            </c:choose>
            <li class="tail"><a href="/${url }?searchValue=${searchValue}&pageNum=${PageInfo.pages}">尾页</a></li>
        </nav>
    </c:if>
</body>
</html>
