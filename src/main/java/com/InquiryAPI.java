package com;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Inquiry;

//for map
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

	/**
	 * Servlet implementation for InquiryAPI class
	 */

		@WebServlet("/InquiryAPI")
		public class InquiryAPI extends HttpServlet {
			private static final long serialVersionUID = 1L;
			
			Inquiry inqobj = new Inquiry();
	
	
       
			
    /**
     * @see HttpServlet#HttpServlet()
     */
	
	    public InquiryAPI() {
	        super();
	        // TODO Auto-generated constructor stub
	    }
	    
	    

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	    
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			response.getWriter().append("Served at: ").append(request.getContextPath());
		}
		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
		
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			
			String output = inqobj.insertInquiry(
					request.getParameter("combox"),
					request.getParameter("comDate"),
					request.getParameter("Userid"));
	
			response.getWriter().write(output);
		}

		
		
	/**
	 * @see HttpServlet#doPut(HttpServletRequest, HttpServletResponse)
	 */
		
		protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			
			Map paras = getParasMap(request); 
			String output = inqobj.updateInquiry( 
					paras.get("combox").toString(), 
					paras.get("comDate").toString(),
					paras.get("Userid").toString(),
					paras.get("hidcomIDSave").toString()); 
			
			response.getWriter().write(output);
		}
		
		

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
		
		protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			
			Map paras = getParasMap(request);
			String output = inqobj.deleteInquiry(paras.get("comId").toString());
			
			response.getWriter().write(output); 
			
		}
	
		
		// Converting request paras to a map
		
		private static Map getParasMap(HttpServletRequest request) 
		{ 
		 Map<String, String> map = new HashMap<String, String>(); 
		try
		 { 
		 Scanner scanner = new Scanner(request.getInputStream(), "UTF-8"); 
		 String queryString = scanner.hasNext() ? 
		 scanner.useDelimiter("\\A").next() : ""; 
		 scanner.close(); 
		 String[] params = queryString.split("&"); 
		 for (String param : params) 
		 { 
		
		 String[] p = param.split("="); 
		 map.put(p[0], p[1]); 
		 } 
		 } 
		catch (Exception e) 
		 { 
		 } 
		return map; 
		}

}
