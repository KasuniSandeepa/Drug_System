package drugfilter.db;

import java.sql.*;
import java.util.Date;
import java.util.UUID;
import drugfilter.util.Config;
import com.mobios.util.LogUtil;
import drugfilter.util.CommonUtill;
import com.mysql.cj.jdbc.exceptions.CommunicationsException;


public class DBConnection {

    private Statement statement;
    private static DBConnection instance;
    private Connection connection;

  //  private String url = "jdbc:mysql://localhost:3306/";
    private String url = Config.Read("DatabaseUrl");
 //   private String dbName = "drug_db?autoReconnect=true&useSSL=false";
    private String dbName = "drug_db?useSSL=false&allowPublicKeyRetrieval=true";
  //  private String driver = "com.mysql.cj.jdbc.Driver";
    private String driver = Config.Read("DriverName");
    private String userName = Config.Read("DatabasUserName");
    //private String password = Config.Read("DatabasePassword");
    private String password = Config.Read("LocalDatabasePassword");
  

    String now = new Date().toString();
	String softVersion = "V1.0";
	String platformID = "EVI-ETI";
	String uuid = CommonUtill.EMPTY_STRING + UUID.randomUUID();
	String logData = CommonUtill.EMPTY_STRING + now + "," + softVersion + "," + platformID + "," + uuid;
  

    @SuppressWarnings("deprecation")
	private DBConnection() throws SQLException {
        try {
            Class.forName(driver).newInstance();
            this.connection = DriverManager.getConnection(url + dbName, userName, password);
            
            LogUtil.getLog("Event").debug(logData + ",DatabaseConnection.getConnection,user="+userName+",con="+connection+",");
            LogUtil.getLog("Connectionlog").debug(logData + ",DatabaseConnection.getConnection,user="+userName+",con="+connection+",");
            
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException ex) {
            System.out.println("Database Connection Creation Failed : " + ex.getMessage());
            LogUtil.getLog("Event").debug(logData + ",ERROR,DatabaseConnection.getConnection,user="+userName+",con="+connection+",exception="+ex);
            LogUtil.getLog("Event").debug(logData + ",ERROR,DatabaseConnection.getConnection,user="+userName+",con="+connection+",exception="+ex);
        }
    }

    public Connection getConnection() {
        return connection;
    }

    public static synchronized DBConnection getInstance() throws SQLException {
        if (instance == null) {
            instance = new DBConnection();
        } else if (instance.getConnection().isClosed()) {
            instance = new DBConnection();
        }
        return instance;
    }


    /**
     * @param query String The query to be executed
     * @return a ResultSet object containing the results or null if not available
     * @throws SQLException Exception
     */
    public ResultSet query(String query) throws SQLException {
        statement = DBConnection.getInstance().connection.createStatement();
        try {
            return statement.executeQuery(query);
        } catch (Exception e) {
            DBConnection.getInstance();
            return statement.executeQuery(query);
        }

    }

    /**
     * @param insertQuery String The Insert query
     * @return boolean
     * @throws SQLException Exception
     */
    public int insert(String insertQuery) throws SQLException {
        statement = DBConnection.getInstance().connection.createStatement();
        try {
            return statement.executeUpdate(insertQuery);
        } catch (Exception e) {
            DBConnection.getInstance();
            return statement.executeUpdate(insertQuery);
        }
    }

    public int update(String sql) throws SQLException {
        PreparedStatement preparedStmt = DBConnection.getInstance().connection.prepareStatement(sql);
        try {
            return preparedStmt.executeUpdate();
        } catch (Exception e) {
            DBConnection.getInstance();
            return preparedStmt.executeUpdate();
        }
    }
    
    public int delete(String insertQuery) throws SQLException {
        statement = DBConnection.getInstance().connection.createStatement();
        try {
            return statement.executeUpdate(insertQuery);
        } catch (Exception e) {
            DBConnection.getInstance();
            return statement.executeUpdate(insertQuery);
        }
    }


}