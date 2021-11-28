package stock;

import java.sql.*;
import java.util.List;

public class StockCsvDao {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;
    public StockCsvDao() {
        try{
            String dbURL = "jdbc:mysql://localhost:3306/STOCKIT";
            String dbID = "root";
            String dbPassword = "0000";
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public void insertNasdaqStock(List<List<String>> csvData)
    {
        int count = 0;
        String SQL = "insert into STOCK (Symbol, Market, Name, LastSale, " +
                "MarketCap, Country, Volume) " +
                "values(?, ?, ?, ?, ?, ?, ?)";
        try{
            for(List<String> data : csvData) {
                pstmt = conn.prepareStatement(SQL);
                pstmt.setString(2, "Nasdaq");
                pstmt.setString(1, data.get(0));
                pstmt.setString(3, data.get(1));
                pstmt.setString(4, isNull(data.get(2)));
                pstmt.setString(5, isNull(data.get(5)));
                pstmt.setString(6, data.get(6));
                pstmt.setString(7, isNull(data.get(8)));
                int ret = pstmt.executeUpdate();
                count += ret;
            }
            System.out.println(count + " rows inserted");
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public void insertKsStock(List<List<String>> csvData)
    {
        int count = 0;
        String SQL = "insert into STOCK (Symbol, Market, Name, LastSale, " +
                "MarketCap, Country, Volume) " +
                "values(?, ?, ?, ?, ?, ?, ?)";
        try {
            for (List<String> data : csvData) {
                pstmt = conn.prepareStatement(SQL);
                pstmt.setString(2, "KS");
                pstmt.setString(1, data.get(0).replaceAll("^\"|\"$", "") + ".KS");
                pstmt.setString(3, data.get(1).replaceAll("^\"|\"$", ""));
                pstmt.setString(4, isNull(data.get(2)).replaceAll("^\"|\"$", ""));
                pstmt.setString(5, isNull(data.get(10)).replaceAll("^\"|\"$", ""));
                pstmt.setString(6, "Korea");
                pstmt.setString(7, isNull(data.get(8)).replaceAll("^\"|\"$", ""));
                int ret = pstmt.executeUpdate();
                count += ret;
            }
            System.out.println(count + " rows inserted");
        } catch (Exception throwables) {
            throwables.printStackTrace();
        }
    }

    private String isNull(String str) {
        if (str == null || str.isEmpty()) {
            return null;
        }
        return str;
    }
}
