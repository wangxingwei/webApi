

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.junit.Test;

public class TestXml {

	/*
	 * @Test public void test() { //String xml =
	 * "<Student><name nameP=\"这是name的属性\">张三</name><age ageP=\"这是年龄的属性\">12</age></Student>"
	 * ; String xml =
	 * "<Api-interfaces><interfaces><name nameP=\"这是name的属性\">张三</name><age ageP=\"这是年龄的属性\">12</age></interfaces></Api-interfaces>"
	 * ; Bean b = new Bean(xml);
	 * System.out.println("name:\t"+b.getName()+"\tnamePra:\t"
	 * +b.getNameParam());
	 * System.out.println("age:\t"+b.getAge()+"\tagePra:\t"+b.getAgeParam());
	 * System.out.println("再生成xml："); System.out.println(b.toXML()); }
	 */
	@SuppressWarnings("rawtypes")
	@Test
	public void test() {

		// 文件地址
		File root = new File("src/main/resources/");
		File[] file = root.listFiles();
		List<String> strName = new ArrayList<String>();
		for (File f : file) {
			String interFileName = f.getName(); // 获取文件名
			System.out.println(interFileName);
			boolean startsWith = interFileName.startsWith("api_");
			boolean endWith = interFileName.endsWith(".xml");
			if (startsWith && endWith) {
				strName.add(interFileName);
			}
		}

		for (String str : strName) {
			System.out.println("-->" + str);
			SAXReader reader = new SAXReader();
			File Strfile = new File("src/main/resources/"+str);
			Document document = null;
			
			
			try {
				document = reader.read(Strfile);
			} catch (DocumentException e) {
				System.out.println("-->" + e.getMessage());
				e.printStackTrace();
			}
			Element el = document.getRootElement();
			String name2 = el.getName();
			System.out.println("项目名="+name2);
			List list = el.elements("interfaces");
			for (Iterator it = list.iterator(); it.hasNext();) {
				Element elm = (Element) it.next();
				Element urlName = elm.element("url");
			    String url = urlName.getText();
			    String urlexplain = urlName.attributeValue("url_explain");
				System.out.println(urlexplain+"="+url);
				
				Element reqName = elm.element("req");
			    String req = reqName.getText();
			    String reqexplain = reqName.attributeValue("req_explain");
				System.out.println(reqexplain+"="+req);
				
				Element paramName = elm.element("param");
			    String param = paramName.getText();
			    String paramexplain = paramName.attributeValue("param_explain");
				System.out.println(paramexplain+"="+param);
				
				Element resultName = elm.element("result");
			    String result = resultName.getText();
			    String resultexplain = resultName.attributeValue("result_explain");
				System.out.println(resultexplain+"="+result);
				
				Element nameName = elm.element("name");
			    String name = nameName.getText();
			    String nameexplain = nameName.attributeValue("name_explain");
				System.out.println(nameexplain+"="+name);
				
				Element ageName = elm.element("age");
			    String age = ageName.getText();
			    String ageexplain = ageName.attributeValue("age_explain");
				System.out.println(ageexplain+"="+age);
				
				Element codeName = elm.element("code");
			    String code = codeName.getText();
			    String codeexplain = codeName.attributeValue("code_explain");
				System.out.println(codeexplain+"="+code);
				
				
			}
		}
	}
	
	@Test
	public void test2() {
		File f = new File("resource/api_test.xml"); 
		SAXReader reader = new SAXReader(); 
		try {
			Document doc = reader.read(f);
			System.out.println(doc);
		} catch (DocumentException e) {
			e.printStackTrace();
		}
		
	}
}
