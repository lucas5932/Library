function id_pw_chk(){
		if($('input[name=id]').val()==""){
			alert("아이디를 입력하세요");
			$('input[name=id]').focus();
			return false;
		}
		if($('input[name=pwd]').val()==""){
			alert("비밀번호를 입력하세요");
			$('input[name=pwd]').focus();
			return false;
		}
	}

function findpwd_chk1(){
	if($('input[name=id]').val()==""){
		alert("아이디를 입력하세요.");
		$('input[name=id]').focus();
		return false;
	}
	if($('input[name=phone]').val()==""){
		alert("핸드폰번호를 입력하세요.");
		$('input[name=phone]').focus();
		return false;
	}
}

function findid_chk(){
	if($('input[name=name]').val()==""){
		alert("이름을 입력하세요.");
		$('input[name=name]').focus();
		return false;
	}
	if($('input[name=phone]').val()==""){
		alert("핸드폰번호를 입력하세요.");
		$('input[name=phone]').focus();
		return false;
	}
}