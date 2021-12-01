package stock;

import java.io.*;
import java.util.*;

public class ReadCsv {
    private static List<List<String>> readTXTFile(String csvFileName) throws IOException {
        // 주식 정보 csv 파일을 읽어옴
        String line = null;
        BufferedReader stream = null;
        List<List<String>> csvData = new ArrayList<List<String>>();

        try {
            stream = new BufferedReader(new FileReader(csvFileName));
            while ((line = stream.readLine()) != null) {
                String[] splitted = line.split(",");
                List<String> dataLine = new ArrayList<String>(splitted.length);
                dataLine.addAll(Arrays.asList(splitted));
                csvData.add(dataLine);
            }
        } finally {
            if (stream != null)
                stream.close();
        }

        return csvData;
    }
    private static void insertStockData(){
        // 나스닥과 한국거래소 상장 주식들의 기본정보를 데이터베이스에 삽입
        // 각 파일 경로나 파일 이름이 하드코딩되어있어 다른 파일을 사용하고자 한다면 변경해주어야함.
        // *   파일 출처
        // *** Nasdaq    : https://www.nasdaq.com/market-activity/stocks/screener
        // *** 한국거래소 : http://data.krx.co.kr/contents/MDC/MAIN/main/index.cmd
        String csvKs = "./WebContent/csv/data_0144_20211128.csv";
        String csvNasdaq = "./WebContent/csv/nasdaq_screener_1638084352400.csv";
        List<List<String>> csv;
        StockCsvDao dao = new StockCsvDao();
        try {
            // insert Nasdaq data
            csv = readTXTFile(csvNasdaq);
            csv.remove(0);
            dao.insertNasdaqStock(csv);
            // insert KS data
            csv = readTXTFile(csvKs);
            csv.remove(0);
            dao.insertKsStock(csv);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

//    public static void main(String[] args) {
////        String actual = FileAssert.printDirectoryTree(new File("./src"));
////        System.out.println(actual);
//        insertStockData();
//    }
}
class FileAssert {

    /**
     * Pretty print the directory tree and its file names.
     *
     * @param folder
     *            must be a folder.
     * @return
     */
    public static String printDirectoryTree(File folder) {
        if (!folder.isDirectory()) {
            throw new IllegalArgumentException("folder is not a Directory");
        }
        int indent = 0;
        StringBuilder sb = new StringBuilder();
        printDirectoryTree(folder, indent, sb);
        return sb.toString();
    }

    private static void printDirectoryTree(File folder, int indent,
                                           StringBuilder sb) {
        if (!folder.isDirectory()) {
            throw new IllegalArgumentException("folder is not a Directory");
        }
        sb.append(getIndentString(indent));
        sb.append("+--");
        sb.append(folder.getName());
        sb.append("/");
        sb.append("\n");
        for (File file : folder.listFiles()) {
            if (file.isDirectory()) {
                printDirectoryTree(file, indent + 1, sb);
            } else {
                printFile(file, indent + 1, sb);
            }
        }

    }

    private static void printFile(File file, int indent, StringBuilder sb) {
        sb.append(getIndentString(indent));
        sb.append("+--");
        sb.append(file.getName());
        sb.append("\n");
    }

    private static String getIndentString(int indent) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < indent; i++) {
            sb.append("|  ");
        }
        return sb.toString();
    }
}
