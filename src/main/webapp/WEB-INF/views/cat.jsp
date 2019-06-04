<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js" type="text/javascriptja"></script>
    <link rel="stylesheet" href="maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <title>Title</title>
</head>
<script>
    var service = 'http://localhost:8080/cat/'
    
    var RestGetAll = function () {
        $.ajax({
            type:'GET',
            url:service + '/all',
            datatype:'json',
            accept:'json',
            contentType:'application/json;utf-8',
            async:false,
            success: function (result) {
                $('#response').html(JSON.stringify(result))
            },
            error: function (jqXHR, testStatus, errorThrown) {
                $('#response').html(JSON.stringify(jqXHR))
            }
        });
    };

    var RestGet = function (id) {
        $.ajax({
            type:'GET',
            url:service + '/get/' + id,
            datatype:'json',
            accept:'json',
            contentType:'application/json;utf-8',
            async:false,
            success: function (result) {
                $('#response').html(JSON.stringify(result))
            },
            error: function (jqXHR, testStatus, errorThrown) {
                $('#response').html(JSON.stringify(jqXHR))
            }
        });
    };


    var RestPost = function (name, description) {
        var JSONObject = {
            'name' : name,
            'description': description
        }

        $.ajax({
            type:'POST',
            url:service + '/add',
            datatype:'json',
            data: JSON.stringify(JSONObject),
            accept:'json',
            contentType:'application/json;utf-8',
            async:false,
            success: function (result) {
                $('#response').html(JSON.stringify(result))
            },
            error: function (jqXHR, testStatus, errorThrown) {
                $('#response').html(JSON.stringify(jqXHR))
            }
        });
    };
</script>
<body>
<h1>Cat menu</h1>

<table class = "table">
    <tr>
        <th>Request type</th>
        <th>URL</th>
        <th>Value</th>
    </tr>
    <tr>
        <td>Get all cats - <code><strong>GET</strong></code></td>
        <td>/cat/all/</td>
        <td>
            <button type="button" onclick="RestGetAll">try</button>
        </td>
    </tr>
    <tr>
        <td>Get cat by id - <code><strong>GET</strong></code></td>
        <td>/cat/get/{id}</td>
        <td>
            id:<input id="GetCatById" value="1"/>

            <button type="button" onclick="RestGet($('#getCatById').val())">try</button>
        </td>
    </tr>
    <tr>
        <td>Add new cat - <code><strong>POST</strong></code></td>
        <td>/cat/add</td>
        <td>
            name:<input id="catName" value="Barsik"/>
            description:<input id="catDescription" value="good"/>

            <button type="button" onclick="RestPost($('#getCatById').val(), $('#catDescription').val())">try</button>
        </td>
    </tr>
</table>

<div class="panel panel-default">
    <div class="page-heading">
        <strong RESPONSE></strong>
    </div>
    <div class="panel-body" id="response"></div>
</div>
</body>
</html>