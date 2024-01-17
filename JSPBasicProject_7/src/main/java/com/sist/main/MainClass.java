package com.sist.main;
import java.io.*;
import java.net.*;
import java.util.Base64.Decoder;
public class MainClass {
	public static void main(String[] args) throws Exception {
		String name="홍길동";
		System.out.println(URLEncoder.encode(name,"UTF-8"));
		
		String name2=URLEncoder.encode(name,"UTF-8");
		System.out.println(URLDecoder.decode(name2,"UTF-8"));
	}
}
