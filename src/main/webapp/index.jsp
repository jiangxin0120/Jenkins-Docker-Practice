<%@ page import="java.time.LocalTime" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome</title>
</head>
<body>
<%
    // Get the current hour of the day
    int hour = LocalTime.now().getHour();
    // Initialize the greeting
    String greeting = (hour < 12) ? "Good morning" : "Good afternoon";
    String studentName = "Xin";
%>
<h2><%= greeting %>, <%= studentName %>, Welcome to COMP367</h2>
</body>
</html>
