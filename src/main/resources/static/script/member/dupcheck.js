  $(document).ready(function(){
		$('.iddup').click(function() {
			if($('#id').val() == '') {
				$('#idCheck').html('아이디를 입력해주세요');
				return;
			}
			
			$.ajax({
				url: '/member/idcheck',
				type: 'POST',
				data:{id : $('#id').val()},
				success: function(rdata){
					if(rdata == 'iddup'){
						rdata = '아이디 중복';
						$('#idCheck').css('color', 'red');
					}else if(rdata == 'wrong'){
						rdata = '영문 소문자, 숫자를 조합한 5~20자리여야 합니다(특수문자 "_" 사용가능)';
						$('#idCheck').css('color', 'red');
					} else {
						rdata = '아이디 사용가능';
						$('#idCheck').css('color', 'green');
						$('#id_dup').val('success');
					}
						
					$('#idCheck').html(rdata);
				}
			});
		});
		
		$('.nickdup').click(function() {
			if($('#nick').val() == '') {
				$('#nickCheck').html('닉네임을 입력해주세요');
				return;
			}
			
			$.ajax({
				url: '/nickcheck',
				type: 'POST',
				data:{nick : $('#nick').val(), id: $('.myPageid').val()},
				success: function(rdata){
					if(rdata == 'nickdup'){
						rdata = '닉네임 중복';
						$('#nickCheck').css('color', 'red');
					}else if(rdata == 'wrong'){
						rdata = '영문 대소문자, 숫자, 한글(자음 또는 모음만 사용불가) 포함 10자리 이하 사용 가능';
						$('#nickCheck').css('color', 'red');
					} else {
						rdata = '닉네임 사용가능';
						$('#nickCheck').css('color', 'green');
						$('#nick_dup').val('success');
						
					}
						
					$('#nickCheck').html(rdata);
				}
			});
		});
	});