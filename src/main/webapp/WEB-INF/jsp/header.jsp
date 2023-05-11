<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> <%@
taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="navbar navbar-expand-lg  bg-dark" data-bs-theme="dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="/">Game Booking App</a>
    <button
      class="navbar-toggler"
      type="button"
      data-bs-toggle="collapse"
      data-bs-target="#navbarSupportedContent"
      aria-controls="navbarSupportedContent"
      aria-expanded="false"
      aria-label="Toggle navigation"
    >
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
      <c:if test="${sessionScope.user ==null}"> 
          <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/">Home</a>
        </li>
         <li class="nav-item">
          <a class="nav-link" href="/signup">Register</a>
          <li class="nav-item">
            <a class="nav-link" href="/signin">Login</a>
          </li>
      </c:if>
        <c:if test ="${sessionScope.user!=null }">
        
          <li class="nav-item">
            <a class="nav-link" href="/booking">Booking</a>
          </li>
            <li class="nav-item">
            <a class="nav-link" href="/userBookings">My Bookings</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/allBookings">All Bookings</a>
          </li>
            <li class="nav-item">
          <a class="nav-link" href="/viewProfile"
            ><span class="glyphicon glyphicon-user"></span>Welcome
            ${sessionScope.user.name}</a
          >
        </li>

        <li class="nav-item">
          <a class="nav-link" href="/logout"
            ><span class="glyphicon glyphicon-log-out"></span>Logout</a
          >
        </li>
        </c:if>
       
      </ul>
    </div>
  </div>
</nav>
