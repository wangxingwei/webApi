package com.apidoc.utils.operationXML;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

/**
 * 读 XML
 * 
 * @author wxw
 */
public class ReadXML {
	private static final Logger LOG = Logger.getLogger(ReadXML.class);

	/**
	 * 读取XML 并过滤自己想要的文件
	 * 
	 * @param url
	 * @param startWith
	 * @param endsWith
	 * @return
	 */
	public static String read(String url, String startWith, String endsWith,HttpSession session) {
		// 文件地址
		File root = new File(url);
		File[] file = root.listFiles();
		List<String> strName = new ArrayList<String>();
		for (File f : file) {
			String interFileName = f.getName(); // 获取文件名
			System.out.println(interFileName);
			boolean startsWith = interFileName.startsWith(startWith);
			boolean endWith = interFileName.endsWith(endsWith);
			if (startsWith && endWith) {
				strName.add(interFileName);
			}
		}
		return readListFile(url, strName,session);
	}

	/**
	 * 解析List文件
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
	 * @param strName
	 */
	@SuppressWarnings("rawtypes")
	private static String readListFile(String urlFile, List<String> strName,HttpSession session) {
		StringBuffer sb = new StringBuffer();
		Map<String, String> strMap = new HashMap<String, String>();
		JSONObject jo = new JSONObject();
		sb.append("<ul>");
		for (String str : strName) {
			LOG.info("ReadFile-->" + str);
			SAXReader reader = new SAXReader();
			File Strfile = new File(urlFile + str);
			Document document = null;
			try {
				document = reader.read(Strfile);
			} catch (DocumentException e) {
				LOG.info("-->" + e.getMessage());
				e.printStackTrace();
			}
			Element el = document.getRootElement();
			String proName = el.getName();
			List list = el.elements("interfaces");
			sb.append("<li>");
			sb.append("<a>");
			sb.append(proName);
			sb.append("</a>");
			sb.append("<ul>");
			for (Iterator it = list.iterator(); it.hasNext();) {
				Element elm = (Element) it.next();
				String id = elm.attributeValue("id");
				int i = Integer.parseInt(id);
				Element stateName = elm.element("state");
				String state = stateName.getText();
				Element urlName = elm.element("url");
				String url = urlName.getText();
				String urlexplain = urlName.attributeValue("url_explain");

				sb.append("<li>");
				sb.append("<a href='/ApiDoc/page/getPersonList.do?id=" + i + "'>");
				sb.append(state);
				sb.append("</a>");
				sb.append("</li>");

				Element reqName = elm.element("req");
				String req = reqName.getText();
				String reqexplain = reqName.attributeValue("req_explain");

				Element paramName = elm.element("param");
				String param = paramName.getText();
				String paramexplain = paramName.attributeValue("param_explain");

				Element paramstateName = elm.element("paramstate");
				String paramstate = paramstateName.getText();
				String paramstateexplain = paramstateName
						.attributeValue("paramstate_explain");

				Element codeName = elm.element("code");
				String code = codeName.getText();
				String codeexplain = codeName.attributeValue("code_explain");
				jo.put("url", url);
				jo.put("urlexplain", urlexplain);
				jo.put("req", req);
				jo.put("reqexplain", reqexplain);
				jo.put("param", param);
				jo.put("paramexplain", paramexplain);
				jo.put("paramstate", paramstate);
				jo.put("paramstateexplain", paramstateexplain);
				jo.put("code", code);
				jo.put("codeexplain", codeexplain);
				strMap.put(id, jo.toString());
				
				session.setAttribute("strMap", strMap);
			}
			sb.append("</ul>");
			sb.append("</li>");
		}

		sb.append("</ul>");
		return sb.toString();
	}
}
