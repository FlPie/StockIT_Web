package stock;

public class StockBean {
    private String symbol;      // 종목코드
    private String market;      // 거래소
    private String name;        // 주식이름
    private Float lastSale;    // 가격 or 종가
    private Float marketCap;   // 시가총액
    private String country;     // 국가
    private Float volume;      // 거래량

    public StockBean() {

    }
    public StockBean(String symbol, String market, String name, Float lastSale, Float marketCap, String country, Float volume) {
        this.symbol = symbol;
        this.market = market;
        this.name = name;
        this.lastSale = lastSale;
        this.marketCap = marketCap;
        this.country = country;
        this.volume = volume;
    }

    public String getSymbol() {
        return symbol;
    }

    public void setSymbol(String symbol) {
        this.symbol = symbol;
    }

    public String getMarket() {
        return market;
    }

    public void setMarket(String market) {
        this.market = market;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Float getLastSale() {
        return lastSale;
    }

    public void setLastSale(Float lastSale) {
        this.lastSale = lastSale;
    }

    public Float getMarketCap() {
        return marketCap;
    }

    public void setMarketCap(Float marketCap) {
        this.marketCap = marketCap;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public Float getVolume() {
        return volume;
    }

    public void setVolume(Float volume) {
        this.volume = volume;
    }
}
