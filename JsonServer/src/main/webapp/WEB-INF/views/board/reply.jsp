<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
 
  <div class="card">
    <div class="card-header">
		<div class="jumbotron jumbotron-fluid">
		  <div class="container">
		    <h1>Spring Framework~</h1>
		    <p>Spring WEB MVC, MySQL, JSP(jQuery,Ajax,JSON)...</p>
		  </div>
		</div>    
    </div>
    <div class="card-body">
	    <div class="row">
		  <div class="col-2">
		    <jsp:include page="left.jsp"/>
		  </div>
		  <div class="col-7">
		    <div class="card">
		      <div class="card-body">
		         <h4 class="card-title">BOARD</h4>
		         <p class="card-text">게시판 답글쓰기</p>
		          <form action="reply.do" method="post">
		            <input type="hidden" name="num" value="${vo.num}"/> 
		            <input type="hidden" name="username" value="${mvo.username}"/>
		            <div class="form-group">
		              <label>제목:</label>
		              <input type="text" name="title" value="${vo.title}" class="form-control"/>
		            </div>
		            <div class="form-group">
		              <label>답글:</label>
		              <textarea rows="7" class="form-control" name="content"></textarea>
		            </div>
		            <div class="form-group">
		              <label>작성자:</label>
		              <input type="text" name="writer" class="form-control" value="${mvo.name}" readonly/>
		            </div>
		            <button type="button" class="btn btn-sm btn-primary">목록</button>
		            <button type="submit" class="btn btn-sm btn-primary">등록</button>
		            <button type="reset" class="btn btn-sm btn-primary">취소</button>
		          </form>
		      </div>
		    </div>
		  </div>
		  <div class="col-3">
		    <jsp:include page="right.jsp"/>
		  </div>
		</div>
    </div> 
    <div class="card-footer">3-4(박매일)</div>
  </div>

</body>
</html>