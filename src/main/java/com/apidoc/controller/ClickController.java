package com.apidoc.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;

/***
 * apiDoc 登录接口
 * 
 * @author wxw LOG 打印方式：入参-->,出参：<--
 */
@Controller
@RequestMapping("/page")
public class ClickController {

	private static final Logger LOG = Logger.getLogger(ClickController.class);

	/**
	 * 登录接口 解析XML 封装成
	 * 
	 * <pre>
	 *  <ul>
	 *   <li><a>project</a>//项目名
	 * 	<ul>    //href 跳转的地址      id: 区分那个接口
	 * 			<li><a href='/apidoc/page/detail.html?id=1'>接口1</a></li>//测试接口,简述
	 * 			<li><a href='/apidoc/page/detail.html?id=2'>接口2</a></li>
	 * 	</ul>
	 *   </li>
	 *   <li><a>project2</a>
	 * 	<ul>
	 *  			<li><a href='/apidoc/page/detail.html?id=3'>接口3</a></li>
	 * 			<li><a href='/apidoc/page/detail.html?id=4'>接口4</a></li>
	 * 	</ul>
	 *   </li>
	 *  </ul>
	 * </pre>
	 * 
	 * @return
	 */
	@SuppressWarnings("all")
	@RequestMapping(value = "/getPersonList.do", produces = "text/plain;charset=UTF-8")
	public String getPersionList(ModelMap modelMap, String id,
			HttpSession session, HttpServletRequest request) {
		// 清除sessionh缓存
		session.removeAttribute("msg");

		if (request.getMethod().equals("POST")) {
			System.out.println("-----------POST------------");
			Map<String, Object> map = new HashMap<String, Object>();
			try {
				request.setCharacterEncoding("utf-8");

				int contentLength = request.getContentLength();
				if (contentLength < 0) {
					return null;
				}
				byte buffer[] = new byte[contentLength];
				for (int i = 0; i < contentLength;) {

					int readlen = request.getInputStream().read(buffer, i,
							contentLength - i);
					if (readlen == -1) {
						break;
					}
					i += readlen;
				}

				String charEncoding = request.getCharacterEncoding();
				if (charEncoding == null) {
					charEncoding = "UTF-8";
				}
				String result = new String(buffer, charEncoding);

				System.out.println(result);

				map.put("code", "0");
				map.put("msg", "成功!");

				if (null == map) {
					return "welcome";
				} else {
					session.setAttribute("msg", new Gson().toJson(map));
					return "index3";
				}
			} catch (Exception e) {
				e.printStackTrace();

				map.put("code", "1");
				map.put("msg", "失败!");
				return new Gson().toJson(map);
			}
		} else {

			try {
				LOG.info("----> id = " + id);
				if ("".equals(id) || null == id) {
					return "welcome";
				}
				@SuppressWarnings("unchecked")
				Map<String, String> map = (Map<String, String>) session
						.getAttribute("strMap");
				if (map.size() == 0) {
					return "welcome2";
				}

				String idText = map.get(id);
				JSONObject jo = new JSONObject();
				@SuppressWarnings("static-access")
				JSONObject object = jo.fromObject(idText);

				modelMap.addAttribute("url", object.get("url"));
				modelMap.addAttribute("urlexplain", object.get("urlexplain"));
				modelMap.addAttribute("reqs", object.get("req"));
				modelMap.addAttribute("reqexplain", object.get("reqexplain"));
				modelMap.addAttribute("params", object.get("param"));
				modelMap.addAttribute("paramexplain",
						object.get("paramexplain"));
				String strObject = (String) object.get("paramstate");
				JSONArray paramArray = null;
				if (strObject.trim().startsWith("{")) {
					JSONObject Strjo = new JSONObject().fromObject(object
							.get("paramstate"));
					JSONObject Strjo2 = (JSONObject) Strjo.get("para");
					Iterator keys = Strjo2.keys();
					while (keys.hasNext()) {
						String next = (String) keys.next();
						String strobj = (String) Strjo2.get(next);
						if (strobj.trim().startsWith("[")) {
							paramArray = paramArray.fromObject(strobj);
							String paramJson = exectJson(paramArray);
							System.out.println(paramJson);
							modelMap.addAttribute("paramstate", paramJson);
						}
						modelMap.addAttribute("paramstate", strobj);
					}

				} else if (strObject.trim().startsWith("[")) {
					paramArray = new JSONArray().fromObject(object
							.get("paramstate"));
					String paramJson = exectJson(paramArray);
					System.out.println(paramJson);
					modelMap.addAttribute("paramstate", paramJson);
				}

				modelMap.addAttribute("paramstateexplain",
						object.get("paramstateexplain"));
				JSONArray codeArray = (JSONArray) object.get("code");
				String codeJson = exectJson(codeArray);
				modelMap.addAttribute("code", codeJson);
				modelMap.addAttribute("codeexplain", object.get("codeexplain"));
				System.out.println(object);
				return "index3";
			} catch (Exception e) {
				e.printStackTrace();
				return "/power/index";
			}
		}
	}

	@SuppressWarnings("unchecked")
	private String exectJson(JSONArray jsonArray) {
		// 拼装
		StringBuffer sb = new StringBuffer();
		sb.append("<thead><tr><th>字段</th><th>说明</th></tr></thead>");
		if (jsonArray.size() == 0) {
			sb.append("<tbody><tr><td>无</td><td>无</td></tr></tbody>");
		}
		sb.append("<tbody>");
		for (int i = 0; i < jsonArray.size(); i++) {
			JSONObject jsonObject = jsonArray.getJSONObject(i);
			Iterator<String> keys = jsonObject.keys();
			while (keys.hasNext()) {
				// json --> key
				String stringKey = keys.next();
				sb.append("<tr><td>" + stringKey + "</td><td>"
						+ jsonObject.get(stringKey) + "</td></tr>");
			}
		}
		sb.append("</tbody>");
		return sb.toString();
	}
}
