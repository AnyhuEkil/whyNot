$(document).ready(function(){
	
});


// ���� ���� .. ��ü ��¥, ��,��,��,����
var whyDateVal; 
var whyYear; //��������
var whyMonth = []; //[������(1~12)] 
var whyDate = []; //[������,] 
var whyDay = []; //[������(0~6),x����] 

// Lpad�Լ� ����
if(!String.prototype.whyLpad){
	String.prototype.whyLpad = function whyLpad(n, str) { 
		return Array(n - String(this).length + 1).join(str || '0') + this;
	}
}


(function(){
	setDate();
}());



//���� or �޴� ��¥�� ���� ������ ����
function setDate(val){
	console.log(val);
	this.inputDate = (val == null) ? new Date() : new Date(val) ;
	whyYear = inputDate.getFullYear();
	var yearVal = (whyYear+"").whyLpad(4,"0");
	whyMonth[0] = (inputDate.getMonth()+1);
	console.log(whyMonth[0]);
	var monthVal = (whyMonth[0]+"").whyLpad(2,"0");
	whyDate[0] = inputDate.getDate();
	var dateVal = (whyDate[0]+"").whyLpad(2,"0");
	whyDateVal = yearVal+"-"+monthVal+"-"+dateVal;
	console.log(whyDateVal);
	$('#whyDateSelect').val(whyDateVal);
	whyDay[0] = inputDate.getDay();  //������ Num���� ���ڷ� ����
	whyDay[1] = (function(){				   
		switch (whyDay[0]) {
		    case 0:
		        whyDay[0] = "Sunday";
		        break;
		    case 1:
		    	whyDay[0] = "Monday";
		        break;
		    case 2:
		    	whyDay[0] = "Tuesday";
		        break;
		    case 3:
		    	whyDay[0] = "Wednesday";
		        break;
		    case 4:
		    	whyDay[0] = "Thursday";
		        break;
		    case 5:
		    	whyDay[0] = "Friday";
		        break;
		    case 6:
		    	whyDay[0] = "Saturday";
		}return whyDay[0];
	}());
	$('#whyDateshow').html(whyDateVal+" ["+whyDay[1]+"]");
}
// Ŭ�� ��ư�� ������, input date���� �Է��� ������ ���� �θ���. // ���߿� �̰� ������� �����ٷ� �޷� ��ȯ�ҿ���.
$('#whySetCalendar').click (function(){
	setDate($('#whyDateSelect').val());
});

//�޷¿� ���� ��¥�� �迭�� ������.

���⼭���� �ϸ�ȴ�!!

var calendarDayArray = [];
$('.calendarDay').each(function (idx,item){
	calendarDayArray[idx] = $(item).text();
});

console.log(calendarDayArray.length);
console.log(calendarDayArray[1]);

// whyDay[0] = 0 �̸�, calendarDayArray[0]���� ä���.
// whyDay[0] = 1 �̸�, calendarDayArray[1]���� ä���.
//
//
//
// whyDay[0] = 6 �̸�, calendarDayArray[6]���� ä���.

// whyDay[0] + 








