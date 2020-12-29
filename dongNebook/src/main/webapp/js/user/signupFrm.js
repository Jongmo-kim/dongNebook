 var isDebugMode = false;
    $(function () {
		$('#nameInput').on('blur',nameInputRegFunc);
		$('#dateInput').on('blur',dateInputRegFunc);
		$('#phoneInput').on('blur',phoneInputRegFunc);
		$('#idInput').on('blur',idInputRegFunc);
		$('#pwInput').on('blur',pwInputRegFunc);
		$('#pwreInput').on('blur',pwreInputRegFunc);
		$('#emailInput').on('blur',emailInputRegFunc);
		$('#submitBtn').on('click',submitBtnFunc);
    });
	function nameInputRegFunc(){
		var Regexp = /^[가-힣]{2,4}$/i;
		var inputVal = $('#nameInput').val();
		if(Regexp.test(inputVal)){
			$('#nameInput').removeClass('form-textbox-wrong');
			$('#nameInfo').html('');
			return true;
		 }else {
			$('#nameInput').addClass('form-textbox-wrong');
			$('#nameInfo').html('🚫 한글 2~4글자만 입력해주세요.');
			return false;
		}
		
	};
	function dateInputRegFunc(){
		var inputVal = $('#dateInput').val();
		var Regexp = /^\d{4}년\s\d{2}월\s\d{2}일$/g;
		if(Regexp.test(inputVal)){
			if(isModernDate(inputVal)){
				$('#dateInput').removeClass('form-textbox-wrong');
				$('#dateInfo').html('');
				return true;
			} else {
				$('#dateInput').addClass('form-textbox-wrong');
				$('#dateInfo').html('🚫 1850년 01월 01일 ~ 2020년 12월 02일 사이의 값을 입력해주세요.')
				return false;				
			}
		} else{
			$('#dateInput').addClass('form-textbox-wrong');
			$('#dateInfo').html('🚫 입력하지 않은 값이 있습니다.')
			return false;
		}
	}
	function isModernDate(inputVal){
		var maxDate = "2020년 12월 31일";
		var minDate = "1850년 01월 01일";
		var maxInt = moment(maxDate, 'YYYY년 MM월 DD일').toDate().getTime();
		var minInt = moment(minDate, 'YYYY년 MM월 DD일').toDate().getTime();
		var inputInt = moment(inputVal, 'YYYY년 MM월 DD일').toDate().getTime();
		// minInt<inputInt <maxInt
		return (minInt < inputInt && inputInt < maxInt);
	}
	function phoneInputRegFunc(){
		var inputVal = $('#phoneInput').val();
		var regexp = /^\d{3}-\d{4}-\d{4}$/g;
		if(regexp.test(inputVal)){
			$('#phoneInput').removeClass('form-textbox-wrong');
			$('#phoneInfo').html('');
			return true;
		} else {
			$('#phoneInput').addClass('form-textbox-wrong');
			$('#phoneInfo').html('🚫 입력하지 않은 값이 있습니다.');
			return false;
		}
	}
	function idInputRegFunc(){
		var regexp = /^[a-z]+[a-z0-9]{5,19}$/g;
		var inputVal = $('#idInput').val();
        if(regexp.test(inputVal)){
			if(isIdNested()){
				$('#idInput').addClass('form-textbox-wrong');
				$('#idInfo').html("🚫 중복된 ID입니다.");
				return false;
			} else {
				$('#idInput').removeClass('form-textbox-wrong');
				$('#idInfo').html("");
				return true;
			}
        }else {
			$('#idInput').addClass('form-textbox-wrong');
			$('#idInfo').html("🚫 아이디는 영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.");
			return false;
		}
	}
	
	function isIdNested(){
		var inputId = $('#idInput').val();
		var isNested = true;
		$.ajax({
			url:"/idNestedCheck",
			data:{inputId:inputId},
			async: false,
			success : function(data){
				isNested = Boolean(data.isNested);
			},
			error : function(data){
				$('#idInput').val('서버와 통신이 원할하지않습니다.');				
			}
		});
		return isNested;
	}

	function pwInputRegFunc(){
		var inputVal = $('#pwInput').val();
		var regexp = /(?=^.{6,255}$)((?=.*\d)(?=.*[A-Z])(?=.*[a-z])|(?=.*\d)(?=.*[^A-Za-z0-9])(?=.*[a-z])|(?=.*[^A-Za-z0-9])(?=.*[A-Z])(?=.*[a-z])|(?=.*\d)(?=.*[A-Z])(?=.*[^A-Za-z0-9]))^.*/g;
		if(regexp.test(inputVal)){
			$('#pwInput').removeClass('form-textbox-wrong');
			$('#pwInfo').html('');
			return true;
		} else{
			$('#pwInput').addClass('form-textbox-wrong');
			$('#pwInfo').html('🚫 최소 1개 이상의 영어 대소문자, 특수문자, 숫자를입력해주세요. 최소 6문자이상을 입력해주세요.');
			return false;
		}
	}
	function pwreInputRegFunc(){
		var inputVal = $('#pwreInput').val();
		var pwVal = $('#pwInput').val();
		if(inputVal == pwVal){
			$('#pwreInput').removeClass('form-textbox-wrong');
			$('#pwreInfo').html('');
			return true;
		} else{
			$('#pwreInput').addClass('form-textbox-wrong');
			$('#pwreInfo').html('🚫 비밀번호가 일치하지 않습니다.');
			return false;
		}
	}
	function emailInputRegFunc(){
		var regexp = /^[0-9a-zA-Z][0-9a-zA-Z\_\-\.\+]+[0-9a-zA-Z]@[0-9a-zA-Z][0-9a-zA-Z\_\-]*[0-9a-zA-Z](\.[a-zA-Z]{2,6}){1,2}$/g
		var inputVal = $('#emailInput').val();
		if(regexp.test(inputVal)){
			$('#emailInfo').html('');
			$('#emailInput').removeClass('form-textbox-wrong');
			return true;
		} else {
			$('#emailInfo').html('🚫 양식에 맞게 이메일을 입력해주세요');
			$('#emailInput').addClass('form-textbox-wrong');
			return false;
		}
	}
	function addrInputFunc(){
			if($('#addrInput').val()!=" "){
				$('#addrInfo').html('');
				$('#addrInput').removeClass('form-textbox-wrong');
				return true;				
			} else{
				$('#addrInfo').html('🚫 주소를 입력해주세요.');
				$('#addrInput').addClass('form-textbox-wrong');
				return false;				
			}	
	}
	function genderInputFunc(){
		var input = $('input[name="customerGen"]');
		var isChecked = $(input).is(':checked');
		
		if(isChecked){
			$('#genInfo').html('');
			return true;
		} else {
			$('#genInfo').html('🚫 성별을 입력해주세요.');
			return false;
		}
	}
	function isEmpty(str){
       
      if(typeof str == "undefined" || str == null || str == "")
          return true;
      else
          return false ;
  	}
	function submitBtnFunc(e){
		if(isAllPassed()){
			
		} else {
			window.scrollTo(0, 0);
			return false;
		}
	}
	function isAllPassed(){
				console.log(emailInputRegFunc(),
				pwreInputRegFunc(), 
				dateInputRegFunc(),
				phoneInputRegFunc(), 
				idInputRegFunc(), 
				pwInputRegFunc(),
				pwreInputRegFunc(), 
				addrInputFunc(),
				genderInputFunc())
		return (emailInputRegFunc() && pwreInputRegFunc() && 
				dateInputRegFunc() && phoneInputRegFunc() && 
				idInputRegFunc() && pwInputRegFunc() && 
				pwreInputRegFunc() && addrInputFunc() && genderInputFunc());
	}
	