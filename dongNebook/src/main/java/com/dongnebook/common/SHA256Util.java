package com.dongnebook.common;

import java.security.MessageDigest;

import org.springframework.stereotype.Component;

@Component
public class SHA256Util {
	public String encPw(String memberPw) throws Exception{
//		SHA-256 해시알고리즘을 사용하기 위한 객체 생성
		MessageDigest mDigest = MessageDigest.getInstance("SHA-256");
//		입력한 패스워드 값을 바이트 배열로 변경하여 mDigest객체에 대입
		mDigest.update(memberPw.getBytes());
//		입력된 byte배열을 16진수로 처리하기 위해 배열로저장
		byte[] msgStr = mDigest.digest();
		StringBuilder sb = new StringBuilder();
		for(int i=0; i < msgStr.length ; ++i) {
			byte tmpStr = msgStr[i];
			String tmpTxt = Integer.toString((tmpStr & 0xff)+0x100,16).substring(1);
			sb.append(tmpTxt);
		}
		return sb.toString();
	}
}
