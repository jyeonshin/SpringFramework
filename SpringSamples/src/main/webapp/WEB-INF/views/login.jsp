<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript" ></script>

<style type="text/css">
.divider:after,
.divider:before {
  content: "";
  flex: 1;
  height: 1px;
  background: #eee;
}
.h-custom {
  height: calc(100% - 73px);
}
@media (max-width: 450px) {
  .h-custom {
    height: 100%;
  }
}
</style>

</head>
<body>

<section class="vh-100">
  <div class="container-fluid h-custom">
    <div class="row d-flex justify-content-center align-items-center h-100">
    
      <div class="col-md-9 col-lg-6 col-xl-5">
        <img src="https://www.multicampus.com/kr/images/main/2021/tab-image3.jpg" class="img-fluid"
          alt="Sample image">
      </div>
      
      <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
      	<form action="loginAf.do" method="post">
      	  <div class="d-flex flex-row align-items-center justify-content-center justify-content-lg-start">
            <p class="lead fw-normal mb-0 me-3">Sign in with</p>            
          </div>

          <div class="divider d-flex align-items-center my-4">
            <p class="text-center fw-bold mx-3 mb-0">Or</p>
          </div>
          
          <!-- id input -->
          <div class="form-outline mb-4">
            <input type="text" id="id" name="id" class="form-control form-control-lg"
              placeholder="Enter a valid id" />
            <label class="form-label" for="form3Example3">Id</label>
          </div>
          
          <!-- Password input -->
          <div class="form-outline mb-3">
            <input type="password" id="pwd" name="pwd" class="form-control form-control-lg"
              placeholder="Enter password" />
            <label class="form-label" for="form3Example4">Password</label>
          </div>
          
          <div class="d-flex justify-content-between align-items-center">
            <!-- Checkbox -->
            <div class="form-check mb-0">
              <input class="form-check-input me-2" type="checkbox" value="" id="chk_save_id" />
              <label class="form-check-label" for="form2Example3">
                Remember me
              </label>
            </div>
            <a href="#!" class="text-body">Forgot password?</a>
          </div>
          
          <div class="text-center text-lg-start mt-4 pt-2">
            <button type="submit" class="btn btn-primary btn-lg"
              style="padding-left: 2.5rem; padding-right: 2.5rem;">Login</button>
            <p class="small fw-bold mt-2 pt-1 mb-0">Don't have an account? 
            	<a href="#" onclick="account()" class="link-danger">Register</a>
            </p>
          </div>         
          
      	</form>
      	
      </div>      
    </div>    
  </div>
  
  <div class="d-flex flex-column flex-md-row text-center text-md-start justify-content-between py-4 px-4 px-xl-5 bg-primary">
    <!-- Copyright -->
    <div class="text-white mb-3 mb-md-0">
      Copyright © 2023. MultiCampus.
    </div>
    <!-- Copyright -->

    <!-- Right -->
    <div>
      <a href="#!" class="text-white me-4">
        <i class="fab fa-facebook-f"></i>
      </a>
      <a href="#!" class="text-white me-4">
        <i class="fab fa-twitter"></i>
      </a>
      <a href="#!" class="text-white me-4">
        <i class="fab fa-google"></i>
      </a>
      <a href="#!" class="text-white">
        <i class="fab fa-linkedin-in"></i>
      </a>
    </div>
    <!-- Right -->
  </div>  
  
</section>



<script type="text/javascript">
function account() {	
	location.href = "regi.do";
}

let user_id = $.cookie("user_id");

if(user_id != null){	// 저장한 id가 있음
	$("#id").val(user_id);
	$("#chk_save_id").prop("checked", true);
}

$("#chk_save_id").click(function () {
	
	if( $("#chk_save_id").is(":checked") == true ){
		
		if( $("#id").val().trim() == "" ){
			alert('id를 입력해 주십시오');
			$("#chk_save_id").prop("checked", false);
		}else{
			// cookie를 저장
			$.cookie("user_id", $("#id").val().trim(), { expires:7, path:'./' });
		}
		
	}else{
		$.removeCookie("user_id", { path:'./' });
	}	
});

</script>

</body>
</html>





