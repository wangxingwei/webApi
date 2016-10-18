package com.apidoc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.apidoc.content.ApiContent;
import com.apidoc.utils.operationXML.ReadXML;
import com.apidoc.utils.request.RequestUtil;

/***
 * apiDoc 登录接口
 * @author wxw
 * LOG 打印方式：入参-->,出参：<--
 */
@Controller
@RequestMapping("/login")
public class LoginController {
	
	private static final Logger LOG = Logger.getLogger(LoginController.class);
	
	/**
	 * 登录接口
	 * 解析XML 封装成 
	 * <pre>
	 *  <ul>
  	 *	  <li><a>project</a>//项目名
     *		<ul>    //href 跳转的地址      id: 区分那个接口
     * 			<li><a href='/apidoc/page/detail.html?id=1'>接口1</a></li>//测试接口,简述
     * 			<li><a href='/apidoc/page/detail.html?id=2'>接口2</a></li>
     *		</ul>
  	 *	  </li>
  	 *	  <li><a>project2</a>
     *		<ul>
     *  			<li><a href='/apidoc/page/detail.html?id=3'>接口3</a></li>
     * 			<li><a href='/apidoc/page/detail.html?id=4'>接口4</a></li>
     *		</ul>
  	 *	  </li>
	 *  </ul>
	 * </pre>
	 * @return
	 */
	@RequestMapping(value = "/login.do", produces = "text/plain;charset=UTF-8")
	public String login(HttpServletRequest request, HttpSession session) {
		try {
			LOG.info("login-->"+RequestUtil.printParames(request));
			
			String readStr = ReadXML.read("F:/tomcat-7.0.59-blank/webapps/ApiDoc/WEB-INF/classes/", "api_", ".xml",session);
			session.setAttribute(ApiContent.SESSION_LISTKEY, readStr);
			return "index";
		} catch (Exception e) {
			e.printStackTrace();
			return "index";
		}
	}
}
