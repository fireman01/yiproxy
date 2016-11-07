<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
%>
<c:if test="${productList== null || fn:length(productList) == 0}">
<p>未检索到数据，请重新匹配检索条件！</p>
</c:if>
 <c:forEach var="product" items="${productList}" varStatus="s">
 <div class="col-md-12">
 <h4>${product.introduction }</h4>
 <c:forEach var="image" items="${product.picture}" varStatus="s">
<div class="thumbnail col-md-2">
      <img src="<%=path %>${image }" alt="...">
    </div>
     </c:forEach>
   </div>
    </c:forEach>
