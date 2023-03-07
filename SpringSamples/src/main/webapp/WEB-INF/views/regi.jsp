<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">

</head>
<body>

<article class="card-body mx-auto" style="max-width: 400px;">

	<h4 class="card-title mt-3 text-center">회원가입</h4>	
	
	<form action="regiAf.do" method="post">
	
	<div class="form-group input-group">
		<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
		 </div>
        <input id="id" name="id" class="form-control" placeholder="id" type="text">   
           
    </div> <!-- form-group// -->
    
    <div class="form-group input-group">
    	<button type="button" id="idChkBtn" class="btn btn-danger">id check</button> 
    	<p id="idcheck" style="margin-left:10px;"></p> 
    </div>    
    	
	<div class="form-group input-group">
		<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
		 </div>
        <input name="name" class="form-control" placeholder="Full name" type="text">
    </div> <!-- form-group// -->
    
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
		 </div>
        <input name="email" class="form-control" placeholder="Email address" type="email">
    </div> <!-- form-group// -->
    
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-phone"></i> </span>
		</div>
		<select class="custom-select" style="max-width: 120px;">
		    <option selected="selected">+02</option>
		    <option value="1">+032</option>
		    <option value="2">+041</option>
		    <option value="3">+053</option>
		</select>
    	<input name="" class="form-control" placeholder="Phone number" type="text">
    </div> <!-- form-group// -->
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-building"></i> </span>
		</div>
		<select class="form-control">
			<option selected="selected">직업</option>
			<option>디자이너</option>
			<option>프로그래머</option>
			<option>자영업</option>
		</select>
	</div> <!-- form-group end.// -->
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
		</div>
        <input id="" name="pwd" class="form-control" placeholder="Create password" type="password">
    </div> <!-- form-group// -->
    
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
		</div>
        <input class="form-control" placeholder="Repeat password" type="password">
    </div> <!-- form-group// --> 
                                         
    <div class="form-group">
        <button type="submit" class="btn btn-primary btn-block"> Create Account  </button>
    </div> <!-- form-group// -->      
    <p class="text-center">Have an account? <a href="login.do">Log In</a> </p>                                                                 
</form>
</article>

<script type="text/javascript">
$(document).ready(function() {
	
	$("#idChkBtn").click(function() {		
		// id의 빈칸을 조사!
		
		$.ajax({
			type:"post",
			url:"idcheck.do",
			data:{ "id":$("#id").val() },
			success:function(msg){				
				if(msg == "YES"){
					$("#idcheck").css("color", "#0000ff");
					$("#idcheck").text("사용할 수 있는 아이디입니다");
				}else{
					$("#idcheck").css("color", "#ff0000");
					$("#idcheck").text("사용중인 아이디입니다");
					$("#id").val("");
				}
			},
			error:function(){
				alert('error');
			}
		});
	});
});
</script>

</body>
</html>





