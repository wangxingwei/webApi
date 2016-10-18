

import java.util.Iterator;
import java.util.List;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

public class Bean {
	private String name;
    private String nameParam;
    private String age;
    private String ageParam;
    
    
    public String getName() {
		return name;
	}
	public String getNameParam() {
		return nameParam;
	}
	public String getAge() {
		return age;
	}
	public String getAgeParam() {
		return ageParam;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setNameParam(String nameParam) {
		this.nameParam = nameParam;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public void setAgeParam(String ageParam) {
		this.ageParam = ageParam;
	}
	@SuppressWarnings("rawtypes")
	public Bean(String xml){
	    //这里是构造方法，通过xml转换成bean
	    //获取Document 对象
	    Document document = null;
		try {
			document = DocumentHelper.parseText(xml);
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    //获取根节点（就是student节点）
	    Element el = document.getRootElement();
	    String name2 = el.getName();
	    System.out.println("项目="+name2);
	    List list = el.elements("interfaces");
	    for (Iterator it = list.iterator(); it.hasNext();) {    
	        Element elm = (Element) it.next();
	        Element element = elm.element("name");
	        String text = element.getText();
	        System.out.println(text);
	    }
	    //获取根节点下的节点：
	    Element name = el.element("name");
	    this.name = name.getText();
	    this.nameParam = name.attributeValue("nameP");
	    Element age= el.element("age");
	    this.age = age.getText();
	    this.ageParam = age.attributeValue("ageP");    
    }
    public String toXML(){
	    //这里是bean转换成xml的方法
		// 获取Document对象
	    Document doc = DocumentHelper.createDocument();
	    // 创建根节点：
	    Element rootEle = doc.addElement("Student");
	    // 创建子节点：
	    Element name = rootEle.addElement("name");
	    name.addAttribute("nameP", this.nameParam);
	    name.setText(this.name);
	    Element age = rootEle.addElement("age");
	    age.addAttribute("ageP", this.ageParam);
	    age.setText(this.age);
	    return doc.asXML();
    }

}
