<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Home</title>
    <link
      rel="stylesheet"
      href=" https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
    />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
  </head>
  <body>
    <jsp:include page="header.jsp"></jsp:include>
    <div class="container-fluid">
         Welcome to  booking page ${sessionScope.user.name}
         
         <form:form method="POST" action="${contextPath}/booking" modelAttribute="bookingForm" class="form-signin p-2">
        <h2 class="form-signin-heading">Book your Games</h2>
        <spring:bind path="userId">
            <div class="form-group p-2 ${status.error ? 'has-error' : ''}">
                <form:input type="number" path="userId" class="form-control" placeholder="User Id"
                            autofocus="true"></form:input>
                <form:errors path="userId"></form:errors>
            </div>
        </spring:bind>
        
           <spring:bind path="machineId">
            <div class="form-group p-2 ${status.error ? 'has-error' : ''}">
                <form:input type="number" path="machineId" class="form-control" placeholder="Machine Id"></form:input>
                <form:errors path="machineId"></form:errors>
            </div>
        </spring:bind>
            <spring:bind path="startTime">
            <div class="form-group p-2 ${status.error ? 'has-error' : ''}">
                <form:input type="time" path="startTime" class="form-control" placeholder="Start Time"></form:input>
                <form:errors path="startTime"></form:errors>
            </div>
        </spring:bind>
         <spring:bind path="endTime">
            <div class="form-group p-2 ${status.error ? 'has-error' : ''}">
                <form:input type="time" path="endTime" class="form-control" placeholder="End Time"></form:input>
                <form:errors path="endTime"></form:errors>
            </div>
        </spring:bind>
        
      <!--   <spring:bind path="amount">
            <div class="form-group p-2 ${status.error ? 'has-error' : ''}">
                <form:input type="number" path="amount" class="form-control" placeholder="Amount"></form:input>
                <form:errors path="amount"></form:errors>
            </div>
        </spring:bind>
        
          <spring:bind path="bookingDate">
            <div class="form-group p-2 ${status.error ? 'has-error' : ''}">
                <form:input type="date" path="bookingDate" class="form-control" placeholder="bookingDate"></form:input>
                <form:errors path="bookingDate"></form:errors>
            </div>
        </spring:bind>
        -->
        
           <spring:bind path="playDate">
            <div class="form-group p-2 ${status.error ? 'has-error' : ''}">
                <form:input type="date" path="playDate" class="form-control" placeholder="playDate"></form:input>
                <form:errors path="playDate"></form:errors>
            </div>
        </spring:bind>
        
        <button class="btn btn-lg btn-primary btn-block p-2 m-2" type="submit">Submit</button>
    </form:form>
    </div>
  </body>
</html>
