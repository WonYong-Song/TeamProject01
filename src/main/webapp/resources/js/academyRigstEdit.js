$(function() {
       var $items = $('#vtab>ul>li');
       $items.click (function() {
           $items.removeClass('selected');
           $(this).addClass('selected');

           var index = $items.index($(this));
           $('#vtab>div').hide().eq(index).show();
       }).eq(0).click ();
   });
   
/* 사진업로드 버튼 추가 ajax */   
 $(document).ready(function(){
  
  var maxAppend = 1; //버튼누른 횟수 저장
     // 사진추가 버튼 클릭시
     $("#addTrBtn").click(function(){
    	 if(maxAppend>=6) return;
         // tr 의 최대번호 구하기
         var lastTrNo = $("#example tr:last").attr("class").replace("imgUp", "");

         var newTr = $("#example tr:eq(1)").clone();
         newTr.removeClass();
         newTr.find("td:eq(0)").attr("rowspan", "1");
         newTr.addClass("imgUp"+(parseInt(lastTrNo)+1));
         $("#example").append(newTr);

         maxAppend++; 
     });
     var maxRemove= 1; //버튼누른 횟수 저장
     $("#trRemove").live("click", function() {
  	   if(maxRemove>=6) return;
   	    $(this).parent().parent().remove();
   	    maxRemove++;
  	  });
 });
 
 function introValidate(f) {
		if(f.AcaName.value==""){
			alert("학원이름을 입력해주세요");
			f.AcaName.focus();
			return false;
		}
		if(f.AcaAddress.value==""){
			alert("학원주소를 입력해주세요");
			f.AcaAddress.focus();
			return false;
		}
		if(f.AcaDetailAddress.value==""){
			alert("학원상세주소를 입력해주세요");
			f.AcaDetailAddress.focus();
			return false;
		}
		if(f.AcaHPNumber.value==""){
			alert("대표전화번호를 입력해주세요");
			f.AcaHPNumber.focus();
			return false;
		}
		if(f.introduce.value.length==0){
			alert("학원소개를 입력해주세요");
			f.introduce.focus();
			return false;
		}
	}
 
 function teaEditValidate(f) {
		if(f.teaImage.value==null){
			alert("강사사진을 등록해주세요");
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
 function teaRegiValidate(f) {
		if(f.teaImage.value==null){
			alert("강사사진을 등록해주세요");
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