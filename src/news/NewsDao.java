package news;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class NewsDao {
    private final String driver = "com.mysql.jdbc.Driver";
    private final String dbUrl = "jdbc:mysql://localhost:3306/stockit?serverTimezone=UTC";
    private final String user = "root";
    private final String pw = "0000";
    public NewsDao() {
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public List<NewsBean> getNews() { // 모든 뉴스 받아오기
        List<NewsBean> list = new ArrayList<NewsBean>();
        String sql;

        try {

            Connection conn = DriverManager.getConnection(dbUrl, user, pw);
            Statement stmt = conn.createStatement();

            sql = "select * from news";
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                NewsBean b = new NewsBean();
                b.setId(rs.getInt("newsId"));
                b.setLink(rs.getString("link"));
                b.setTitle(rs.getString("title"));
                b.setImgPath(rs.getString("imgPath"));
                list.add(b);
            }
        } catch (Exception e) {
            System.out.println("DB Error : " + e.getMessage());
        }

        return list;
    }

    public void insertNews(NewsBean b) {
        try {
            String sql = String.format("insert into news (link, title, imgPath) values('%s', '%s', '%s')",
                    b.getLink(), b.getTitle(), b.getImgPath());
            Connection conn = DriverManager.getConnection(dbUrl, user, pw);
            Statement stmt = conn.createStatement();
            stmt.executeUpdate(sql);
        } catch (SQLException e) {
            System.out.println("DB 연동 오류 : " + e.getMessage());
        }
    }

    public void crawlAndInsertNews() {
        NewsCrawler c = new NewsCrawler();
        List<String> newsUrls = c.getNaverNewslists();
        for(String url : newsUrls) {
            NewsBean b = c.getNaverNewsBean(url);
            insertNews(b);
        }
    }
    public void crawlAndInsertNews(String date) {
        NewsCrawler c = new NewsCrawler();
        List<String> newsUrls = c.getNaverNewslists(date);
        for(String url : newsUrls) {
            NewsBean b = c.getNaverNewsBean(url);
            insertNews(b);
        }
    }
//
//    public static void main(String[] args) {
//        NewsDao d = new NewsDao();
//        d.crawlAndInsertNews();
//    }
}


