<%--
  Created by IntelliJ IDEA.
  User: 孙程程
  Date: 2018/12/13
  Time: 8:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>下载</title>
    <link rel="shortcut icon" href="/images/common/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="/css/common.css">
</head>
<body>
<%@include file="../common/header.jsp"%>
    <div>
        <h3>文件信息</h3>
        <span><img src="${file.suffix.imgUrl}" alt="文件类型" style="width: 20px; height: 20px"></span>
        <span>${file.fileTitle}</span>
        <span>${file.fileCredit}</span>
        <span>${file.downloadNumber}</span>
        <br>
        <span><a href="/searchfile?fileType=${file.fileType}&school=${file.fileSchool}&keyWord=">${file.fileType}</a></span>
        <span><a href="/searchfile?fileType=全部&school=${file.fileSchool}&keyWord=">${file.fileSchool}</a></span>
        <br>
        <span>${file.user.userNickName}</span>
        <span>${file.user.userSchool}</span>
        <span>${file.user.dreamSchool}</span>
        <br>
        <span><a href="${file.fileUrl}" download="${file.fileTitle}">点击下载</a></span>
    </div>
    <div>
        <h3>相关文件</h3>
        <table>
            <tr>
                <td>图标</td>
                <td>文件</td>
                <td>用户</td>
                <td>类型</td>
                <td>学校</td>
                <td>积分</td>
                <td>下载次数</td>
            </tr>
            <c:forEach items="${relatedFileList}" var="f">
                <c:if test="${file.fileId != f.fileId}">
                <tr>
                    <td><img src="${f.suffix.imgUrl}" alt="文件类型" style="width: 20px; height: 20px"></td>
                    <td><a href="/download?fileId=${f.fileId}" style="color: black">${f.fileTitle}</a></td>
                    <td>${f.user.userNickName}</td>
                    <td>${f.fileType}</td>
                    <td>${f.fileSchool}</td>
                    <td>${f.fileCredit}</td>
                    <td>${f.downloadNumber}</td>
                </tr>
                </c:if>
            </c:forEach>
        </table>
    </div>
    <div>
        <h3>热门文件</h3>
        <table>
            <tr>
                <td>文件</td>
                <td>下载次数</td>
            </tr>
            <c:forEach items="${hotFileList}" var="hotFile">
                <tr>
                    <td><a href="/download?fileId=${hotFile.fileId}">${hotFile.fileTitle}</a></td>
                    <td>${hotFile.downloadNumber}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
<%@include file="../common/footer.jsp"%>
</body>
</html>
