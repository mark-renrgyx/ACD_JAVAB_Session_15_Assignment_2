<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<%@ page import="java.util.*" %>

<!--  for Assignment 15-2 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Session App</title>
</head>
<body>
<%@ page session="true" %> <!-- This is the default anyway (and it can be placed above) -->

<%
	// TODO I couldn't get it to work using web.xml servlet mapping
	
	Date creationTime = new Date(session.getCreationTime());
	Date lastAccessTime = new Date(session.getLastAccessedTime());
	
	String visitCountKey = new String("visitCount");
	Integer visitCount = Integer.valueOf(0);
	
	if (session.isNew()) {
		session.setAttribute(visitCountKey, visitCount);
	}
	visitCount = (Integer) session.getAttribute(visitCountKey);
	visitCount = visitCount + 1;
	session.setAttribute(visitCountKey, visitCount);
%>

<p id="links">[<a href="index.jsp">Reload</a>]<!-- [<a href="/destroyer/blank.html">Delete Session</a>]</p> -->  <!-- TODO anchor didn't work -->
<form action="Destroyer" method="post">
<input type="submit" value="Destroy Session">
</form>

<h2>Session Data:</h2>

<p id="dynamic_content">
New Session: <% out.print(request.getSession().isNew()); %> <br />
SessionID: <% out.print(request.getSession().getId()); %> <br />
Creation Time: <% out.print(creationTime.toString()); %> <br />
Last Access Time: <% out.print(creationTime.toString()); %> <br />
Number of Accesses: <% out.print(visitCount); %>
</p>
</body>
</html>