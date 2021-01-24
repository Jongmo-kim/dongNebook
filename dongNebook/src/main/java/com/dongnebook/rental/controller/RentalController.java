@RequestMapping("/insertBookRental.do")
    public String insertBookRental(Model model, String placeName, String addr, String phone, HttpSession session, int[] bookNo) {
        RentalLoc rLoc = new RentalLoc();
        BookRental bRental = null;
        ArrayList<BookRental> bRList = new ArrayList<BookRental>();
        rLoc.setPlaceName(placeName);
        rLoc.setAddr(addr);
        rLoc.setPhone(phone);
        User loginUser = (User)session.getAttribute("loginUser");
        int userNo = loginUser.getUserNo();
        int resultLoc = service.insertLoc(rLoc); 
        if(resultLoc>0) {
            model.addAttribute("msg","대출장소 등록 성공");
        }else {
            model.addAttribute("msg","대출장소 등록 실패");
        }
        RentalLoc lastLoc = service.lastLoc();
        System.out.println(bookNo);
        for(int i : bookNo) {
            //이 부분은 대출했을때 책 수를 차감하기 위함!
            bRental = new BookRental();
            bRental.setUserNo(userNo);
            bRental.setBookNo(i);
            bRental.setRentalLocationNo(lastLoc.getRentalLocationNo());
            bRList.add(bRental);
        }
        boolean isBookRentalLimitOver = service.isBookRentalLimitOver(loginUser);

        if(!isBookRentalLimitOver) {
            int BookRental = service.insertBookRental(bRList);
            if(BookRental>0) {
                //book테이블에 bookCount와 rCount 가감작업
                int bookUpdateCount = service.updateCount(bookNo);
                if(bookUpdateCount>0) {
                    model.addAttribute("msg","대출 성공");
                    model.addAttribute("result", "true");
                }
            }else {
                model.addAttribute("msg","대출 실패");
            }
        } else {
            model.addAttribute("msg","대출 실패");
            model.addAttribute("subMsg","대출한도 3권을 초과하셔서 실패하였습니다.");
        }
        model.addAttribute("loc","/");
        return "common/msg";
    }