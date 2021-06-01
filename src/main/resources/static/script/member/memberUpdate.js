/**
 * 
 */

$(document).ready(function(){
	$('.submit').click(function() {
		
		if($('#nick_dup').val() == 'fail') {
			alert('닉네임 중복확인 해주세요');
			$('#nick').focus();
			return false;
		}
		
		const phone =  document.getElementById('myPagePhone').value;
		let check = 0;
		
		if(/^[0-9]{10,16}$/g.test(phone)){
    
		check = /[0-9]/.test(phone)?1:0;
		
		if(check != 1) {
			$('.phoneReg').html('숫자만 입력해주세요')
			return false;
		}
			
   		} else {
			$('.phoneReg').css('color', 'red');
			$('.phoneReg').html('10 ~ 16자리 숫자만 입력해주세요')
			return false;
		}
		
		$.ajax({
			url: '/pet/member/update',
			type: 'POST',
			data: {
				id: $('.myPageid').val(),
				name: $('#name').val(),
				nick: $('#nick').val(),
				email: $('#myPageEmail').val(),
				phone: $('#myPagePhone').val(),
				postCode: $('#postCode').val(),
				address: $('#address').val(),
				detailAddress: $('#detailAddress').val()
			},
			success: function() {
				$('#nickCheck').html('')
				$('.phoneReg').html('')
				$('#nick_dup').val('fail')
				alert('정보를 수정하였습니다')
			}
		})

	});
	
});