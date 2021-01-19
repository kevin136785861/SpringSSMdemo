<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>寒衣添加</title>
    <!-- 告诉浏览器屏幕自适应 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Font Awesome -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/static/adminlte/plugins/fontawesome-free/css/all.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- 主题样式 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/adminlte/dist/css/adminlte.min.css">
    <!-- summernote -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/static/adminlte/plugins/summernote/summernote-bs4.css">
    <!-- 离线 Google 字体: Source Sans Pro -->
    <link href="/AdminLTE/AdminLTE-3.x/dist/css/google.css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
    <!-- 导航栏 -->
    <jsp:include page="/common/aside.jsp"></jsp:include>
    <!-- /.navbar -->

    <!-- 主侧边栏容器 -->

    <!-- Content Wrapper. 包含页面内容 -->
    <div class="content-wrapper">
        <!-- 内容标题（页面标题） -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>文本编辑器</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">主页</a></li>
                            <li class="breadcrumb-item active">文本编辑器</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <!-- 主体内容 -->
        <section class="content">
            <div class="row">
                <div class="col-md-6">
                    <div class="card card-info">
                        <div class="card-header">
                            <h3 class="card-title">竖排表单</h3>
                        </div>
                        <!-- /.card-header -->
                        <!-- form start -->
                        <form class="form-horizontal" action="${pageContext.request.contextPath}/product/insert" enctype="multipart/form-data"
                              method="post">
                            <div class="card-body">
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">批次</label>
                                    <div class="col-sm-10">
                                        <select name="batchId" id="batchId" class="form-control">
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">款式</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="name" id="name" placeholder="款式">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label  class="col-sm-2 col-form-label">性别</label>
                                    <div class="col-sm-10">
                                        <select name="gender" id="gender" class="form-control">
                                            <option value="M">男款</option>
                                            <option value="F">女款</option>
                                            <option value="MF">男女款</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label  class="col-sm-2 col-form-label">编码</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="productNumber" class="form-control" id="productNumber"
                                               placeholder="编码">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label  class="col-sm-2 col-form-label">规格</label>
                                    <div class="col-sm-10">
                                        <div id="sku">
                                            <%--<p><input type="text" name="skuName"><button type="button" class="sku-delete">删除</button></p>--%>
                                        </div>
                                        <button type="button" id="addSku" class="btn btn-default">添加</button>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label  class="col-sm-2 col-form-label">图片</label>
                                    <div class="col-sm-10">
                                        <input type="file" name="imgs" >
                                        <input type="file" name="imgs" >
                                        <input type="file" name="imgs" >
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label  class="col-sm-2 col-form-label">尺码表</label>
                                    <div class="col-sm-10">
                                        <div class="card card-outline card-info">
                                            <!-- /.card-header -->
                                            <div class="card-body pad">
                                                <div class="mb-3">
                <textarea class="textarea" placeholder="在这里填写内容" id="description" name="description"
                          style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"></textarea>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <!-- /.card-body -->
                            <div class="card-footer">
                                <button type="submit" class="btn btn-info">保存</button>
                            </div>
                            <!-- /.card-footer -->
                        </form>
                    </div>

                </div>
                <!-- /.col-->
            </div>
            <!-- ./row -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- 控制侧边栏内容在这里 -->
    </aside>
    <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->
<!-- jQuery -->
<script src="${pageContext.request.contextPath}/static/adminlte/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="${pageContext.request.contextPath}/static/adminlte/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="${pageContext.request.contextPath}/static/adminlte/dist/js/adminlte.min.js"></script>
<!-- 用于演示 AdminLTE  -->
<script src="${pageContext.request.contextPath}/static/adminlte/dist/js/demo.js"></script>
<!-- Summernote -->
<script src="${pageContext.request.contextPath}/static/adminlte/plugins/summernote/summernote-bs4.min.js"></script>
<script src="${pageContext.request.contextPath}/static/adminlte/plugins/summernote/lang/summernote-zh-CN.min.js"></script>
<script>
    $(function () {
        $('.textarea').summernote({lang: 'zh-CN'})

        $.ajax({
            url: "${pageContext.request.contextPath}/batch/listByAjax",
            type: "get",
            dataType: "json",
            success: function (res) {
                if (res.data != null) {
                    $(res.data.list).each(function (idnex, item) {
                        var $new = $("<option value='" + item.id + "'>" + item.name + "</option>")
                        $("#batchId").append($new)
                    })
                    $("#batchId").val(res.data.curBatch.id)
                }
            }
        })

        $("#addSku").click(function () {
            //<p><input type="text" name="skuName"><button type="button" class="sku-delete">删除</button></p>
            $("#sku").append($("<p><input type=\"text\" name=\"skuName\"><button type=\"button\" class=\"sku-delete\">删除</button></p>"))
            $(".sku-delete").click(function () {
                $(this).parent().remove()
            })
        })
    })
</script>
</body>
</html>

