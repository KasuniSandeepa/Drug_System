package drugfilter.util;
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

import java.io.File;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;


public class Config {
    public Config() {
    }
    public static String Read(String Key) {
        String Value = "";
        try {
            File ConfigFile = ConfigUtils.getFileFromResource("app.xml");
            DocumentBuilderFactory DBFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder Builder = DBFactory.newDocumentBuilder();
            Document Doc = Builder.parse(ConfigFile);
            Doc.getDocumentElement().normalize();
            NodeList Nodes = Doc.getElementsByTagName("add");
            for(int Counter = 0; Counter < Nodes.getLength(); ++Counter) {
                Element Elements = (Element)Nodes.item(Counter);
                if (Key.equals(Elements.getAttribute("key"))) {
                    Value = Elements.getAttribute("value");
                }
                if (Key.equals(Elements.getAttribute("name"))) {
                    Value = Elements.getAttribute("connectionString");
                }
            }
        } catch (Exception var9) {
            var9.printStackTrace();
        }
        return Value;
    }
}