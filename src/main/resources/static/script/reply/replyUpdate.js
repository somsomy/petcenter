/**
 * 
 */

$(document).ready(function(){
	$(document).on('click', '.combtn', function() {
		$.ajax({
			url: '/volunteer/reply/write',
			type: 'POST',
			data: {boardNum:$('.boardNum').val(), content:$('#comtext').val()},
			success: function() {
				$('.outerReply').empty();
				replyList();
				$('#comtext').val('');
			}
		})
	})
	
	$(document).on('click', '.replyWrite', function() {
		$(this).parents('#reply').next().children('.combtn2').after(
			'<input type="button" class="combtn3" value="작성">'
		)
		$(this).parents('#reply').next().children('.repReWrite').hide();
		$(this).parents('#reply').next().children('.combtn2').before(
			'<textarea class="repReWrite repBox" ></textarea>'	
		)
		$(this).parents('#reply').next().children('.combtn2').hide();
		$(this).parents('#reply').next().show();
	})
	
	$(document).on('click', '.combtn3', function() {
		$.ajax({
			url: '/volunteer/reply/rewrite',
			type: 'POST',
			data: {num: $(this).siblings('#repNum').val(), 
					content: $(this).siblings('.repBox').val(),
					boardNum:$('.boardNum').val(),
					reRef:$(this).siblings('.reRef').val(),
					reLev:$(this).siblings('.reLev').val(),
					reSeq:$(this).siblings('.reSeq').val()},
			success: function() {
				$('.outerReply').empty();
				replyList();
			}
		})
	})
	
	$(document).on('click', '.replyUpdate',function() {
		$(this).parents().next().show()
	});
	
	$(document).on('click', '.combtn2',function() {
		$.ajax({
			url: '/volunteer/reply/update',
			type: 'POST',
			data: {num: $(this).siblings('#repNum').val(), content: $(this).siblings('.repReWrite').val()},
			success: function() {
				$('.outerReply').empty();
				replyList();
			}
		})
		
	});
	
	$(document).on('click', '.replyDelete', function() {
		let delResult = confirm('삭제하시겠습니까?');
		
		if(delResult) {
			$.ajax({
				url: '/volunteer/reply/delete',
				type: 'POST',
				data: {num: $(this).parents('#reply').next().children('#repNum').val(),
						boardNum: $('.boardNum').val(),
						reRef:$(this).parents('#reply').next().children('.reRef').val(),
						reLev:$(this).parents('#reply').next().children('.reLev').val()
				},
				success: function() {
					$('.outerReply').empty();
					replyList();
				}
			})
		}
	})
		
	$(document).on('click', '.repUpdateCancel',function() {
		$(this).closest('.replyUpdateContainer').hide();
	});
	
	function replyList() {
		$.ajax({
			url: '/volunteer/content/reply',
			type: 'POST',
			data: {pageNum: $('.pageNum').val(), boardNum: $('.boardNum').val()},
			success: function(rdata) {
				for(const i in rdata) {
					const originDate = new Date(rdata[i].date);
					const y = originDate.getFullYear();
					const m = originDate.getMonth();
					const d = originDate.getDate();
					const h = originDate.getHours();
					const mm = originDate.getMinutes();
					const date = y + '.' + m + '.' + d + ' ' + h + ':' + mm;
					
					let repUpdateDelete = '';
					let replyContent = '';
					
					if($('.repNick').val()==rdata[i].name) {
						repUpdateDelete = '<a class="replyDelete">삭제</a><a class="replyUpdate">수정</a>';
					}
					console.log(rdata[i].delete_at)
					
					if(!rdata[i].delete_at) {
						replyContent = '<td class="rep">' + rdata[i].name + '</td>'
										+ '<td>'
										+ repUpdateDelete
										+ '<a class="replyWrite">답글</a>'
										+ '</td>'
										+ '</tr>'
										+ '<tr>'
										+ '<td class="rep" colspan="2">'+ date +'</td>'
										+ '</tr>'
										+ '<tr>'
										+ '<td class="recon" colspan="2">'+ rdata[i].content +'</td>'
					} else {
						replyContent = '<td>삭제된 댓글입니다.</td>'
					}

					$('.outerReply').append(
					'<table id="reply">'
					+ '<tr><td rowspan="3">'
					+ '<img src="/images/board/blank.png" width="' + rdata[i].reLev * 5 + '" >'
					+ '</td>'
					+ replyContent
					+ '</tr>'
					+ '</table>'
					+ '<div class="replyUpdateContainer">'
					+ '<input type="hidden" id="repNum" value="'+ rdata[i].num +'">'
					+ '<input type="hidden" class="reRef" value="'+ rdata[i].reRef +'">'
					+ '<input type="hidden" class="reLev" value="'+ rdata[i].reLev +'">'
					+ '<input type="hidden" class="reSeq" value="'+ rdata[i].reSeq +'">'
					+ '<textarea name="content" class="repReWrite" >'+ rdata[i].content +'</textarea>'
					+ '<input type="button" class="combtn2" value="작성">'
					+ '<input type="button" class="repUpdateCancel" value="취소">'
					+ '</div>'
					)
				}
				
				$('#page_control').load(location.href + ' #page_control');
			}
		})
	}
	
});