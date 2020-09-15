function reg_area(){
		if($('input[name=id]').val()==""){
			$('#id_msg').show().removeClass("font_green").addClass("font_red").html("필수 정보입니다.");
			$('input[name=id]').focus();
			return false;
		}
		if($('input[name=pwd]').val()==""){
			$('#pwd_msg').show().removeClass("font_green").addClass("font_red").html("필수 정보입니다.");
			$('input[name=pwd]').focus();
			return false;
		}
		if($('input[name=pwdchk]').val()!=$('input[name=pwd]').val()){
			$('#pwdchk_msg').show().removeClass("font_green").addClass("font_red").html("비밀번호 불일치");
			$('input[name=pwdchk]').attr("value","");
			$('input[name=pwdchk]').focus();
			return false;
		}
		if($('input[name=name]').val()==""){
			$('#name_msg').show().removeClass("font_green").addClass("font_red").html("필수 정보입니다.");
			$('input[name=name]').focus();
			return false;
		}
		if($('input[name=b_year]').val()==""||$('input[name=b_day]').val()==""){
			$('#birth_msg').show().removeClass("font_green").addClass("font_red").html("생년월일을 입력 완성하세요.");
			$('input[name=b_year]').focus();
			return false;
		}
		if($('#gender option:selected').val()=="선택"){
			$('#gender_msg').show().removeClass("font_green").addClass("font_red").html("성별을 선택하세요.");
			return false;
		}
		if($('input[name=phone1]').val()==""||$('input[name=phone2]').val()==""||$('input[name=phone3]').val()==""){
			$('#phone_msg').show().removeClass("font_green").addClass("font_red").html("필수 정보입니다.");
			$('input[name=phone1]').focus();
			return false;
		}
	}

function id_check(){
	var regex = /^[a-z0-9]{8,12}$/;
	var msg = $('input[name=id]').val();
	var alp = /[a-z]/;
	var num = /[0-9]/;
	if(msg==""){
		$('#id_msg').show().removeClass("font_green").addClass("font_red").html("필수 정보입니다.");
	}else if(msg.search(alp)==-1||msg.search(num)==-1){
		$('#id_msg').show().removeClass("font_green").addClass("font_red").html("소문자와 숫자를 포함해야합니다.");
	}else if(!regex.test(msg)){
		$('#id_msg').show().removeClass("font_green").addClass("font_red").html("소문자와 숫자를 포함한 최소 8자 ~ 최대 12자 입니다.");
	}else{
		duplicate();
	}
}

function pwd_check(){
	var regex = /^[a-z0-9]{8,12}$/;
	var msg = $('input[name=pwd]').val();
	var alp = /[a-z]/;
	var num = /[0-9]/;
	if(msg==""){
		$('#pwd_msg').show().removeClass("font_green").addClass("font_red").html("필수 정보입니다.");
	}else if(msg.search(alp)==-1||msg.search(num)==-1){
		$('#pwd_msg').show().removeClass("font_green").addClass("font_red").html("소문자와 숫자를 포함해야합니다.");
	}else if(!regex.test(msg)){
		$('#pwd_msg').show().removeClass("font_green").addClass("font_red").html("소문자와 숫자를 포함한 최소 8자 ~ 최대 12자 입니다.");
	}else{
		$('#pwd_msg').show().removeClass("font_red").addClass("font_green").html("올바른 입력입니다.");
	}
}

function pwdchk_check(){
	var pwd = $('input[name=pwd]').val();
	var pwdchk = $('input[name=pwdchk]').val();
	if(pwd == ""){
		$('#pwdchk_msg').show().removeClass("font_green").addClass("font_red").html("비밀번호를 먼저 입력하세요.");
		$('input[name=pwdchk]').attr("value","");
		$('input[name=pwd]').focus();
	}else if(pwd != pwdchk){
		$('#pwdchk_msg').show().removeClass("font_green").addClass("font_red").html("비밀번호가 일치하지 않습니다.");
	}else{
		$('#pwdchk_msg').show().removeClass("font_red").addClass("font_green").html("비밀번호가 서로 일치합니다.");
	}
}

function name_check(){
	var regex = /^[가-힣]{2,5}$/;
	var name = $('input[name=name]').val();
	if(name.search(regex)==-1){
		$('#name_msg').show().removeClass("font_green").addClass("font_red").html("한글만 입력하세요");
	}else{
		$('#name_msg').hide();
	}
}

function year_check(){
	var regex = /^\d{4}$/;
	var year = $('input[name=b_year]').val();
	if(year.search(regex)==-1){
		$('#birth_msg').show().addClass("font_red").html("태어난 년도는 숫자 4자리 입력하세요.");
	}else{
		$('#birth_msg').hide();
	}
}

function day_check(){
	var regex = /^\d{1,2}$/;
	var day = $('input[name=b_day]').val();
	if(day.search(regex)==-1){
		$('#birth_msg').show().addClass("font_red").html("태어난 일은 숫자 1~2자리 입력하세요.");
	}else{
		$('#birth_msg').hide();
	}
}

function ph1_next(){
	var regex = /^\d{1,3}$/;
	var ph1 = $('input[name=phone1]').val(); 
	if(!regex.test(ph1)){
		$('#phone_msg').show().addClass("font_red").html("전화번호는 숫자만 입력하세요.");
		$('input[name=phone1]').attr("value","").focus();
	}else {
		$('#phone_msg').hide();
		if(ph1.length==3){
			$('input[name=phone2]').focus();
		}
	}
}
function ph2_next(){
	var regex = /^\d{1,4}$/;
	var ph2 = $('input[name=phone2]').val(); 
	if(!regex.test(ph2)){
		$('#phone_msg').show().addClass("font_red").html("전화번호는 숫자만 입력하세요.");
		$('input[name=phone2]').attr("value","").focus();
	}else {
		$('#phone_msg').hide();
		if(ph2.length==4){
			$('input[name=phone3]').focus();
		}
	}
}
function ph3_check(){
	var regex = /^\d{1,4}$/;
	var ph3 = $('input[name=phone3]').val(); 
	if(!regex.test(ph3)){
		$('#phone_msg').show().addClass("font_red").html("전화번호는 숫자만 입력하세요.");
		$('input[name=phone3]').attr("value","").focus();
	}else {
		$('#phone_msg').hide();
		if(ph3.length==4){
			$('input[name=phone3]').focus();
		}
	}
}

function duplicate(){
	$.ajax({
		url : "id_check_proc.jsp",
		data : ({
			userid : $('input[name=id]').val()
		}),
		success : function(data){
			if($('input[name=id]').val()==""){
				$('#id_msg').show().removeClass("font_green").addClass("font_red").html("중복검사할 아이디를 입력하세요.");
			}else if($.trim(data)=="YES"){
				$('#id_msg').show().removeClass("font_red").addClass("font_green").html("사용가능한 아이디 입니다.");
			}else if($.trim(data)=="NO"){
				$('#id_msg').show().removeClass("font_green").addClass("font_red").html("중복된 아이디 입니다.");
			}
		}
	});//ajax
}
