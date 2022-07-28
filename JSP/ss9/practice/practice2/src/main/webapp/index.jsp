<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 27/07/22
  Time: 2:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Title</title>
  </head>
  <style type="text/css">
    .login{
      height: 180px;
      margin: 0;
      padding: 10px;
      border: 1px red solid;
      background-color: bisque;
    }

    .login input{
      padding: 5px;
      margin: 5px;
    }
  </style>
  <body>
  <form method="post" action="/login">
    <div class="login">
      <h2>Login</h2>
      <input type="text" name="username" size="30" placeholder="username">
      <input type="password" name="password" size="30" placeholder="password">
      <input type="submit" value="Sign-in">
    </div>
  </form>
  </body>
</html>
