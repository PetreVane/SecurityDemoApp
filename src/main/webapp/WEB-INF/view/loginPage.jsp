<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en" style="background: #ffffff;">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>LoginPage</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}resources/loginPage/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}resources/loginPage/fonts/ionicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}resources/loginPage/css/Login-Form-Dark.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}resources/loginPage/css/styles.css">
</head>

<body>
    <section class="login-dark" style="background: #ffffff;">

            <form:form method="post" action="${pageContext.request.contextPath}/authenticateUser" style="color: var(--orange);">

                <h2 class="sr-only">Login Form</h2>
                <div class="illustration">
                    <i class="icon ion-ios-locked-outline" style="color: var(--orange);"></i>
                </div>
                <div class="form-group">
                    <input class="form-control" type="text" name="username" placeholder="Username">
                </div>
                <div class="form-group">
                    <input class="form-control" type="password" name="password" placeholder="Password">
                </div>
                <c:if test="${param.error != null}">
                    <div class="alert alert-danger col-xs-offset-1 col-xs-10">
                        Sorry, you entered an invalid username or password
                    </div>
                </c:if>

                <c:if test="${param.logout != null}">
                    <div class="alert alert-warning col-xs-offset-1 col-xs-10">
                        You have been logged out!
                    </div>
                </c:if>

                <div class="form-group">
                    <button class="btn btn-primary btn-block text-dark" type="submit" style="background: var(--yellow);">Log In</button>
                </div>
                <a class="forgot" href="# Recover Pass Page Here">Forgot your email or password?</a>
            </form:form>


    </section>
    <script src="${pageContext.request.contextPath}resources/loginPage/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}resources/loginPage/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>