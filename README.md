# StockIT
2021년도 2학기 웹프로그래밍_03 팀 프로젝트

## WorkFlow
Feature Branch Workflow를 따릅니다.  
개발시에 각 기능별 혹은 사용자별로 `branch`를 만들어서 개발을 진행하고, `Pull request`를 통해 병합을 진행합니다.  
`Main` 브랜치에 직접적으로 `commit`하는 것을 피해주세요.  
자세한 사항은 아래 링크를 참조해주세요 
- [Git Feature Branch Workflow](https://www.atlassian.com/git/tutorials/comparing-workflows/feature-branch-workflow)  
- [Git을 이용한 협업 워크플로우](https://lhy.kr/git-workflow)의 2절  

## Compatibility
![OpenJDK badge](https://img.shields.io/badge/OpenJdk-8-blue)  
![Tomcat bdage](https://img.shields.io/badge/Tomcat-v8.5-blue)  
![Bootstrap](https://img.shields.io/badge/Bootstrap-v5.1-blue)

## Import to Eclipse
File > import > General > Projects from Folder or Archive

## 환경설정
### mysql
mysql jdbc 드라이버 다운로드후 `mysql-connector-java-8.x.x.jar`를  
`StockIT/WebContent/WEB-INF/lib/` 디렉토리에 위치시키기
- [mysql Connector/J 8.0.27](https://dev.mysql.com/downloads/connector/j/)

### cos.jar
프로필 수정란에서 선택한 이미지를 프로젝트 폴더에 저장하고, 필요할 때 접근하기 위해  
'cos-xx.xx.zip를 다운 후, 압축 해제 후에 lib 폴더 안 'cos.jar'를 
`StockIT/WebContent/WEB-INF/lib/` 디렉토리에 위치시키기
- [cos-20.08.zip](http://www.servlets.com/cos/)

### jsoup
웹 페이지를 크롤링 하기 위한 라이브러리
jsoup-1.14.x.jar 파일을 다운로드 받고,   
파일을 `StockIT/WebContent/WEB-INF/lib/` 디렉토리에 위치시키기
- [jsoup hompage](https://jsoup.org)
- [jsoup-1.14.3.jar](https://jsoup.org/packages/jsoup-1.14.3.jar)

## 데이터 베이스와 테이블
- 데이터베이스 명 : stockit
- 테이블 명 
- user --> userID(primary key, not null), userPassword(not null), userName, userEmail
- image --> userID(primary key, not null), filename, filerealname
- news --> NewsId(primary key, not null auto_increment), link(not null), title(not_null), imgPath

### 뉴스 데이터베이스
뉴스를 크롤링하는 시스템을 제작하기 전까지 테스트를 위해 적어도 10개의 데이터가 저장되어 있어야 합니다.
```sql
create table news(
                     NewsId int auto_increment primary key not null ,
                     link varchar(256) not null ,
                     title varchar(128) not null ,
                     imgPath varchar(128) null
);
```