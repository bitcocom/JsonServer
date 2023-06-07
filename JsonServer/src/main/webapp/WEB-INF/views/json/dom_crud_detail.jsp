<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
      crossorigin="anonymous"
    />
  </head>
  <body>
    <div class="container">
      <div class="row mb-3">
        <label for="name" class="col-sm-3 col-form-label">Name</label>
        <div class="col-sm-9"><span id="name">${cus.name}</span></div>
      </div>
      <div class="row mb-3">
        <label for="name" class="col-sm-3 col-form-label">Gender</label>
        <div class="col-sm-9"><span id="gender">${cus.gender}</span></div>
      </div>
      <div class="row mb-3">
        <label for="company" class="col-sm-3 col-form-label">Company</label>
        <div class="col-sm-9"><span id="company">${cus.company}</span></div>
      </div>
      <div class="row mb-3">
        <label for="email" class="col-sm-3 col-form-label">Email</label>
        <div class="col-sm-9"><span id="email">${cus.email}</span></div>
      </div>
      <div class="row mb-3">
        <label for="phone" class="col-sm-3 col-form-label">Phone</label>
        <div class="col-sm-9"><span id="phone">${cus.phone}</span></div>
      </div>
      <div class="row mb-3">
        <label for="address" class="col-sm-3 col-form-label">Address</label>
        <div class="col-sm-9"><span id="address">${cus.address}</span></div>
      </div>

      <div class="text-center">
        <button onclick="goToUpdate();" class="btn btn-success">수정</button>
        <button onclick="goToList();" class="btn btn-secondary">목록</button>
      </div>
    </div>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
      crossorigin="anonymous"
    ></script>   
    <script>
      // queryString
      //   console.log(window.location.search);
      function goToList() {
        document.location.href = "/js/index";
      }

      function goToUpdate() {       
        document.location.href = "/js/modify/${cus.id}";
      }
      
    </script>
  </body>
</html>
