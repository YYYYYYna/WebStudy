package com.sist.controller;

import java.io.*;
import java.util.*;

import javax.lang.model.element.Element;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;

@WebServlet("*.do")
public class fController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private Map clsMap=new HashMap();
	public void init(ServletConfig config) throws ServletException {
		String path="C:\\webDev\\JSPMVCProject_3\\src\\main\\webapp\\WEB-INF\\fApplication.xml";
		try {
			DocumentBuilderFactory dbf=
					DocumentBuilderFactory.newInstance();
			//파싱하는 과정
			Document doc=db.parse(new File(path));
			
			Element beans=doc.getDocumentElement();
			NodeList list=beans.getElementByTagName("bean");
			
			for(int i=0)
		}catch(Exception ex){}
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
