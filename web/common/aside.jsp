<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/12/25
  Time: 15:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>aside</title>
</head>
<body>
    <!-- 导航栏 -->
    <nav class="main-header navbar navbar-expand navbar-white navbar-light">
        <!-- 左侧导航栏链接 -->
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
            </li>
            <li class="nav-item">
                <select name="" id="user" class="form-control">
                    <option value="2707">李洪胜（学校用户）</option>
                    <option value="9693">陈华（学院用户）</option>
                    <option value="16067">舒宁（辅导员）</option>
                    <option value="0121201010922">马得福（学生）</option>
                </select>
            </li>
            <li class="nav-item" style="float: right">
                <select name="" id="roles" class="form-control">
                    <c:forEach items="${loginUser.roles}" var="role">
                        <option value="${role.id}">${role.name}</option>
                    </c:forEach>
                </select>
            </li>
        </ul>


    </nav>
    <!-- /.navbar -->

    <!-- 主侧边栏容器 -->
    <aside class="main-sidebar sidebar-dark-primary elevation-4">
        <!-- 品牌 Logo -->
        <a href="index3.html" class="brand-link">
            <img src="${pageContext.request.contextPath}/static/adminlte/dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
            <span class="brand-text font-weight-light">寒衣管理系统</span>
        </a>

        <!-- Sidebar -->
        <div class="sidebar">
            <!-- 侧边栏用户面板（可选） -->
            <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                <div class="image">
                    <img id="login_user_avatar" src="" class="img-circle elevation-2" alt="用户头像">
                </div>
                <div class="info">
                    <a href="${pageContext.request.contextPath}/pages/modifyAvatar.jsp" class="d-block">${loginUser.name}</a>
                </div>
            </div>

            <!-- 侧边栏菜单 -->
            <nav class="mt-2">
                <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                    <!-- 使用 .nav-icon 类添加图标，
                         或使用 font-awesome 或其他任何图标字体库 -->
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/batch/list" class="nav-link link-1st">
                            <i class="nav-icon fas fa-edit"></i>
                            <p>
                                批次列表
                            </p>
                        </a>
                    </li>
                </ul>
                <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                    <!-- 使用 .nav-icon 类添加图标，
                         或使用 font-awesome 或其他任何图标字体库 -->
                    <li class="nav-item has-treeview">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-edit"></i>
                            <p>
                                学生管理
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview" style="display: none;">
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/application/toApplicationAdd" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>提交申请</p>
                                </a>
                            </li>
                        </ul>
                        <ul class="nav nav-treeview" style="display: none;">
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/product/listByStudent" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>衣服列表</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>
                <c:if test="${sessionScope.loginUser.roleId >= 1}">
                <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                    <!-- 使用 .nav-icon 类添加图标，
                         或使用 font-awesome 或其他任何图标字体库 -->
                    <li class="nav-item has-treeview">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-edit"></i>
                            <p>
                                寒衣管理
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview" style="display: none;">
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/product/toProductAddPage" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>寒衣添加</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/product/list" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>寒衣列表</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>
                    <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                        <!-- 使用 .nav-icon 类添加图标，
                             或使用 font-awesome 或其他任何图标字体库 -->
                        <li class="nav-item has-treeview">
                            <a href="#" class="nav-link">
                                <i class="nav-icon fas fa-edit"></i>
                                <p>
                                    申请管理
                                    <i class="fas fa-angle-left right"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview" style="display: none;">
                                <li class="nav-item">
                                    <a href="${pageContext.request.contextPath}/application/waitAuditList" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>待审核</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="${pageContext.request.contextPath}/application/list" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>申请列表</p>
                                    </a>
                                </li>
                                    <li class="nav-item">
                                        <a href="${pageContext.request.contextPath}/application/getSta" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>申请统计</p>
                                        </a>
                                    </li>
                            </ul>
                        </li>
                    </ul>
                    <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                        <!-- 使用 .nav-icon 类添加图标，
                             或使用 font-awesome 或其他任何图标字体库 -->
                        <li class="nav-item has-treeview">
                            <a href="#" class="nav-link">
                                <i class="nav-icon fas fa-edit"></i>
                                <p>
                                    用户管理
                                    <i class="fas fa-angle-left right"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview" style="display: none;">
                                <li class="nav-item">
                                    <a href="${pageContext.request.contextPath}/whitelist/list" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>用户列表</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="${pageContext.request.contextPath}/application/list" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>申请列表</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="${pageContext.request.contextPath}/application/getSta" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>申请统计</p>
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </c:if>
            </nav>
            <!-- /.sidebar-menu -->
        </div>
        <!-- /.sidebar -->
    </aside>
</body>
</html>
<script src="${pageContext.request.contextPath}/static/adminlte/plugins/jquery/jquery.min.js"></script>
<script>
    $(function () {
        $("#roles").val(${sessionScope.loginUser.roleId})
        $("#user").val(${sessionScope.loginUser.sn})
        $("#user").change(function () {
            $.ajax({
                url:"${pageContext.request.contextPath}/whitelist/setByAjax",
                type:"post",
                data:{
                    sn:$(this).val(),
                    name:"111"
                },
                datatype:"json",
                success: function (res) {
                    if(res.data){
                        location.reload()
                    }
                }
            })
        })
        $("#roles").change(function () {
            $.ajax({
                url: "${pageContext.request.contextPath}/whitelist/changeRole",
                type: "post",
                data: {roleId: $(this).val()},
                dataType: "json",
                success: function (res) {
                    if(res.data){
                        window.location = "${pageContext.request.contextPath}/whitelist/main"
                    }
                }
            })
        })
    })
</script>
