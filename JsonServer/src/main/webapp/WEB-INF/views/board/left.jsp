<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<div class="card" style="min-height: 500px; max-height: 1000px">
  <div class="card-body">
    <c:if test="${empty mvo}">
    <h4 class="card-title">GUEST</h4>
    <p class="card-text">회원님! Welcome</p>
    <form action="login.do" method="post">
       <div class="form-group">
         <label>아이디:</label>
         <input type="text" class="form-control" name="username"/>
       </div>
       <div class="form-group">
         <label>비밀번호:</label>
         <input type="password" class="form-control" name="password"/>
       </div>
       <button class="btn btn-sm btn-primary form-control">로그인</button>
    </form>
    </c:if>
    <c:if test="${!empty mvo}">
      <h4 class="card-title">${mvo.name}</h4>
      <p class="card-text">회원님! Welcome</p>
      <form action="logout.do" method="post">  
       <button class="btn btn-sm btn-primary form-control">로그아웃</button>
      </form>
    </c:if>
  </div>
</div>

