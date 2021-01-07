package com.dongnebook.common;

import java.io.File;

//파일 중복 체크 클래스
public class FileOverlap {
	//만약 파일명이 aclass.txt인데 겹친다면
	// aclass.txt -> aclass(1).txt처럼 해야 함
	//따라서 확장자랑 파일명을 분리 (aclass / .txt)
	public String rename(String path, String filename) {
		//파일명 시작부터 마지막 . 바로 앞까지
		String fileFrontName = filename.substring(0, filename.lastIndexOf('.'));
		//마지막 .부터 끝까지
		String fileExtention = filename.substring(filename.lastIndexOf('.'));
		StringBuilder sb = new StringBuilder();
		int num = 0;	//파일명 중복 시 붙일 숫자
		while(true) {
			sb.setLength(0);
			sb.append(fileFrontName);
			//만약 중복이라면
			if(num!=0) {
				sb.append("("+num+")");
			}
			sb.append(fileExtention);
			File checkFile = new File(path+sb.toString());
			if(!checkFile.exists()) {	//exists()메소드는 해당 파일이 존재하면 true
				break;
			}
			num++;
		}
		return sb.toString();
	}
}
