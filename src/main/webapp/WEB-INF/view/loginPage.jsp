<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en" style="background: #ffffff;">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>LoginPage</title>
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/loginPage/bootstrap/css/bootstrap.min.css">--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/loginPage/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/loginPage/fonts/ionicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/loginPage/css/Login-Form-Dark.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/loginPage/css/styles.css">
</head>

<body>
    <section class="login-dark" style="background: #ffffff;">
        <form:form  action="${pageContext.request.contextPath}/authenticateUser" method="POST">
            <form method="post" style="color: var(--orange);">
                <h2 class="sr-only">Login Form</h2>
                <div class="illustration"><i class="icon ion-ios-locked-outline" style="color: var(--orange);"></i></div>
                <div class="form-group"><input class="form-control" type="text" name="username" placeholder="Username"></div>
                <div class="form-group"><input class="form-control" type="password" name="password" placeholder="Password"></div>
                <div class="form-group"><button class="btn btn-primary btn-block text-dark" type="submit" style="background: var(--yellow);">Log In</button></div><a class="forgot" href="# Recover Pass Page Here">Forgot your email or password?</a>
            </form>
        </form:form>

    </section>
    <script src="${pageContext.request.contextPath}/resources/loginPage/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/loginPage/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>