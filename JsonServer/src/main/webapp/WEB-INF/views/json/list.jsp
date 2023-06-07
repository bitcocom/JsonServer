<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <button onclick="getData()">조회</button>
   <button onclick="postData()">생성</button>
   <button onclick="putData()">수정</button>
   <button onclick="deleteData()">삭제</button>
   <table>
     <thead>
       <tr>
         <th>idx</th>
         <th>username</th>         
         <th>name</th>
         <th>email</th>
       </tr>
     </thead>
     <tbody id="tbBody"></tbody>
   </table>
   <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
   <script type="text/javascript">
       function getData(){
    	   fetch("/js/customers")
    	   .then((response)=>response.json())
    	   .then((json)=>{
    		   const h=[];
    		   for(const customer of json){
    			   h.push("<tr>");
    			   h.push("<td>"+customer.idx+"</td>");
    			   h.push("<td>"+customer.username+"</td>");
    			   h.push("<td>"+customer.name+"</td>");
    			   h.push("<td>"+customer.email+"</td>");
    			   h.push("</tr>");
    			   //console.log(h);
    		   }
    		   document.getElementById("tbBody").innerHTML=h.join("");
    	   });
       }
       function postData(){
    	   const customer={
    			   username : "gsm06",
    			   password : "gsm06",
    			   name : "이현주",
    			   email: "lee@gsm.kr"
    	   };
    	   fetch("/js/customers",{
    		   method : "POST",
    		   body : JSON.stringify(customer),
    		   headers:{
    			   "content-type" : "application/json;charset=UTF-8",
    		   },
    	   })
    	   .then((response)=>response.json())
    	   .then((json)=>console.log(json));
       }
       function putData(){
    	   const customer={
    			   username : "gsm06",
    			   password : "gsm06",
    			   name : "이현주",
    			   email: "leeyu@gsm.kr"
    	   };
    	   fetch("/js/customers/gsm06",{
    		   method : "PUT",
    		   body : JSON.stringify(customer),
    		   headers:{
    			   "content-type" : "application/json;charset=UTF-8",
    		   },
    	   })
    	   .then((response)=>response.json())
    	   .then((json)=>console.log(json));
       }
       
       function deleteData(){
    	   fetch("/js/customers/gsm06", {
    		   method : "DELETE",    		   
    	   })
    	   .then((response)=>response.json())
    	   .then((json)=>console.log(json));
       }
   </script>
</body>
</html>