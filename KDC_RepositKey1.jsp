<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@page import ="java.util.*"%>
<%@ include file="connect.jsp" %>
    <%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
    <%@ page import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream" %>
<%@ page import ="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
 <%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>
<html><style type="text/css">
<!--
body {
	background-color: #FFFFFF;
}
-->
</style>
<body>
<%
int uid = Integer.parseInt(request.getParameter("usid"));
try {
		KeyPairGenerator kg = KeyPairGenerator.getInstance("RSA");
		Cipher encoder = Cipher.getInstance("RSA");
		KeyPair kp = kg.generateKeyPair();
		Key pubKey = kp.getPublic();
		byte[] pub = pubKey.getEncoded();
		String pk = String.valueOf(pub); 

String query1 ="update reposit_req set status='"+pk+"' where id='"+uid+"' ";
Statement st1 = connection.createStatement();
st1.executeUpdate (query1);



connection.close();
}
catch(Exception e)
{
out.println(e.getMessage());
}
response.sendRedirect("KDC_RepositKey.jsp");
%>
</body></html>