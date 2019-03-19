function introValidate(f) {
		if(f.acaname.value==""){
			alert("학원이름을 입력해주세요");
			f.acaname.focus();
			return false;
		}
		if(f.address.value==""){
			alert("학원주소를 입력해주세요");
			f.address.focus();
			return false;
		}
		if(f.detailaddress.value==""){
			alert("학원상세주소를 입력해주세요");
			f.detailaddress.focus();
			return false;
		}
		if(f.telephone1.value==""){
			alert("대표전화번호를 입력해주세요");
			f.telephone1.focus();
			return false;
		}
		if(f.telephone2.value==""){
			alert("대표전화번호를 입력해주세요");
			f.telephone2.focus();
			return false;
		}
		if(f.telephone3.value==""){
			alert("대표전화번호를 입력해주세요");
			f.telephone3.focus();
			return false;
		}
		if(f.categoryBox.value=""){
			alert("학원분류를 입력해주세요");
			return false;
		}
		
		if(f.introduce.value.length==0){
			alert("학원소개를 입력해주세요");
			f.introduce.focus();
			return false;
		}
		
	}
 
 function teaRegiValidate(f) {
	 
	var fileCheck = document.getElementById("teaImage").value;
	 
	if(!fileCheck){
		alert("강사사진을 첨부해 주세요");
		return false;
	}	
	if(f.teaName.value==""){
		alert("강사이름을 입력해주세요");
		f.teaName.focus();
		return false;
	}
	if(f.teaInfo.value.length==0){
		alert("강사 소개를 입력해주세요");
		f.teaInfo.focus();
		return false;
	}
	if(f.subject.value==""){
		alert("강사담당 과목을 입력해주세요");
		f.subject.focus();
		return false;
	}

}
 
 function classRegiValidate(f) {
		if(f.acaStartdate.value==""){
			alert("강의시작일자를 입력해주세요");
			return false;
		}
		if(f.acaEnddate.value==""){
			alert("강의종료일자를 등록해주세요");
			return false;
		}
		if(f.acaStartTime.value==""){
			alert("강의시작시간을 입력해주세요");
			return false;
		}
		if(f.acaEnddate.value==""){
			alert("강의종료시간을 등록해주세요");
			return false;
		}
		if(f.acaDay.value==""){
			alert("강의요일을 입력해주세요");
			f.acaDay.focus();
			return false;
		}
		if(f.acaClassName.value==""){
			alert("강의명을 입력해주세요");
			f.acaClassName.focus();
			return false;
		}
		if(f.teaName.value==""){
			alert("강사명을 입력해주세요");
			f.teaInfo.focus();
			return false;
		}
		if(f.subject.value==""){
			alert("강사담당 과목을 입력해주세요");
			f.subject.focus();
			return false;
		}
		if(f.pay.value==""){
			alert("수강료를 입력해주세요");
			f.pay.focus();
			return false;
		}
		if(f.NumberOfParticipants.value==""){
			alert("수강인원을 입력해주세요");
			f.NumberOfParticipants.focus();
			return false;
		}
	}