$(document).ready(function(){
	
});

// 4��, ����:�����, ���޾ƴ�.

// ��¥ �Է� : whyDateSelect (type=date)

/*
function whySetCalendar(){
	whyDateVal = document.getElementById('whyDateSelect').value;
	whyYear = whyDateVal.getFullYear();
	whyMonth = whyDateVal.getFullYear();
	whyDay = whyDateVal.getDay();
}

*/



var whyDateVal;
var whyYear;
var whyMonth;
var whyDate;
var whyDay;

function a() {
	whyYear = new Date().getFullYear();
	alert(whyYear);
	whyMonth = new Date().getMonth();
	whyDate = new Date().getDate();
	whyDay = new Date().getDay();
	whyDateVal = whyYear+"-"+whyMonth+"-"+whyDate;
	alert(whyDateVal);
	document.getElementById("whyDateshow").innerHTML = whyDateVal;
	document.getElementById('whyDateSelect').value = whyDateVal;
}

function whySetCalendar(){
	whyDateVal = document.getElementById('whyDateSelect').value;
	alert(whyDateVal);
	document.getElementById("whyDateshow").innerHTML = whyDateVal;
}

