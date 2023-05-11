<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>My Bookings</title>
    <link
      rel="stylesheet"
      href=" https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
    />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
  </head>
  <body>
    <jsp:include page="header.jsp"></jsp:include>
    <div class="container-fluid">
         Welcome to My Bookings Page
         <br/><br/>	
	<table class="table table-stripped">
		<thead>
			<tr>
				<th>User Id</th>
				<th>Machine Id</th>
				<th>Start Time</th>
				<th>End Time</th>
				<th>Booking Date</th>
				<th>Play Date</th>
				<th>Status</th>
				<th>Availability</th>
			
			
			</tr>
		</thead>
		<c:forEach var="booking" items="${bookingList}">
		<tbody>
		<tr>
			<td>${booking.userId}</td>
			<td>${booking.machineId}</td>
			<td>${booking.startTime}</td>
			<td>${booking.endTime}</td>
			<td>${booking.bookingDate}</td>
			<td>${booking.playDate}</td>
			<td>${booking.status}</td>
			
			<td>
			<c:if test="${ booking.status == 'BOOKED'}">
			<a  href="/updateBookingStatus/${booking.bookingId}?status=NOTBOOKED">Cancel</a>
			</c:if>
			<c:if test="${booking.status =='NOTBOOKED'}">
			<a  href="/updateBookingStatus/${booking.bookingId}?status=BOOKED">Reserve Slot</a>
			</c:if>
			</td>
			
		</tr>
		</tbody>
		</c:forEach>
	</table>
    </div>
  </body>
</html>
