<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Log in with your account</title>

 <link
      rel="stylesheet"
      href=" https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
    />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>

</head>

<body>
<jsp:include page="header.jsp"></jsp:include>

<div class="container">

    <form method="POST" action="${contextPath}/signin" class="form-signin">
        <h2 class="form-heading p-3">Log in</h2>

        <div class="form-group  ${error != null ? 'has-error' : ''}">
            <span>${message}</span>
            <input name="email" type="email" class="form-control m-2" placeholder="Email" required="required"
                   autofocus="autofocus"/>
            <input name="password" type="password" class="form-control m-2" required="required" placeholder="Password"/>
            <span>${error}</span>
            
             
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <button class="btn btn-lg btn-primary btn-block m-2" type="submit">Log In</button>
            <h4 class="text-center"><a href="${contextPath}/signup">Create an account</a></h4>
        </div>

    </form>

</div>
</body>
</html>