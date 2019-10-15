<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<form id="form1" enctype="multipart/form-data">
<input id="file" type="file" value="选择文件" />
<input id="btnUp" onclick="upload()" type="button" value="上传" />
</form>
</body>
<script type="text/javascript">
    function upload() {
        var file = document.getElementById("form1");
        var f= new FormData(file);
        //1.创建异步对象（小浏览器）
        var req = new XMLHttpRequest();
        //2.设置参数
        req.open("post", "TestServlet", true);
        //3.设置 请求 报文体 的 编码格式（设置为 表单默认编码格式）
        req.setRequestHeader("Content-Type", "multipart\\/form-data; boundary=" + Date.now().toString(16));// application/x-www-form-urlencoded
        //4.设置回调函数
        req.onreadystatechange = function () {
            //请求状态readyState=4准备就绪,服务器返回的状态码status=200接收成功
            if (req.readyState == 4 && req.status == 200) {
                if (req.responseText != "error") {
                    //changeName(req.responseText);

                }
            }
        };
        //4.发送异步请求
        req.send(f);//post传参在此处
    }
</script>



</html>
