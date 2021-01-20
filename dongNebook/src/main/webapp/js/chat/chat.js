 window.onload = function() {
            selectTab(0);
        }

        function selectTab(idx) {
            var tabs = document.getElementsByClassName("tab");
            var content = document.getElementsByClassName("bookContent");
            for (var i = 0; i < tabs.length; i++) {
                $(tabs[i]).css('color', 'lightgray');
            }
            for (var i = 0; i < content.length; i++) {
                $(content[i]).css('display', 'none');
            }
            $(tabs[idx]).css('color','black');
            $(tabs[idx]).css('fontSize','bold');
            $(content[idx]).css('display', 'block');
        }
