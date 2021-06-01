
function emailSelect(){
	var target = document.getElementById('customSelect');
	var textBox = document.getElementById('email');

	if(target.options[target.selectedIndex].text=='직접입력') {
		textBox.value = '';
		textBox.focus();
	} else {
		textBox.value = target.options[target.selectedIndex].text;
	}
	
	
}

