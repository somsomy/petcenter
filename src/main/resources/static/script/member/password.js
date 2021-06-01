
function check() {
	var pass = document.getElementById('pass').value;
	var passCheck = document.getElementById('passCheck');
	var check = 0;
	var message = document.getElementById('message');
	
    if(/^[a-zA-Z0-9!@#]{8,16}$/g.test(pass)){
    
		check += /[A-Z]/.test(pass)?1:0;
		check += /[a-z]/.test(pass)?1:0;
		check += /[0-9]/.test(pass)?1:0;
		check += /[!@#]/.test(pass)?1:0;
		
		if(check >=3) {
		
			passCheck.style.color = 'green';
	        passCheck.innerHTML = '안전';
	        $('#pass_reg').val('success');
			
		} else if(check ==2) {
		
			passCheck.style.color = 'orange';
			passCheck.innerHTML = '보통';
			$('#pass_reg').val('success');
			
		} else {
		
			passCheck.style.color = 'red';
			passCheck.innerHTML = '사용불가';
			
		}
		
    } else {
    
		passCheck.style.color = 'red';
		passCheck.innerHTML = '영문 대소문자, 숫자, 특수문자(!,@,#) 중 2가지 이상 포함한 8~16자리 입력';
	
	}
	
	if(pass == '') {
	
		 message.style.color = 'red';
		 message.innerHTML = '비밀번호를 입력해주세요';
		 
	 } else if (pass == document.getElementById('confirmPassword').value) {

	    message.style.color = 'green';
	    message.innerHTML = '일치합니다';
       $('#pass_confirm').val('success');

	  } else {

	    message.style.color = 'red';
	    message.innerHTML = '일치하지 않습니다';

	  }

}