$(document).ready(function(){
	$('.submit').click(function() {
		if ($('#id_dup').val() == 'fail') {
			alert('아이디 중복확인 해주세요');
			$('#id').focus();
			return false;
		}
		
		if($('#nick_dup').val() == 'fail') {
			alert('닉네임 중복확인 해주세요');
			$('#nick').focus();
			return false;
		}
		
		if($('#pass_reg').val() == 'fail') {
			alert('영문 대소문자, 숫자, 특수문자(!,@,#) 중 2가지 이상 포함한 8~16자리를 입력해주세요');
			$('#pass').focus();
			return false;
		}
		
		if($('#pass_confirm').val() == 'fail') {
			alert('비밀번호가 일치하지 않습니다');
			$('#confirmPassword').focus();
			return false;
		}
	});
	
});