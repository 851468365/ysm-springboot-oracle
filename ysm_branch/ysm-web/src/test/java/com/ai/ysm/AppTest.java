package com.ai.ysm;

import org.apache.commons.lang.WordUtils;

import com.ai.ysm.gen.utils.GenUtils;

public class AppTest{
	public static void main(String[] args) {
		System.out.println(GenUtils.columnToJava("class_id"));
		System.out.println(GenUtils.columnToJava("CLASS_ID"));
		System.out.println(GenUtils.columnToJava("classid"));
		System.out.println(GenUtils.columnToJava("CLASSID"));
		System.out.println(WordUtils.capitalizeFully("class_id", new char[]{'_'}));
		System.out.println(WordUtils.uncapitalize("class_id", new char[]{'_'}).replace("_", ""));
		String string = "class_id";
		string = WordUtils.capitalizeFully(string, new char[]{'_'}).replace("_", "");
		string = string.substring(0, 1).toLowerCase() + string.substring(1);
		System.out.println(string);
	}

}
