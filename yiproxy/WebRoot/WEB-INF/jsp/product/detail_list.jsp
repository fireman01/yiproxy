<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
%>
 <div class="col-md-12">
 <h4>${product.introduction }</h4>
 <c:forEach var="image" items="${product.picture}" varStatus="s">
<div class="thumbnail col-md-2">
      <img src="<%=path %>${image }" alt="...">
    </div>
     </c:forEach>
   </div>
