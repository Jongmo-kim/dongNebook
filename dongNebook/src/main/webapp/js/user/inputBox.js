 var isDebugMode = false;
    $(function () {
        //form-textbox에 먼저 이벤트를 할당하면 원하는대로 동작하지않음
        $('.dateOfBirth').on('focus click', dateOfBirthFunc);
        $('.dateOfBirth').on('blur', dateOfBirthBlurEvent);
        $('.dateOfBirth').on('keydown', dateOfBirthKeyFunc);
		
        $('.phoneInput').on('focus click', phoneInputFunc);
        $('.phoneInput').on('blur', phoneInputBlurEvent);
        $('.phoneInput').on('keydown', phoneInputKeyFunc);

        $('.form-textbox').on('focus', formTextboxFocusEvent);
        $('.form-textbox').on('blur', formTextboxBlurEvent);
        $('.form-label').on('click', formLabelClickEvent);
		
		$('.resetBtn').on('click',function(){
			var inputTag = $('.form-textbox');
			$(inputTag).val('');
			$(inputTag).trigger('blur');
		});
    });
    function dateOfBirthFunc(e) {
        if (isDebugMode) {
            console.log('dateOfBirthFunc event');
        }
        var inputVal = $(this).val();
        var inputTag = $(this);
        var startpos = this.selectionStart;
        setCursor(this,0);

        if (inputVal == "") {
            $(inputTag).val("yyyy년 mm월 dd일");
            setCursor(this,0);
        }
        return false;
    }
    function dateOfBirthBlurEvent() {
        var inputVal = $(this).val();
        var inputTag = $(this);
        if (isDebugMode) {
            console.log('dateOfBirthBlurEvent event');
        }
        if (inputVal == "yyyy년 mm월 dd일") {
            $(inputTag).val("");
        }
    }
    function dateOfBirthKeyFunc(e) {
        var inputTag = $(this);
        var inputVal = $(this).val();
        var currCursorPosition = this.selectionStart;
        var keycode = e.keyCode;
        var regExpIsNum = /^[0-9]$/i;
        if (isDebugMode) {
            console.log("currCursorPosition :%d", currCursorPosition);
            console.log("inputVal :%s", inputVal);
            console.log("keyCode :%d", keycode);
            console.log("e.key :", e.key);
            console.log("regExpIsNum", regExpIsNum.test(e.key));
            console.log("fromCharCode(keycode) :%s", String.fromCharCode(keycode));
        }

        //e.key, e.keycode의 차이는 keycode는 키보드의 버튼과 연동된코드, key는 버튼과 매핑된 입력값
        //입력된 key값이 
        //if 백스페이스키면 
        //else if 0~9 숫자면
        //else if 특수문자면 !@#$ 같은거
        if (isBackspaceKey(keycode)) {
            var arrayOfinputVal = inputVal.split('');
            if (currCursorPosition == 0) {

            } else if (isdeletableCursor(currCursorPosition)) {
                deleteOneCharAndReplaceAlphabet(inputTag, arrayOfinputVal, currCursorPosition);
                currCursorPosition = toPrevCurrCursor(currCursorPosition);
                setCursor(inputTag, currCursorPosition);
                return false;
            } else {
                setCursorToEditablePlace(inputTag, currCursorPosition);
                return false;
            }
        } else if (isNumInkeyboard(e.key)) {
            keycode = adjustNumberPadKeyCode(keycode);
            var charfromKeycode = String.fromCharCode(keycode);
            var arrayOfinputVal = inputVal.split('');
            
            if (!isCurrectCursor(currCursorPosition)) {
                if (isBetweenNum(4,currCursorPosition,5)) {
                    setCursor(inputTag,6);
                }
                else if (isBetweenNum(8,currCursorPosition,9)) {
                    setCursor(inputTag,10);
                }
                return false;
            }
            arrayOfinputVal[currCursorPosition] = charfromKeycode;
            currCursorPosition = toNextCurrCursor(currCursorPosition);
            $(inputTag).val(toStringFromCharArr(arrayOfinputVal));
            setCursor(inputTag,currCursorPosition);

            return false;
        } else if (isSpecalChar(e.key)) {
            return false;
        }
    }
    //구분선
    function phoneInputFunc(e) {
        if (isDebugMode) {
            console.log('phoneInputFunc event');
        }
        var inputVal = $(this).val();
        var inputTag = $(this);
        var startpos = this.selectionStart;
        setCursor(this,0);

        if (inputVal == "") {
            $(inputTag).val("nnn-nnnn-nnnn");
            setCursor(this,0);
        }
        return false;
    }
    function phoneInputBlurEvent() {
        var inputVal = $(this).val();
        var inputTag = $(this);
        if (isDebugMode) {
            console.log('dateOfBirthBlurEvent event');
        }
        if (inputVal == "nnn-nnnn-nnnn") {
            $(inputTag).val("");
        }
    }
    function phoneInputKeyFunc(e) {
        var inputTag = $(this);
        var inputVal = $(this).val();
        var currCursorPosition = this.selectionStart;
        var keycode = e.keyCode;
        var regExpIsNum = /^[0-9]$/i;
        if (isDebugMode) {
            console.log("currCursorPosition :%d", currCursorPosition);
            console.log("inputVal :%s", inputVal);
            console.log("keyCode :%d", keycode);
            console.log("e.key :", e.key);
            console.log("regExpIsNum", regExpIsNum.test(e.key));
            console.log("fromCharCode(keycode) :%s", String.fromCharCode(keycode));
        }

        //e.key, e.keycode의 차이는 keycode는 키보드의 버튼과 연동된코드, key는 버튼과 매핑된 입력값
        //입력된 key값이 
        //if 백스페이스키면 
        //else if 0~9 숫자면
        //else if 특수문자면 !@#$ 같은거
        if (isBackspaceKey(keycode)) {
            var arrayOfinputVal = inputVal.split('');
            if (currCursorPosition == 0) {

            } else if (isdeletableCursorForPhone(currCursorPosition)) {
                deleteOneCharAndReplaceAlphabetForPhone(inputTag, arrayOfinputVal, currCursorPosition);
                currCursorPosition = toPrevCurrCursorForPhone(currCursorPosition);
                setCursor(inputTag, currCursorPosition);
            } else {
                setCursorToEditablePlace(inputTag, currCursorPosition);
            }
            return false;
        } else if (isNumInkeyboard(e.key)) {
            keycode = adjustNumberPadKeyCode(keycode);
            var charfromKeycode = String.fromCharCode(keycode);
            var arrayOfinputVal = inputVal.split('');
            
            if (!isCurrectCursorForPhone(currCursorPosition)) {
                if (isBetweenNum(3,currCursorPosition,3)) {
                    setCursor(inputTag,4);
                }
                else if (isBetweenNum(9,currCursorPosition,9)) {
                    setCursor(inputTag,10);
                }
                return false;
            }
            arrayOfinputVal[currCursorPosition] = charfromKeycode;
            currCursorPosition = toNextCurrCursorForPhone(currCursorPosition);
            $(inputTag).val(toStringFromCharArr(arrayOfinputVal));
            setCursor(inputTag,currCursorPosition);

            return false;
        } else if (isSpecalChar(e.key)) {
            return false;
        }

    }
    //구부눈부눕눕누
    function adjustNumberPadKeyCode(keycode){
                if (keycode > 57) {
                // Mozilia , IE keycode일 경우 48을 뺴주면된다.
                // https://unixpapa.com/js/key.html 키코드표 참고
                    keycode -= 48;
                }
                return keycode;
            }
    function setCursorToEditablePlace(inputTag, cursor) {
        //6, 10 , 13 - > 4, 8 , 12
        if (cursor <= 6) {
            $(inputTag)[0].setSelectionRange(4, 4);
        } else if (cursor <= 10) {
            $(inputTag)[0].setSelectionRange(8, 8);
        } else {
            $(inputTag)[0].setSelectionRange(12, 12);
        }
    }
    function deleteOneCharAndReplaceAlphabet(inputTag, arrayOfinputVal, cursor) {
        if (cursor <= 6) {
            arrayOfinputVal[cursor - 1] = 'y';
        } else if (cursor <= 10) {
            arrayOfinputVal[cursor - 1] = 'm';
        } else {
            arrayOfinputVal[cursor - 1] = 'd';
        }
        $(inputTag).val(toStringFromCharArr(arrayOfinputVal));
    }
    function deleteOneCharAndReplaceAlphabetForPhone(inputTag, arrayOfinputVal, cursor) {

        arrayOfinputVal[cursor - 1] = 'n';        
        $(inputTag).val(toStringFromCharArr(arrayOfinputVal));
    }
    function setCursor(inputTag, cursor) {
        $(inputTag)[0].setSelectionRange(cursor, cursor);
    }
    function isBackspaceKey(keycode) {
        return keycode == 8;
    }
    function formLabelClickEvent() {
        if (isDebugMode) {
            console.log('formLabelClickEvent');
        }
        var inputTag = $(this).prev();
        $(inputTag).focus();
        return false;
    }
    function formTextboxFocusEvent(e) {
        if (isDebugMode) {
            console.log('formTextboxFocusEvent is called');
        }
        var nextSpan = $(this).next();
        var inputVal = $(this).val();
        focusNextSpan(nextSpan, inputVal);

    }
	function focusNextSpan(nextSpan, inputVal){
		$(nextSpan).addClass('label-focused');
	}
    function formTextboxBlurEvent(e) {
        if (isDebugMode) {
            console.log('formTextboxBlurEvent is called');
        }
        var nextSpan = $(this).next();
        var inputVal = $(this).val();
        blurNextSpan(nextSpan, inputVal);
    }
	function blurNextSpan(nextSpan,inputVal){
		if ($(nextSpan).is('.label-focused') && inputVal == "") {
			$(nextSpan).removeClass('label-focused');
		}
	} 
    function toggleNextSpan(nextSpan, inputVal) {
        if ($(nextSpan).is('.label-focused')) {
            if (inputVal == "") {
                $(nextSpan).removeClass('label-focused');
            }
        } else {
            $(nextSpan).addClass('label-focused');
        }
    }


    function toStringFromCharArr(arr){
        return arr.join("").substring(0, 13);
    }

    function isCurrectCursor(cursor) {
        //4~5,8~9,12~14일떈 거짓 왜냐면 이때커서는 년,월 또는 공백을 제거함
        return !(isBetweenNum(4,cursor,5)|| isBetweenNum(8,cursor,9) || isBetweenNum(12,cursor,14));
    }
    function isCurrectCursorForPhone(cursor){
        return !(isBetweenNum(3,cursor,3)|| isBetweenNum(8,cursor,8));
    }
    function isdeletableCursor(cursor) {
        //yyyy 0~3, mm 5~7, dd 9~11
        //이므로 cursor는 1~4 7~8 11~12에서만 지울수잇음
        //커서는 해당커서뒤쪽에있는 값을 지우고 커서를 -1만큼 움직인다.
        return (isBetweenNum(1,cursor,4)|| isBetweenNum(7,cursor,8)|| isBetweenNum(11,cursor,12));
    }
    function isdeletableCursorForPhone(cursor){
        return !(cursor == 4 || cursor == 9);
    }
    function isSpecalChar(keycode) {
        //특수문자면 트루 아니면 false
        //일단 임시방편으로 key가 한글자로 
        var regExp = /^.$/i;
        return regExp.test(keycode);
    }
    function isBetweenNum(smallerNum,val, biggerNum){
        // smallerNum <= val <= biggerNum
        return smallerNum <= val && val <= biggerNum;
    }
    function toPrevCurrCursor(cursor) {
        //cursor위치 
        //yyyy 0~3, mm 5~7, dd 9~11
        // 3<= cursor <=6 or 8<= cursor<=10 or 12<= cursor<=14 일때만 -3 
        // 이때는 숫자가아닌 다른걸 지운다는뜻 그러므로 커서를 숫자위치로보낸다
        if (cursor == 10) {
            return 7;
        }
        return --cursor;
    }
    function toPrevCurrCursorForPhone(cursor){
        if (cursor == 5 || cursor == 10){
            return cursor-2;
        }
        return --cursor;
    }
    function toNextCurrCursor(cursor) {
        //cursor위치 
        //yyyy 0~3, mm 5~7, dd 9~11
        //즉 3, 7 일때만 다음커서로 옮겨준다 5, 9 로
        if (cursor == 3 || cursor == 7) {
            return cursor + 3;
        }

        return ++cursor;
    }
    function toNextCurrCursorForPhone(cursor) {
        if (cursor == 2 || cursor == 7) {
            return cursor + 2;
        }
        return ++cursor;
    }
    function isNumInkeyboard(keycode) {
        var regExpIsNum = /^[0-9]$/i;
        return regExpIsNum.test(keycode);
    }
 
