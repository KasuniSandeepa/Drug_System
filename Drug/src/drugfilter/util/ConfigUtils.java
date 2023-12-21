package drugfilter.util;
//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

import java.io.File;
import java.net.URISyntaxException;
import java.net.URL;

import Mobios.Utils;
public class ConfigUtils {
    public ConfigUtils() {
    }
    public static File getFileFromResource(String FileName) throws URISyntaxException {
        ClassLoader ClassLoader = ConfigUtils.class.getClassLoader();
        URL Resource = ClassLoader.getResource(FileName);
        if (Resource == null) {
            throw new IllegalArgumentException("file not found!");
        } else {
            return new File(Resource.toURI());
        }
    }
}
