<title>Authentication Page</title>
<%@ include file="connect.jsp" %>
<%@ page import="java.util.Date" %>
<%
   	String name=request.getParameter("userid");      
   	String pass=request.getParameter("pass");
	
    try{
			String sql="SELECT * FROM kdc where user='"+name+"' and pass='"+pass+"'";
			Statement stmt = connection.createStatement();
			ResultSet rs =stmt.executeQuery(sql);
			String utype="";
			if(rs.next()){
				response.sendRedirect("KDC_Main.jsp");
			}
			else
			{
				response.sendRedirect("KDC_Wrong_Login.jsp");
			}
		
	}
	catch(Exception e)
	{
		out.print(e);
	}
%>