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
      <div class="row row-cols-lg-auto g-3 align-items-center mt-2 mb-1">
        <div class="col-12">
          <select class="form-select" name="" id="gender">
            <option value="">전체</option>
            <option value="male">남자</option>
            <option value="female">여자</option>
          </select>
        </div>

        <div class="col-12">
          <input
            type="search"
            name=""
            id="name"
            placeholder="Name"
            class="form-control"
            onkeyup="checkEnter()"
          />
        </div>

        <div class="col-12">
          <button onclick="doSearch();" class="btn btn-primary">조회</button>
          <button onclick="goToCreate();" class="btn btn-success">생성</button>
          <button
            id="btnDelete"
            onclick="doDelete();"
            class="btn btn-danger"
            disabled
          >
            삭제
          </button>
        </div>
      </div>

      <table class="table table-bordered table-striped table-hover">
        <thead>
          <tr>
            <th>
              <input
                type="checkbox"
                onchange="checkAll();"
                class="form-check-input"
              />
            </th>
            <th>Name</th>
            <th>Company</th>
            <th>Gender</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Address</th>
          </tr>
        </thead>
        <tbody id="tbBody"></tbody>
      </table>
    </div>

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
      crossorigin="anonymous"
    ></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
      // crud - Create, Read, Update, Delete
      async function doSearch() {
        const gender = document.querySelector("#gender").value;
        const name = document.querySelector("#name").value;
        
        //리스트가져오기 요청 : GET
        let resource = "/js/customers";
        if (gender === "") {
          if (name != "") {
            resource = `/js/customers?name_like=\${name}`;
          }
        } else {
          if (name !== "") {
            resource = `/js/customers?gender=\${gender}&name_like=\${name}`;
          } else {
            resource = `/js/customers?gender=\${gender}`;
          }
        }

        const res = await fetch(resource);
        const resJson = await res.json();
        console.log(resJson);
        renderTable(resJson);
      }
      // 리스트 출력 함수
      function renderTable(data) {
        const h = [];
        for (const item of data) {
          h.push(`<tr>`);
          h.push(
            `<td><input type="checkbox" name="chk" value="\${item.id}" onchange="isChecked();" class="form-check-input" /></td>`
          );
          h.push(
            `<td><a href="javascript:goToDetail('\${item.id}');">\${item.name}</a></td>`
          );
          h.push(`<td>\${item.company}</td>`);
          h.push(`<td>\${item.gender}</td>`);
          h.push(`<td>\${item.email}</td>`);
          h.push(`<td>\${item.phone}</td>`);
          h.push(`<td>\${item.address}</td>`);
          h.push(`</tr>`);
        }

        document.querySelector("#tbBody").innerHTML = h.join("");
      }

      function goToCreate() {
        //document.location.href = "dom_crud_create.html";
    	  document.location.href = "/js/create";
      }

      async function doDelete() {
        const chks = document.querySelectorAll("[name=chk]:checked");
        if (chks.length > 0) {
          Swal.fire({
            title: "정말 삭제 하시겠습니까?",
            text: "You won't be able to revert this!",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            confirmButtonText: "삭제",
            cancelButtonText: "취소",
          }).then(async (result) => {
            if (result.isConfirmed) {
              for (const chk of chks) {
                await fetch(`/js/customers/\${chk.value}`, {
                  method: "DELETE",
                });
              }

              Swal.fire({
                icon: "success",
                title: "데이터가 정상적으로 삭제 되었습니다.",
              });
              await doSearch();
            }
          });
        } else {
          alert("삭제할 아이템을 선택하세요.");
        }
      }

      function checkAll() {
        console.log(event.target.checked);
        const checkValue = event.target.checked;
        const chks = document.querySelectorAll("[name=chk]");
        if (chks.length > 0) {
          for (const chk of chks) {
            chk.checked = checkValue;
          }
        }

        isChecked();
      }

      function isChecked() {
        const chks = document.querySelectorAll("[name=chk]:checked");
        if (chks.length > 0) {
          document.querySelector("#btnDelete").disabled = false;
        } else {
          document.querySelector("#btnDelete").disabled = true;
        }
      }

      function checkEnter() {
        if (event.keyCode === 13) {
          doSearch();
        }
      }

      function goToDetail(id) {
    	//상세보기 요청  
        document.location.href = `/js/customers/\${id}`;
      }
      // 가장먼저 리스트를 가져오는 함수가 실행됨
      doSearch();
    </script>
  </body>
</html>