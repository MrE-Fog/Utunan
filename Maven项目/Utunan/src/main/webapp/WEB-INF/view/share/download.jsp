<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
    <script type="text/javascript">

        function check(form) {
            if (form.operate.value=="notLogin") {
                alert("请先登录！")
                return false;
            }
            if (form.operate.value=="lackOfIntegral") {
                alert("您的积分不足，快去发帖、评论赚积分吧！")
                return false;
            }
            document.form1.submit();
        }
    </script>
</head>
<body>
<%@include file="../common/header.jsp"%>
    <div>
        <h3>文件信息</h3>
        <div>
            <ul class="list">
                <c:forEach items="${fileList}" var="file" varStatus="stat">
                    <c:choose>
                        <c:when test="${file.fileType == '招生简章' || file.fileType == '招生专业目录'}">
                            <c:if test="${file.isExamine == 1}">
                                <li>
                                    <img src="${file.suffix.imgUrl}" alt="文件类型" style="width: 20px; height: 20px">
                                    <a href="/download?fileId=${file.fileId}" style="color: red">${file.fileTitle}</a>
                                        ${file.user.userNickName}
                                    <a href="/searchfile?fileType=${file.fileType}&school=${file.fileSchool}&keyWord=">${file.fileType}</a>
                                    <a href="/searchfile?fileType=全部&school=${file.fileSchool}&keyWord=">${file.fileSchool}</a>
                                    积分：${file.fileCredit}
                                    下载量：${file.downloadNumber}
                                </li>
                            </c:if>
                        </c:when>
                        <c:otherwise>
                            <li>
                                <img src="${file.suffix.imgUrl}" alt="文件类型" style="width: 20px; height: 20px">
                                <a href="/download?fileId=${file.fileId}" style="color: red">${file.fileTitle}</a>
                                    ${file.user.userNickName}
                                <a href="/searchfile?fileType=${file.fileType}&school=${file.fileSchool}&keyWord=">${file.fileType}</a>
                                <a href="/searchfile?fileType=全部&school=${file.fileSchool}&keyWord=">${file.fileSchool}</a>
                                积分：${file.fileCredit}
                                下载量：${file.downloadNumber}
                            </li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </ul>
        </div>
        <span><a href="/searchfile?fileType=${file.fileType}&school=${file.fileSchool}&keyWord=">${file.fileType}</a></span>
        <span><a href="/searchfile?fileType=全部&school=${file.fileSchool}&keyWord=">${file.fileSchool}</a></span>
        <br>
        <span>${file.user.userNickName}</span>
        <span>${file.user.userSchool}</span>
        <span>${file.user.dreamSchool}</span>
        <br>
        <form name="form1" action="/downloadfile" method="post" onsubmit="return check(this)" >
            <input type="hidden" name="fileId" value="${file.fileId}">
            <input type="hidden" name="operate" value="${operate}">
            <input type="submit" value="点击下载"/>
        </form>
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
