package com.apidoc.utils.request;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

/***
 * request 请求的工具类
 * @author wxw
 *
 */
public class RequestUtil {
	
	/**
	 * 打印变量
	 * @param request
	 * @return
	 */
	public static String printParames(HttpServletRequest request) {
		StringBuffer sb = new StringBuffer();
		Enumeration<String> keys = request.getParameterNames();
		while(keys.hasMoreElements()) {
			String key = keys.nextElement();
			sb.append(key).append(":").append(request.getParameter(key)).append(",");
		}
		return sb.toString();
	}
	
	/***
	 * 转化Map
	 * @param request
	 * @return
	 */
	@SuppressWarnings({ "rawtypes", "null" })
	public static Map<String,Object> mapCast(HttpServletRequest request){
		
		Map parameterMap = request.getParameterMap();
		if(parameterMap != null || parameterMap.size() >0){
			return getReqParams(parameterMap);			
		}
		//转化Map --> 参数错误
		return null;
	}
	
	/**
     * 从HttpServletRequest中取出Map对象 解析返回Map<String, String>
     * @param requestParams Map
     * @return
     */
    @SuppressWarnings("rawtypes")
	public static Map<String, Object> getReqParams(Map requestParams) {
        Map<String, Object> params = new HashMap<String, Object>();
        for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext(); ) {
            String name = (String) iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i]
                        : valueStr + values[i] + ",";
            }
            params.put(name, valueStr);
        }
        return params;
    }
}
