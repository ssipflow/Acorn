package com.util;

import java.util.ArrayList;

public class ExportHashTag {
	
	public ExportHashTag() {
		// TODO Auto-generated constructor stub
	}

	public static ArrayList<String> exportHashTag(String str){
		ArrayList<String> hashTagList = new ArrayList<>();
		
		str = str.replaceAll("\\n", " ");
		str = str.replace(".", " ");
		str = str.replace(",", " ");
		
		String[] strArr = str.split(" ");
		for(String temp: strArr){
			if(temp.indexOf("#") == 0 && temp.indexOf("#", 1) == -1)
				hashTagList.add(temp);
		}
		
		return hashTagList;
	}
}
