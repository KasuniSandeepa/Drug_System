package drugfilter.util;

import org.apache.log4j.Logger;
import java.sql.*;
import java.io.*;
import java.util.*;

public class log4jExample {

	/* Get actual class name to be printed on */
	   static Logger log = Logger.getLogger(log4jExample.class.getName());
	   
	   public static void main(String[] args)throws IOException,SQLException{
	      log.debug("Debug");
	      log.info("Info");
	   }
}