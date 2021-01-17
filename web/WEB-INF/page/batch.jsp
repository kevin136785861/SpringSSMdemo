


<%@ page import="demo.domain.Batch" %>
<%@ page import="com.github.pagehelper.PageInfo" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/12/31
  Time: 14:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>主 页|员工管理</title>
    <!-- 告诉浏览器屏幕自适应 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Font Awesome -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/static/adminlte/plugins/fontawesome-free/css/all.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- 主题样式 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/adminlte/dist/css/adminlte.min.css">
    <!-- 离线 Google 字体: Source Sans Pro -->
    <link href="${pageContext.request.contextPath}/static/adminlte/dist/css/google.css?family=Source+Sans+Pro:300,400,400i,700"
          rel="stylesheet">
    <!-- layer -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/modules/layer/default/layer.css">
</head>
<body class="sidebar-mini" style="height: auto;">
<div class="wrapper">
    <jsp:include page="/common/aside.jsp"/>

    <!-- Content Wrapper. 包含页面内容 -->
    <div class="content-wrapper" style="min-height: 1200.88px;">
        <!-- 内容标题（页面标题） -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">学生管理</h1>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                        </ol>
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.container-fluid -->
        </div>
        <!-- /.content-header -->

        <!-- 主体内容 -->
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-8">
                        <!--学生表格-->
                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">
                                    <form action="${pageContext.request.contextPath}/batch/selectName" method="post">
                                    <input  type="text" placeholder="请输入"  name="search" id="search" />
                                    <input type="submit" id="subsearch" name="submit" value="提交" />
                                </form></h3>
                                <div class="card-tools">
                                    <div class="input-group input-group-sm" style="width: 150px;">
                                        <button type="button" class="btn btn-primary btn-sm btn_primary col-sm-10 "
                                                id="addOne">添&nbsp&nbsp加&nbsp&nbsp批&nbsp&nbsp次
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body table-responsive p-0">
                                <table class="table table-hover text-nowrap" style="text-align: center">
                                    <thead>
                                    <tr>
                                        <th>序号</th>
                                        <th>编号</th>
                                        <th>批次名</th>
                                        <th>申请开始时间</th>
                                        <th>申请结束时间</th>
                                        <th>选衣开始时间</th>
                                        <th>选衣结束时间</th>
                                        <th>困难等级</th>
                                        <th>状态</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${sessionScope.batchPageInfo.list}" var="batch" varStatus="status">
                                    <tr id="${batch.id}">
                                        <td>${status.count}</td>
                                        <td>${batch.id}</td>
                                        <td>${batch.name}</td>
                                        <td>${batch.applicationStartDate}</td>
                                        <td>${batch.applicationEndDate}</td>
                                        <td>${batch.registerStartDate}</td>
                                        <td>${batch.registerEndDate}</td>
                                        <td difficultyValue="${batch.difficultyLevel}">${batch.difficultyName}</td>
                                        <td>${batch.active==0?"已关闭":"已激活"}</td>
                                        <td>
                                            <c:if test="${batch.active==0}">
                                            <button type="button" class="btn btn-success btn-sm col-sm-4 btn_active"
                                                    id="mod_${batch.id}" Acticevalue="${batch.id}">激&nbsp&nbsp活
                                        </button></c:if>
                                            <c:if test="${batch.active==1}">
                                                <button type="button" class="btn btn-warning btn-sm col-sm-4 btn_closs"
                                                        id="mod_${batch.id}" ClossValue="${batch.id}">关&nbsp&nbsp闭
                                                </button>
                                            </c:if>
                                            <button type="button" class="btn btn-danger btn-sm btn_del col-sm-4 btn_del"
                                                    id="del_${batch.id}">删&nbsp&nbsp除
                                            </button>
                                            <button type="button" class="btn btn-primary btn-sm col-sm-4 btn_mod"
                                                    id="mod_${batch.id}">修&nbsp&nbsp改
                                            </button>
                                        </td>
                                    </tr>
                                    </c:forEach>

                                </table>
                            </div>
                            <!-- /.card-body -->
                            <div class="card-footer clearfix">
                                <ul class="pagination pagination-sm m-0 float-right">
                                    <c:if test="${!batchPageInfo.isFirstPage}">
                                        <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/batch/list?pageNo=${sessionScope.batchPageInfo.pageNum-1}&pageSize=${sessionScope.batchPageInfo.pageSize}">«</a></li>
                                    </c:if>
                                    <c:forEach items="${requestScope.batchPageInfo.navigatepageNums}" var="page" varStatus="index">
                                        <li class="page-item" id="${page}" ><a class="page-link" href="${pageContext.request.contextPath}/batch/list?pageNo=${page}&pageSize=${sessionScope.batchPageInfo.pageSize}">${page}</a></li>
                                    </c:forEach>
                                    <c:if test="${!batchPageInfo.isLastPage}">
                                        <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/batch/list?pageNo=${sessionScope.batchPageInfo.pageNum+1}&pageSize=${sessionScope.batchPageInfo.pageSize}">»</a></li>
                                    </c:if>
                                </ul>
                                <div style="display: inline-block;margin-left:10px">
                                    一共有${batchPageInfo.total}条信息，第${batchPageInfo.pageNum}页&nbsp&nbsp
                                    <select id="pages" class="">
                                        <option value="5">5</option>
                                        <option value="10">10</option>
                                        <option value="15">15</option>
                                    </select>
                                    &nbsp&nbsp跳转页数
                                    <input type="text" class="" id="gosize" >&nbsp&nbsp
                                    <button type="button" class="btn btn-sm btn-primary " id="gowhichpage">跳&nbsp&nbsp转
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.col-md-6 -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- 控制侧边栏内容在这里 -->
        <div class="p-3 control-sidebar-content"><h5>自定义 AdminLTE</h5>
            <hr class="mb-2">
            <div class="mb-1"><input type="checkbox" value="1" class="mr-1"><span>无导航栏边框</span></div>
            <div class="mb-1"><input type="checkbox" value="1" class="mr-1"><span>页面小号字体</span></div>
            <div class="mb-1"><input type="checkbox" value="1" class="mr-1"><span>导航栏小号字体</span></div>
            <div class="mb-1"><input type="checkbox" value="1" class="mr-1"><span>侧边栏小号字体</span></div>
            <div class="mb-1"><input type="checkbox" value="1" class="mr-1"><span>底部小号字体</span></div>
            <div class="mb-1"><input type="checkbox" value="1" class="mr-1"><span>侧边栏平面样式</span></div>
            <div class="mb-1"><input type="checkbox" value="1" class="mr-1"><span>侧边栏传统样式</span></div>
            <div class="mb-1"><input type="checkbox" value="1" class="mr-1"><span>紧凑侧边栏</span></div>
            <div class="mb-1"><input type="checkbox" value="1" class="mr-1"><span>侧边栏子级缩进</span></div>
            <div class="mb-1"><input type="checkbox" value="1" class="mr-1"><span>主侧边栏禁用悬停/获得焦点时自动展开</span></div>
            <div class="mb-4"><input type="checkbox" value="1" class="mr-1"><span>品牌小号字体</span></div>
            <h6>导航栏颜色</h6>
            <div class="d-flex">
                <div class="d-flex flex-wrap mb-3">
                    <div class="bg-primary elevation-2"
                         style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                    <div class="bg-secondary elevation-2"
                         style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                    <div class="bg-info elevation-2"
                         style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                    <div class="bg-success elevation-2"
                         style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                    <div class="bg-danger elevation-2"
                         style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                    <div class="bg-indigo elevation-2"
                         style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                    <div class="bg-purple elevation-2"
                         style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                    <div class="bg-pink elevation-2"
                         style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                    <div class="bg-navy elevation-2"
                         style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                    <div class="bg-lightblue elevation-2"
                         style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                    <div class="bg-teal elevation-2"
                         style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                    <div class="bg-cyan elevation-2"
                         style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                    <div class="bg-dark elevation-2"
                         style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                    <div class="bg-gray-dark elevation-2"
                         style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                    <div class="bg-gray elevation-2"
                         style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                    <div class="bg-light elevation-2"
                         style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                    <div class="bg-warning elevation-2"
                         style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                    <div class="bg-white elevation-2"
                         style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                    <div class="bg-orange elevation-2"
                         style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                </div>
            </div>
            <h6>强调颜色</h6>
            <div class="d-flex"></div>
            <div class="d-flex flex-wrap mb-3">
                <div class="bg-primary elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-warning elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-info elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-danger elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-success elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-indigo elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-lightblue elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-navy elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-purple elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-fuchsia elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-pink elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-maroon elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-orange elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-lime elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-teal elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-olive elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
            </div>
            <h6>暗色侧边栏颜色</h6>
            <div class="d-flex"></div>
            <div class="d-flex flex-wrap mb-3">
                <div class="bg-primary elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-warning elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-info elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-danger elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-success elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-indigo elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-lightblue elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-navy elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-purple elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-fuchsia elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-pink elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-maroon elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-orange elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-lime elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-teal elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-olive elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
            </div>
            <h6>亮色侧边栏颜色</h6>
            <div class="d-flex"></div>
            <div class="d-flex flex-wrap mb-3">
                <div class="bg-primary elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-warning elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-info elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-danger elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-success elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-indigo elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-lightblue elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-navy elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-purple elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-fuchsia elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-pink elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-maroon elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-orange elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-lime elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-teal elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-olive elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
            </div>
            <h6>品牌 LOGO 颜色</h6>
            <div class="d-flex"></div>
            <div class="d-flex flex-wrap mb-3">
                <div class="bg-primary elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-secondary elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-info elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-success elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-danger elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-indigo elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-purple elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-pink elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-navy elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-lightblue elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-teal elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-cyan elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-dark elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-gray-dark elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-gray elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-light elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-warning elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-white elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <div class="bg-orange elevation-2"
                     style="width: 40px; height: 20px; border-radius: 25px; margin-right: 10px; margin-bottom: 10px; opacity: 0.8; cursor: pointer;"></div>
                <a href="javascript:void(0)">清除</a></div>
        </div>
    </aside>
    <!-- /.control-sidebar -->

    <!-- Main Footer -->
    <footer class="main-footer">
        <strong>Copyright © 2014-2019 <a href="http://adminlte.io">AdminLTE.io</a>.</strong>
        保留所有权利。
        <div class="float-right d-none d-sm-inline-block">
            <b>版本</b> 3.0.5
        </div>
    </footer>
    <div id="sidebar-overlay"></div>

    <!--添加批次信息的模态对话框-->
    <%--添加批次模态框--%>
    <div class="modal fade" id="info" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">批次</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="batch-form" action="${pageContext.request.contextPath}/batch/insert" method="post" role="form">
                        <div class="card-body">
                            <div class="form-group">
                                <label>批次名字</label>
                                <input type="text" id="name" name="name" class="form-control" placeholder="">
                            </div>
                            <div class="form-group">
                                <label>申请开始时间</label>
                                <div class="input-group date" id="reservationdate1" data-target-input="nearest">
                                    <input type="date" id="applicationStartDate" name="applicationStartDate" class="form-control">

                                </div>
                            </div>
                            <div class="form-group">
                                <label>申请结束时间</label>
                                <div class="input-group date" id="reservationdate2" data-target-input="nearest">
                                    <input type="date" id="applicationEndDate" name="applicationEndDate" class="form-control ">

                                </div>
                            </div>
                            <div class="form-group">
                                <label>选衣开始时间</label>
                                <div class="input-group date" id="reservationdate3" data-target-input="nearest">
                                    <input type="date" id="registerStartDate" name="registerStartDate" class="form-control ">

                                </div>
                            </div>
                            <div class="form-group">
                                <label>选衣结束时间</label>
                                <div class="input-group date" id="reservationdate4" data-target-input="nearest">
                                    <input type="date" id="registerEndDate" name="registerEndDate" class="form-control ">

                                </div>
                            </div>
                            <div class="form-group">
                                <label >困难等级</label>
                                <select name="difficultyLevel" id="difficultyLevel" class="form-control">

                                </select>
                            </div>
                            <div class="modal-footer">
                                <button type="button" id="batch-close" class="btn btn-secondary">取消</button>
                                <button type="button" id="batch-save" class="btn btn-primary">保存</button>
                            </div>
                        </div>
                        <!-- /.card-body -->
                    </form>
                </div>
            </div>
        </div>
    </div>

</div>
</body>
</html>

<!-- 载入脚本 -->
<!-- ./wrapper -->
<script src="${pageContext.request.contextPath}/static/adminlte/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="${pageContext.request.contextPath}/static/adminlte/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- DataTables -->
<script src="${pageContext.request.contextPath}/static/adminlte/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/static/adminlte/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="${pageContext.request.contextPath}/static/adminlte/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="${pageContext.request.contextPath}/static/adminlte/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<script src="${pageContext.request.contextPath}/static/adminlte/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Select2 -->
<script src="${pageContext.request.contextPath}/static/adminlte/plugins/select2/js/select2.full.min.js"></script>
<!-- Bootstrap4 Duallistbox -->
<script src="${pageContext.request.contextPath}/static/adminlte/plugins/bootstrap4-duallistbox/jquery.bootstrap-duallistbox.min.js"></script>
<!-- InputMask -->
<script src="${pageContext.request.contextPath}/static/adminlte/plugins/moment/moment.min.js"></script><script src="${pageContext.request.contextPath}/static/adminlte/plugins/moment/locale/zh-cn.js"></script>
<script src="${pageContext.request.contextPath}/static/adminlte/plugins/inputmask/min/jquery.inputmask.bundle.min.js"></script>
<!-- date-range-picker -->
<script src="${pageContext.request.contextPath}/static/adminlte/plugins/daterangepicker/daterangepicker.js"></script>
<!-- bootstrap color picker -->
<script src="${pageContext.request.contextPath}/static/adminlte/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="${pageContext.request.contextPath}/static/adminlte/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- Bootstrap 开关 -->
<script src="${pageContext.request.contextPath}/static/adminlte/plugins/bootstrap-switch/js/bootstrap-switch.min.js"></script>
<!-- AdminLTE App -->
<script src="${pageContext.request.contextPath}/static/adminlte/dist/js/adminlte.min.js"></script>
<!-- 用于演示 AdminLTE  -->
<script src="${pageContext.request.contextPath}/static/adminlte/dist/js/demo.js"></script>
<script src="${pageContext.request.contextPath}/static/layer/layer.js"></script>
<!-- jQuery -->
<script src="${pageContext.request.contextPath}/static/adminlte/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="${pageContext.request.contextPath}/static/adminlte/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE -->
<script src="${pageContext.request.contextPath}/static/adminlte/dist/js/adminlte.js"></script>

<!-- OPTIONAL SCRIPTS -->
<script src="${pageContext.request.contextPath}/static/adminlte/plugins/chart.js/Chart.min.js"></script>
<script src="${pageContext.request.contextPath}/static/adminlte/dist/js/demo.js"></script>
<script src="${pageContext.request.contextPath}/static/adminlte/dist/js/pages/dashboard3.js"></script>
<script src="${pageContext.request.contextPath}/static/layui/lay/modules/layer.js"></script>
<!-- 自己的js -->
<script src="${pageContext.request.contextPath}/static/js/my.js"></script>

<script>
    $(function () {
        flag = 1;
        $.ajax({
            url:"${pageContext.request.contextPath}/batch/selectActive?active=1",
            type:"post",
            dataType:"json",
            success:function (result) {
                if (result.data) {
                    flag =0;
                }
            }
        })

        $("#addOne").click(function () {
            if (flag===0){
                $("#difficultyLevel").empty()
                $.ajax({
                    url: "${pageContext.request.contextPath}/dictionary/listByType?type="+'DIFFICULTY',
                    type: "get",
                    dataType: "json",
                    success: function (result) {
                        $(result.data).each(function (index,item) {
                            $("#difficultyLevel").append($("<option value='"+item.itemValue+"'>"+item.itemName+"</option>"))
                        })
                    }
                })
                $("#info").modal("show");
                document.getElementById("batch-form").reset();
            } else {
                layer.msg("存在已激活的批次",{offset: '50%, 50%',icon:2,time:2000})
            }
        })
        $("#${sessionScope.batchPageInfo.pageNum}").addClass("active");
        $("#pages").change(function () {
            window.location ="${pageContext.request.contextPath}/batch/list?pageNo=1&pageSize="+$(this).val();
        })
        $("#pages").val(${sessionScope.batchPageInfo.pageSize})
        $("#gowhichpage").click(function () {
            var page = ${sessionScope.batchPageInfo.pages}
            if($("#gosize").val() <= page){
                window.location ="${pageContext.request.contextPath}/batch/list?pageNo="+$("#gosize").val()+"&pageSize="+${sessionScope.batchPageInfo.pageSize};
            }else {
                layer.msg("请重新输入跳转页数", {time: 1000, offset: '50%, 50%'});
            }
        })
        $("#batch-save").click(function () {
            //一系列的验证   时间合理化
            if(new Date($("#applicationStartDate").val()) > new Date($("#applicationEndDate").val())){
                layer.msg("时间有误")
                return
            }
            $.ajax({
                url:"${pageContext.request.contextPath}/batch/insert",
                type:"post",
                data:$("#batch-form").serialize(),
                dataType:"json",
                success:function (result) {
                    layer.msg("操作成功",{icon:1,time:1000},function () {
                        window.location="${pageContext.request.contextPath}/batch/list"
                    })
                }})
        })
        $(".btn_active").click(function () {
            if (flag===0){
                var id = $(this).attr("Acticevalue");
                layer.confirm("是否要激活本批次",{offset: '50%, 50%',icon:7,title:"提示"},function (index) {
                    var active = 1;
                    $.ajax({
                        url:"${pageContext.request.contextPath}/batch/update?id="+id+"&active="+active,
                        type:"post",
                        dataType:"json",
                        success:function (result) {
                            layer.msg("激活成功",{offset: '50%, 50%',icon:1,time:2000},function () {
                                window.location="${pageContext.request.contextPath}/batch/list?pageNo=${sessionScope.batchPageInfo.pageNum}&pageSize=${sessionScope.batchPageInfo.pageSize}";
                            })
                        }

                    })
                    layer.close(index);
                })
            }else{
                layer.msg("存在已激活的批次",{offset: '50%, 50%',icon:2,time:2000})
            }
        })
        $(".btn_closs").click(function () {
            var id = $(this).attr("ClossValue");
            layer.confirm("是否要关闭本批次",{offset: '50%, 50%',icon:7,title:"提示"},function (index) {
                var active = 0;
                $.ajax({
                    url:"${pageContext.request.contextPath}/batch/update?id="+id+"&active="+active,
                    type:"post",
                    dataType:"json",
                    success:function (result) {
                        layer.msg("关闭成功",{offset: '50%, 50%',icon:1,time:2000},function () {
                            window.location="${pageContext.request.contextPath}/batch/list?pageNo=${sessionScope.batchPageInfo.pageNum}&pageSize=${sessionScope.batchPageInfo.pageSize}";
                        })
                    }

                })
                layer.close(index);
            })
        })
        $(".btn_mod").click(function () {
            var row = $(this).parent().parent();
            //显示模态框
            $("#info").modal("show");
            $("#difficultyLevel").empty()
            $.ajax({
                url: "${pageContext.request.contextPath}/dictionary/listByType?type="+'DIFFICULTY',
                type: "get",
                dataType: "json",
                async:false,
                success: function (result) {
                    $(result.data).each(function (index,item) {
                        $("#difficultyLevel").append($("<option value='"+item.itemValue+"'>"+item.itemName+"</option>"))
                    })
                }
            })
            $("#name").val($(row.find("td:eq(2)")).text())
            $("#applicationStartDate").val($(row.find("td:eq(3)")).text())
            $("#applicationEndDate").val($(row.find("td:eq(4)")).text())
            $("#registerStartDate").val($(row.find("td:eq(5)")).text())
            $("#registerEndDate").val($(row.find("td:eq(6)")).text())
            $("#difficultyLevel").val($(row.find("td:eq(7)")).attr("difficultyValue"))
        })
    });


</script>