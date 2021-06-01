function idCheck() {
	var id = document.getElementById('id').value;
	var idCheck = document.getElementById('idCheck');
	var check = 0;
	
    if(/^[a-z0-9_]{5,20}$/g.test(id)){
    
		check += /[a-z]/.test(id)?1:0;
		check += /[0-9]/.test(id)?1:0;
		check += /[_]/.test(id)?1:0;
		
			if(check >=2) {
			
				idCheck.style.color = 'green';
        		idCheck.innerHTML = '중복확인 해주세요';
        		
			} else {
			
				idCheck.style.color = 'red';
				idCheck.innerHTML = '영문 소문자, 숫자를 조합한 5~20자리여야 합니다(특수문자 "_" 사용가능)';
				
			}
			
   	} else {
   	
		idCheck.style.color = 'red';
		idCheck.innerHTML = '영문 소문자, 숫자를 조합한 5~20자리여야 합니다(특수문자 "_" 사용가능)';
		
	}

}