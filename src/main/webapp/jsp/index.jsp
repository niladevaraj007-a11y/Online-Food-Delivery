<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
    response.sendRedirect(request.getContextPath() + "/jsp/home.jsp");
%>
<form class="search-box"
      action="<%=request.getContextPath()%>/search"
      method="GET">

    <input type="text" name="query"
           placeholder="Search food or restaurant..." required>

    <button type="submit" class="btn">Search</button>
</form>