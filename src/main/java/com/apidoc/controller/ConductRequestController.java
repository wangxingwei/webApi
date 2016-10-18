package com.apidoc.controller;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;


@Controller
@RequestMapping("/conduct")
public class ConductRequestController {
	
	
	
	@RequestMapping(value = "/conductRequest.do", produces = "text/plain;charset=UTF-8")
	public String getPersionList(HttpServletRequest request) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			
			StringBuffer strbuffer = null;
			InputStream is = request.getInputStream();
			InputStreamReader isr = new InputStreamReader(is,"UTF-8");
			BufferedReader br = new BufferedReader(isr);
			String s = "";
			strbuffer = new StringBuffer();
			while ((s = br.readLine()) != null) {
				strbuffer.append(s);
			}
			
			System.out.println("strbuffer--->" + strbuffer.toString());
			
			map.put("code", "0");
			map.put("msg", "成功!");
			
			return new Gson().toJson(map);
			
		} catch (Exception e) {
			e.printStackTrace();
			
			map.put("code", "1");
			map.put("msg", "失败!");
			return new Gson().toJson(map);
		}
	}

}
