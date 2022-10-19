
function formCheck(){
	var f = document.regform; 
	
	if(f.custname.value == ""){
		alert("회원성명이 입력되지 않았습니다.");
		f.custname.focus();
		return false;
	}
	
	if(f.phone.value == ""){
		alert("회원전화를 입력하지 않았습니다.");
		f.custname.focus();
		return false;
	}
	
	if(f.address.value == ""){
		alert("회원전화를 입력하지 않았습니다.");
		f.address.focus();
		return false;
	}
	
	if(f.address.value == ""){
		alert("주소를 입력하지 않았습니다.");
		f.address.focus();
		return false;
	}
	
	if(f.joindate.value == ""){
		alert("가입일자를 입력하지 않았습니다.");
		f.joindate.focus();
		return false;
	}
	
	if(f.grade.value == ""){
		alert("등급을 입력하지 않았습니다.");
		f.grade.focus();
		return false;
	}
	
	if(f.city.value == ""){
		alert("도시코드를 입력하지 않았습니다.");
		f.city.focus();
		return false;
	}
	
	f.submit();
	
}