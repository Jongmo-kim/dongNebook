package com.dongnebook.common;

import java.text.Normalizer;

/**
 * @author 김종모
 * 자동완성용 enum class 
 */
public enum HangulType {
		Chosung{ 
			public boolean isJamo(int ch) {return 0x1100<=ch  && ch<= 0x1112;}
		},
		Jungsung{ 
			public boolean isJamo(int ch) {return 0x1160<=ch  && ch<= 0x1175;}
		},
		Jongsung{ 
			public boolean isJamo(int ch) {return 0x11A8<=ch  && ch<= 0x11C2;}
		},
		Other{
			public boolean isJamo(int ch) {return (0x1100 <= ch && ch <= 0x11C2 ) && (0x3130 <= ch && ch<=0x318F);}
		};
		public abstract  boolean isJamo(int ch);
		public char setCompatibilityToChosung(char ch) {
			String tempStr = ch + "ㅏ";
			String nfkcStr = Normalizer.normalize(tempStr,Normalizer.Form.NFKC);
			String nfdStr = Normalizer.normalize(nfkcStr, Normalizer.Form.NFD);
			ch = nfdStr.charAt(0);
			return ch;
		}
		public boolean isCompatibilityJamo(char ch) {
			return 0x3130 < ch && ch < 0x318F;
		}
		public HangulType getHangulType(char ch) {
			if(isCompatibilityJamo(ch)) {
				ch = setCompatibilityToChosung(ch);
			}
			
			if(HangulType.Chosung.isJamo(ch)) {
				return HangulType.Chosung;
			} else if(HangulType.Jungsung.isJamo(ch)) {
				return HangulType.Jungsung;
			} else if(HangulType.Jongsung.isJamo(ch)) {
				return HangulType.Jongsung;
			} else {
				return HangulType.Other;
			}
		}
		
}
