package news;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;

public class NewsCrawler {
    private static final String naverFinanceMainUrl = "https://finance.naver.com/";
    private static final String naverFinanceNewsMainUrl = naverFinanceMainUrl + "news/mainnews.naver";
    public List<String> getNaverNewslists() {   // 네이버의 주요뉴스 링크들을 크롤링하는 함수
        List<String> newsUrls = new ArrayList<String>();
        return getStrings(newsUrls, naverFinanceNewsMainUrl);
    }
    public List<String> getNaverNewslists(Date date) {   // 네이버의 주요뉴스 링크들을 크롤링하는 함수
        List<String> newsUrls = new ArrayList<>();
        DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");
        return getStrings(newsUrls, naverFinanceNewsMainUrl + "?date=" + dateFormat.format(date));
    }
    public List<String> getNaverNewslists(String date) {    // 네이버의 주요뉴스 링크들을 크롤링하는 함수
        List<String> newsUrls = new ArrayList<>();
        return getStrings(newsUrls, naverFinanceNewsMainUrl + "?date=" + date);
    }
    private List<String> getStrings(List<String> newsUrls, String url2Crawl) {
        try {
            Document doc = Jsoup.connect(naverFinanceNewsMainUrl).get();
            Elements links = doc.select(".articleSubject > a");

            for (Element link : links) {
                String url = link.attr("href");
                newsUrls.add(url);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return newsUrls;
    }
    public NewsBean getNaverNewsBean(String url) {
        // 네이버 뉴스 페이지 url을 입력받아 url, 이미지주소, 제목을 가진 NewsBean을 반환하는 함수
        String fullUrl = naverFinanceMainUrl + url;
        NewsBean b = new NewsBean();
        b.setLink(fullUrl);
        try {
            Document doc = Jsoup.connect(fullUrl).get();
            String title = doc.selectFirst("div#contentarea_left > div > div > div.article_info > h3").text();
            b.setTitle(title.replaceAll("'", "\\\\'"));
            String imgLink = doc.selectFirst("span.end_photo_org > img").attr("src");
            b.setImgPath(imgLink);
        } catch (NullPointerException e) {
            b.setImgPath("");
        } catch (IOException e) {
            e.printStackTrace();
        }

        return b;
    }
}
