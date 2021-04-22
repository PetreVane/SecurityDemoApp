<%--suppress ALL --%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Customer-Details</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/detailsForm-assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/detailsForm-assets/css/Highlight-Clean.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/detailsForm-assets/css/Responsive-Form-1.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/detailsForm-assets/css/Responsive-Form.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/detailsForm-assets/css/styles.css">
</head>

<body>
    <section class="highlight-clean" style="text-align: center;">
        <div class="container">
            <div class="intro">
                <h2 class="text-center">Customer details</h2>
                <p class="text-center">On this page you can Save or Update customer details.</p>
            </div>
        </div>
    </section>
    <div class="container">
        <div>
            <form:form action="saveCustomer" modelAttribute="customer" method="POST">
                <form:hidden path="id" />
            <form>
                    <div class="form-group shadow-none">
                    <div class="border-info shadow-sm" id="formdiv" style="transform: translate(0px);text-align: left;filter: blur(0px);">

                        <div class="form-row" style="margin-right:0;margin-left:0;padding-top:24px;">
                            <div class="col-md-8 offset-md-1">
                                <p style="margin-left:2%;font-family:Roboto, sans-serif;font-size:24px;"><strong>First name</strong></p>
                            </div>
                            <div class="col-md-10 offset-md-1">
                                <form:input class="form-control" type="text" style="margin-left:0px;font-family:Roboto, sans-serif;" name="name" placeholder="" path="firstName"/></div>
                        </div>

                        <div class="form-row" style="margin-right:0;margin-left:0;padding-top:24px;">
                            <div class="col-md-8 offset-md-1">
                                <p style="margin-left:2%;font-family:Roboto, sans-serif;font-size:24px;"><strong>Last name</strong></p>
                            </div>
                            <div class="col-md-10 offset-md-1">
                                <form:input class="form-control" type="text" style="margin-left:0px;font-family:Roboto, sans-serif;" name="name" placeholder="" path="lastName"/></div>
                        </div>

                        <div class="form-row" style="margin-right:0;margin-left:0;padding-top:24px;">
                            <div class="col-md-8 offset-md-1">
                                <p style="margin-left:2%;font-family:Roboto, sans-serif;font-size:24px;"><strong>Email address</strong></p>
                            </div>
                            <div class="col-md-10 offset-md-1">
                                <form:input class="form-control" type="text" style="margin-left:0px;font-family:Roboto, sans-serif;" name="email" placeholder="" path="email"/></div>
                        </div>

                        <div class="form-row" style="margin-right:0;margin-left:0;padding-top:24px;">
                            <div class="col text-center"><button class="btn btn-success btn-lg" type="submit">Save</button></div>
<%--                                <td><input type="submit" value="Save" class="save" /></td>--%>
                        </div>

                        <div class="form-row">
                            <div class="col">
                                <h1 style="color: rgba(33,37,41,0);">Heading</h1>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col" style="text-align: center;">
                                <a href="${pageContext.request.contextPath}/customer/list" style="text-align: left;">Take me back to 'Customers List'</a>
                            </div>
                        </div>
                    </div>
                </div>
                </form>
            </form:form>
        </div>
    </div>
    <script src="${pageContext.request.contextPath}/resources/detailsForm-assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/detailsForm-assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>