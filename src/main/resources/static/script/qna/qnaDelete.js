/**
 * 
 */

function qnaDelete(n) {
	const result = confirm('삭제하시겠습니까?');
	
	if(result) {
		location.href = 'delete?num=' + n;
	} 
}