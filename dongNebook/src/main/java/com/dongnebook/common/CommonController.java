package com.dongnebook.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/common")
public class CommonController {
	
	@RequestMapping("/mailSendFrm.do")
	public String mailFrm() {
		return "common/mailSend";
	}
}
