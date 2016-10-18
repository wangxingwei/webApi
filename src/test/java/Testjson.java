import java.util.Iterator;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.junit.Test;


public class Testjson {

	@SuppressWarnings({ "unchecked", "static-access" })
	@Test
	public void test() {
		String str = "[{\"name\":\"张三\",\"age\":20},{\"name\":\"张三\",\"age\":20}]";
		/*String str = "<thead><tr><th>字段</th><th>说明</th></tr></thead>"
				+ "<tbody><tr><td>name</td><td>名字</td></tr>"
				+ "<tr><td>age</td><td>年龄</td></tr></tbody>";*/
		StringBuffer sb = new StringBuffer();
		sb.append("<thead><tr><th>字段</th><th>说明</th></tr></thead>");
	    JSONArray ja = new JSONArray();
	    JSONArray jsonArray = ja.fromObject(str);
	    if(jsonArray.size() == 0){
	    	sb.append("<tbody><tr><td>无</td><td>无</td></tr></tbody>");
	    }
	    sb.append("<tbody>");
	    for (int i = 0; i < jsonArray.size(); i++) {
			JSONObject jsonObject = jsonArray.getJSONObject(i);
			Iterator<String> keys = jsonObject.keys();
			
			while(keys.hasNext()) {
				//json --> key
				String stringKey = keys.next();
			    sb.append("<tr><td>"+stringKey+"</td><td>"+jsonObject.get(stringKey)+"</td></tr>");
			}
		}
	    sb.append("</tbody>");
		System.out.println(sb.toString());
	}
	@Test
	public void testJSON() {
		String str = "{ \"param\": [{\"name\": \"张三\",\"age\": 20},{\"name\": \"张三\",\"age\": 20}]}";
		net.sf.json.JSONObject jo = new net.sf.json.JSONObject();
		net.sf.json.JSONObject fromObject = jo.fromObject(str);
		boolean containsKey = fromObject.containsKey("aa");
		System.out.println(containsKey);
		JSONArray jsonArray = fromObject.getJSONArray("param");
		for (int i = 0; i < jsonArray.size(); i++) {
			System.out.println("aa");
		}
		System.out.println(jsonArray);
	}
}
