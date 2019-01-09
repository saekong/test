<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
  $(document).ready(function() {
    //아이디 체크여부 확인 (아이디 중복일 경우 = 0 , 중복이 아닐경우 = 1 )
    var idck = 0;
    //idck 버튼을 클릭했을 때 
    $("#idcheck").click(function() {
      //userid 를 param.
      var memberid = $("#id").val();
      if (memberid.trim() == '') {
        $('#myModalLabel').text("아이디 중복체크");
        
        var str = '<div class="well row text-center">';
        str += '<label class="col-xs-12 control-label">아이디를 입력해주세요.</label>'
        str += '</div>';
        $('.modal-body').html(str);
        
        str = '<button type="button" class="btn btn-default" id="modalClose">Close</button>';
        
        $('.modal-footer').html(str);
        
        $('#myModal').modal();
        
      } else {
        $.ajax({
          async: true,
          type: 'POST',
          data: memberid,
          url: "${pageContext.request.contextPath}/member/idcheck",
          dataType: "json",
          contentType: "application/json; charset=UTF-8",
          success: function(data) {
            if (data.cnt > 0) {
              $('#myModalLabel').text("아이디 중복체크");
              
              var str = '<div class="well row text-center">';
              str += '<label class="col-xs-12 control-label">아이디가 존재합니다. 다른 아이디를 입력해주세요.</label>'
              str += '</div>';
              $('.modal-body').html(str);
              
              str = '<button type="button" class="btn btn-default" id="modalClose">Close</button>';
              
              $('.modal-footer').html(str);
              
              $('#myModal').modal();
              $("#userid").focus();

            } else {
              $('#myModalLabel').text("아이디 중복체크");
              
              var str = '<div class="well row text-center">';
              str += '<label class="col-xs-12 control-label">사용 가능한 아이디입니다.</label>'
              str += '</div>';
              $('.modal-body').html(str);
              
              str = '<button type="button" class="btn btn-default" id="modalClose">Close</button>';
              
              $('.modal-footer').html(str);
              
              $('#myModal').modal();
              $("#userid").focus();
              idck = 1;
            }
          },
          error: function(error) {

            alert("error : " + error);
          }
        });
      }
    });
    
    $("#insertBtn").click(function() {

      var id = $("#id").val();
      var name = $("#name").val();
      var password = $("#password").val();
      
      var parameter = JSON.stringify({
        'id' : id,
        'name' : name,
        'password' : password
      });
      
      console.log(parameter);
      
      $.ajax({
        url:'${pageContext.request.contextPath}/member/rest',
        data: parameter,
        contentType: 'application/json;charset=UTF-8',
        type: 'POST',
        success: function() {
          alert("Welcome ParkinSeoul!");
          location.href='${root}/'
        },
        error : function(error) {
          console.log("no good "+JSON.stringify(error));
        }
      });       
    });
    
    
  });
</script>

<section id="page-breadcrumb">
	<div class="vertical-center sun">
		<div class="container">
			<div class="row">
				<div class="action">
					<div class="col-sm-12">
						<h1 class="title">Sing Up</h1>
						<p>회원가입 페이지 입니다.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!--/#page-breadcrumb-->

<div class="well">
	<p>회원가입을 위해 아래 내용들을 작성해 주세요.</p>
	<form class="form-horizontal" method="post"
		action="${root}/member/insert">
		<fieldset>
			<div class="form-group">
				<label class="col-lg-2 control-label">아이디</label>

				<div class="col-lg-8">
					<input type="text" class="form-control" name="id" id="id"
						placeholder="아이디">
				</div>
				<div class="col-lg-2">
					<button id="idcheck" type="button" class="btn btn-primary">중복확인</button>
				</div>
			</div>
			<div class="form-group">
				<label class="col-lg-2 control-label">닉네임</label>

				<div class="col-lg-10">
					<input type="text" class="form-control" name="name" id="name"
						placeholder="닉네임">
				</div>
			</div>
			<div class="form-group">
				<label class="col-lg-2 control-label">비밀번호</label>

				<div class="col-lg-10">
					<input type="password" class="form-control" name="password"
						id="password" placeholder="비밀번호">
				</div>
			</div>
			<div class="form-group">
				<label class="col-lg-2 control-label">비밀번호 확인</label>

				<div class="col-lg-10">
					<input type="password" class="form-control" id="password2"
						placeholder="비밀번호 확인">
				</div>
			</div>
			<div class="form-group">
				<div class="col-lg-10 col-lg-offset-2">
					<button id="insertBtn" type="button" class="btn btn-primary">확인</button>
					<a href="${pageContext.request.contextPath}/home.htm"
						class="btn btn-large btn-default">취소</a>
				</div>
			</div>
		</fieldset>
	</form>
</div>