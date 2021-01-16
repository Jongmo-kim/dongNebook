package com.dongnebook.common;
import java.text.Normalizer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Set;

/**
 * @author 김종모
 * 자동완성용 trie자료구조 
 */
public  class hangulTrie {
	public class trieNode{
		private char data;
		private boolean isLeaf;
		private HashMap<Character, trieNode> children;
		private trieNode parentNode;
		private HangulType type;
		public HangulType getHangulType() {
			return type;
		}
		public void setType(HangulType type) {
			this.type = type;
		}
		public trieNode(char ch) {
			this.data = ch;
			isLeaf = false;
			children = new HashMap<Character, trieNode>();
			parentNode = this;
			this.type = HangulType.Other.getHangulType(ch);
		}
		public HangulType getNextHangulTypeFromThis() {
			HangulType type;
			switch(this.type) {
			case Chosung:
				type = HangulType.Jungsung;
				break;
			case Jungsung:
				type = HangulType.Jongsung;
				break;
			case Jongsung:
				type = HangulType.Chosung;
				break;
			default:
				type = HangulType.Other;
				break;
			}
			return type;
		}
		public trieNode getParentNode() {
			return parentNode;
		}

		public void setParentNode(trieNode parentNode) {
			this.parentNode = parentNode;
		}

		public char getData() {
			return data;
		}
		public void setData(char data) {
			this.data = data;
		}
		public boolean isLeaf() {
			return isLeaf;
		}
		public void setLeaf(boolean isLeaf) {
			this.isLeaf = isLeaf;
		}
		public HashMap<Character, trieNode> getChildren() {
			return children;
		}
		public void setChildren(HashMap<Character, trieNode> children) {
			this.children = children;
		}
		public trieNode putChild(char ch) {
			trieNode temp = new trieNode(ch);
			getChildren().put(ch, temp);
			return temp;
		}
		public trieNode getChild(char ch) {
			return getChildren().get(ch);
		}
		public boolean hasChild(char ch) {
			return children.get(ch) != null;
		}
		public Collection<? extends trieNode> getAllLeaf() {
			ArrayList<trieNode> list = new ArrayList<trieNode>();
			for(trieNode currNode : getChildren().values()) {
				if(currNode.isLeaf()) {
					list.add(currNode);
				}
				list.addAll(currNode.getAllLeaf());
			}
			return list;
		}
		public String getCurrString() {
			trieNode currNode = this;
			String str ="";
			do {
				char ch = currNode.getData();
				str += Character.toString(ch);
				currNode = currNode.getParentNode();
			}while(currNode.parentNode.getData() != '#');
			
			str += Character.toString(currNode.getData());
			
			StringBuffer sb = new StringBuffer(str);
			String reverseStr = sb.reverse().toString();
			str = Normalizer.normalize(reverseStr,Normalizer.Form.NFC);
			return str;
		}
	}
	
	trieNode rootNode;
	public hangulTrie(){
		rootNode = new trieNode('#');
	}
	public void printAllChildNode() {
		HashMap<Character, trieNode> map = rootNode.children;
		Set<Character> set = map.keySet();
		for(Character ch : set) {
			System.out.print(ch);
		}
		System.out.println();
	}
	public void insert(String word) {
		trieNode currNode = rootNode;
		word = Normalizer.normalize(word, Normalizer.Form.NFD);
		
		for(char ch : word.toCharArray()) {
			if(currNode.getChild(ch) != null) {
				currNode = currNode.getChild(ch);
			} else {
			    trieNode nextNode = currNode.putChild(ch);
			    nextNode.setParentNode(currNode);
				currNode = nextNode;
			}
		}
		
		currNode.setLeaf(true);
	}
	public boolean search(String word) {
		trieNode currNode = rootNode;
		word = Normalizer.normalize(word, Normalizer.Form.NFD);
		
		for(char ch : word.toCharArray()) {
			if(currNode.getChild(ch) != null) {
				currNode = currNode.getChild(ch);
			} else {
				return false;
			}
		}
		return currNode.isLeaf();
	}
	public ArrayList<trieNode> findAllLeafs(String word){
		ArrayList<trieNode> list = new ArrayList<trieNode>();
		word = Normalizer.normalize(word, Normalizer.Form.NFD);
		trieNode currNode = rootNode;
        for(char c : word.toCharArray()) {
        	if(isCompatibilityJamo(c)) {
    			String tempStr = c + "ㅏ";
    			String nfkcStr = Normalizer.normalize(tempStr,Normalizer.Form.NFKC);
    			String nfdStr = Normalizer.normalize(nfkcStr, Normalizer.Form.NFD);
    			c = nfdStr.charAt(0);
    		}
        	
            if(currNode.getChild(c)!=null) {
                currNode = currNode.getChild(c);
            }
            else {
            	list.clear();
                return list;
            }
        }
        if(currNode.isLeaf()) {
            list.add(currNode);
        }
        list.addAll(currNode.getAllLeaf());
		return list;
	}
	public ArrayList<trieNode> findAllLeafsInclude(String word){
		return findAllLeafsInclude(word, rootNode);
	}
	private ArrayList<trieNode> findAllLeafsInclude(String word, trieNode currNode) {
		ArrayList<trieNode> list = new ArrayList<trieNode>();
		word = Normalizer.normalize(word, Normalizer.Form.NFD);
        Set<Character> charset = currNode.getChildren().keySet();
        for(char currCh : charset) {
        	if(word.length() == 0) {
        		list.addAll(currNode.getAllLeaf());
        		break;
        	}
        	if(word.charAt(0) == currCh) {
        		list.addAll(findAllLeafsInclude(word.substring(1),currNode.getChild(currCh)));
        	}else {
        		list.addAll(findAllLeafsInclude(word, currNode.getChild(currCh)));
        	}
        }
        return list;
		
	}
	public ArrayList<trieNode> findAllLeafsByChosung(String word){
		/*
		 * 초성검색 로직 
		 * Type 이 Chosung일때만 검색 로직을 수행하고
		 * 만약 끝값이 온다면 그대로 갖고있는 노드를 받고
		 * 그 노드들을 리턴한다.
		 * 검색로직
		 * 첫번째 초성의 모든 자손들중에 초성이 나올떄까지 다음 로직을 대기한다.
		 * 초성이 나온다면 그 초성이 2번째 초성과 같으면 계속 자손들을 찾고 아니면 그 자손은 찾지않는다.
		 * n번쨰 초성이 나온다면 n번째 배열의 초성과 같은지 확인하고 계속 내려간다.
		 * leaf인 노드가 나오면 해당노드에선 그만찾고 해당노드를 리턴하여 그 노드를 리스트에 넣는다
		 */
		ArrayList<trieNode> list = new ArrayList<trieNode>();
		word = Normalizer.normalize(word, Normalizer.Form.NFD);
		char[] chosungArray = word.toCharArray();
        list.addAll(getAllLeafsUntilNextChosung(rootNode,chosungArray,0));
		return list;
	}
//	private ArrayList<trieNode> getAllLeafsUntilNextChosung(trieNode node,char[] chosungArray,int index){
//		/*
//		 * 검색로직
//		 * 
//		 */
//		ArrayList<trieNode> list = new ArrayList<trieNode>();
//		Object[] keyList = node.getChildren().keySet().toArray();
//		
//		char ch = chosungArray[index];
//		boolean isNodeTypeChosung = node.getHangulType() == HangulType.Chosung;
//		
//		for(Object o : keyList) {
//			if(!node.hasChild((char)o)) {
//				continue;
//			}
//			trieNode currNode = node.getChild((char)o);
//			
//			if(index+1 == chosungArray.length && chosungArray.length == node.getCurrString().length() ) {
//				if(currNode.isLeaf()) {
//					if(isEqualChosung(node.getData(), chosungArray[index])) {
//						list.add(currNode);
//						continue;
//					}
//				}
//			}
//			if(isNodeTypeChosung) {
//				if(isEqualChosung(node.getData(), ch)) {
//					if(index+1 < chosungArray.length){
//						list.addAll( getAllLeafsUntilNextChosung( currNode, chosungArray,index+1));
//					} else {
//						list.addAll( currNode.getAllLeaf());
//					}
//				} else {
//					continue;
//				}
//			} else {
//				list.addAll( getAllLeafsUntilNextChosung( currNode, chosungArray,index));
//			}
//		}
//		
//		return list;
//	}
	private ArrayList<trieNode> getAllLeafsUntilNextChosung(trieNode node,char[] chosungArray,int index){
		/*
		 * 검색로직
		 * 
		 */
		ArrayList<trieNode> list = new ArrayList<trieNode>();
		Object[] keyList = node.getChildren().keySet().toArray();
		
		char ch = chosungArray[index];
		boolean isNodeTypeChosung = node.getHangulType() == HangulType.Chosung;
		
		for(Object o : keyList) {
			if(!node.hasChild((Character)o)) {
				continue;
			}
			trieNode currNode = node.getChild((Character)o);
			if(index+1 == chosungArray.length && chosungArray.length == node.getCurrString().length() ) {
				if(currNode.isLeaf()) {
					if(isEqualChosung(node.getData(), chosungArray[index])) {
						list.add(currNode);
						continue;
					}
				}
			}
			if(isNodeTypeChosung) {
				if(isEqualChosung(node.getData(), ch)) {
					if(index+1 < chosungArray.length){
						list.addAll( getAllLeafsUntilNextChosung( currNode, chosungArray,index+1));
					} else {
						list.addAll( currNode.getAllLeaf());
					}
				} else {
					continue;
				}
			} else {
				list.addAll(getAllLeafsUntilNextChosung( currNode, chosungArray,index));
			}
		}
		return list;
	}
	
	private boolean isEqualChosung(char data, char ch) {
		ch = HangulType.Other.setCompatibilityToChosung(ch);
		return data == ch;
	}
	private boolean isCompatibilityJamo(char ch) {
		return 0x3130<=ch && ch <=0x318f;
	}
	public static void printAllChildNode(trieNode node) {
		HashMap<Character, trieNode> map = node.getChildren();
		Set<Character> set = map.keySet();
		System.out.println("currNode :" + node.getData());
		System.out.println(String.format("U+%04X ", (int)node.getData()));
		for(Character ch : set) {
			System.out.print(ch);
		}
		System.out.println();
	}
}
