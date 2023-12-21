package drugfilter.util;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import org.apache.log4j.Logger;
import org.apache.log4j.MDC;
import com.mobios.util.LogUtil;
import java.util.logging.Logger;
import org.apache.log4j.xml.DOMConfigurator;  
import drugfilter.model.User;
import java.util.logging.Level;
@WebServlet("/test")
public class TestLog4jServlet extends HttpServlet {

//	static final Logger LOGGER = Logger.getLogger(TestLog4jServlet.class.getName());


	static String ID = ""+UUID.randomUUID().toString();
	static String logData=""+ID;
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		/* LOGGER.info("This is a logging statement from log4j"); */
		/*
		 * HttpSession session=request.getSession(); User user =
		 * (User)session.getAttribute("user"); System.out.println(user.getId() +
		 * user.getName());
		 */

		/*
		 * String username = "Kasuni"; MDC.put("username", "1");
		 * MDC.getContext().clear(); LOGGER.info("Testing");
		 * 
		 * LOGGER.debug("Debug"); LOGGER.info("kASUNI");
		 * 
		 */
		
		//LOGGER.debug("Debug"); 
	//	LOGGER.log(Level.SEVERE,"Kasuni");
		 
		/*
		 * LogUtil.getLog("Event").debug(logData+"Testing");
		 * LogUtil.getLog("Error").debug(logData+" Testing Error");
		 */
		/* LogUtil.getLog("Console").debug(logData+" Testing Error"); */
     
   /*     LogUtil.getLog("Emaillog").debug(logData+" Testing Email");*/
   LogUtil.getLog("DrugFilterlog").debug(logData+" Testing Drug Filter");
		String html = "<html><h2>Log4j has been initialized successfully!</h2></html>";
		response.getWriter().println(html);
	}

}
