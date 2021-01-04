 window.onload = function() {
            selectTab(0);
        }

        function selectTab(idx) {
            var tabs = document.getElementsByClassName("tab");
            var content = document.getElementsByClassName("bookContent");
            for (var i = 0; i < tabs.length; i++) {
                tabs[i].style.color = "lightgray";
            }
            for (var i = 0; i < content.length; i++) {
                content[i].style.display = "none";
            }
            tabs[idx].style.color = "black";
            tabs[idx].style.fontSize = "bold";
            content[idx].style.display = "block";
        }
