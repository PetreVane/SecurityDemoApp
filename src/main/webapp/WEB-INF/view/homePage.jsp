<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>

    <head>
        <title> Home Page </title>
    </head>

    <body>

        Hello world This is the login page!

    <form:form action="${pageContext.request.contextPath}/logout" method="post">

        <input type="submit" value="Logout" />

    </form:form>

    </body>


</html>