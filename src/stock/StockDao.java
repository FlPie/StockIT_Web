package stock;

import com.sun.corba.se.spi.monitoring.StatisticMonitoredAttribute;
import news.NewsBean;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StockDao {
    private Connection conn;
    private Statement stmt;
    private PreparedStatement pstmt;
    private ResultSet rs;
    public StockDao() {
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

    public List<StockBean> getTopMarketCap(String market, int limit) {
        List<StockBean> list = new ArrayList<>();
        try {
            String sql = "select * from stock where Market='" + market + "' order by MarketCap desc limit " + limit;
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            while (rs.next()) {
                StockBean b = new StockBean();
                b.setSymbol(rs.getString("Symbol"));
                b.setMarket(rs.getString("Market"));
                b.setName(rs.getString("Name"));
                b.setLastSale(rs.getFloat("LastSale"));
                b.setMarketCap(rs.getFloat("MarketCap"));
                b.setCountry(rs.getString("Country"));
                b.setVolume(rs.getFloat("Volume"));
                list.add(b);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<StockBean> getTopVolumeCap(String market, int limit) {
        List<StockBean> list = new ArrayList<>();
        try {
            String sql = "select * from stock where Market='" + market + "' order by Volume desc limit " + limit;
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            while (rs.next()) {
                StockBean b = new StockBean();
                b.setSymbol(rs.getString("Symbol"));
                b.setMarket(rs.getString("Market"));
                b.setName(rs.getString("Name"));
                b.setLastSale(rs.getFloat("LastSale"));
                b.setMarketCap(rs.getFloat("MarketCap"));
                b.setCountry(rs.getString("Country"));
                b.setVolume(rs.getFloat("Volume"));
                list.add(b);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
