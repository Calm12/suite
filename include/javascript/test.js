$(document).ready(function(){
	if(!confirm('You want edit this?')){
		document.location.href = '/index.php?module=Accounts';
	}
})