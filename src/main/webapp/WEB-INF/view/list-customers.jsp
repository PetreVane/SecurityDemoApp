
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Customer-List</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}resources/customerList/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}resources/customerList/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}resources/customerList/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}resources/customerList/fonts/fontawesome5-overrides.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}resources/customerList/css/Highlight-Clean.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}resources/customerList/css/Lista-Productos-Canito.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}resources/customerList/css/styles.css">
</head>

<body>
<section class="highlight-clean">
    <div class="container">
        <div class="intro">
            <h2 class="text-center">Customer List</h2>
            <p class="text-center">This is a list of all your Customers</p>
        </div>
        <div class="buttons"></div>
    </div>
</section>
<div>
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <h2 style="width: 343px;">Entries</h2>
            </div>
            <div class="col-md-4 d-flex justify-content-end align-self-start">
                <i class="fas fa-search d-xl-flex justify-content-xl-center align-items-xl-center"></i>


                <!--  add a search box -->
                <form:form action="search" method="get">
                    <input type="search" class="border rounded d-xl-flex justify-content-xl-center align-items-xl-center search-field" id="search-field" style="background-color: #eaeaea;width: 80%;height: 38px;padding: 0px;margin-left: 17px;"
                           name="customerName" />

                </form:form>
            </div>

            <div class="col-md-4 d-flex justify-content-center align-items-center">
                <button
                        class="btn btn-primary d-flex align-items-center align-self-center" type="button" value="Add Customer"
                        onclick="window.location.href='${pageContext.request.contextPath}/showFormForAdd';return false;" style="height: 38px;background: var(--green);">Add Customer
                </button>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
                    <thead>
                    <tr>
                        <th>First name</th>
                        <th>Last name</th>
                        <th>Email address</th>
                        <th>Action</th>
                    </tr>
                    </thead>

                    <tbody>

                    <!-- loop over and print our customers -->
                    <c:forEach var="tempCustomer" items="${customers}">

                        <!-- construct an "update" link with customer id -->
                        <c:url var="updateLink" value="${pageContext.request.contextPath}showFormForUpdate">
                            <c:param name="customerId" value="${tempCustomer.id}" />
                        </c:url>

                        <!-- construct the "delete" link with customer id -->
                        <c:url var="deleteLink" value="${pageContext.request.contextPath}delete">
                            <c:param name="customerId" value="${tempCustomer.id}" />
                        </c:url>


                        <tr>
                            <td> ${tempCustomer.firstName} </td>
                            <td> ${tempCustomer.lastName} </td>
                            <td> ${tempCustomer.email} </td>

                            <td>
                                <!-- display the update link -->
                                <button type="button" class="btn btn-warning" onclick="window.location.href='${updateLink}'">

                                    <i class="fas fa-pencil-alt d-xl-flex justify-content-xl-center align-items-xl-center"></i>
                                </button>

                                <button type="button" class="btn btn-danger" onclick="window.location.href='${deleteLink}'" onclick="if (!(confirm('Are you sure you want to delete this record?'))) return false">
                                    <i class="far fa-trash-alt d-xl-flex justify-content-xl-center align-items-xl-center"></i>
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}resources/customerList/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}resources/customerList/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}resources/customerList/js/Table-with-search.js"></script>
</body>

</html>