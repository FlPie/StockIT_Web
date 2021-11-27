# StockIT
2021년도 2학기 웹프로그래밍_03 팀 프로젝트

<details open>
<summary style="font-size: x-large"> todo </summary>
<div markdown="1">

- [ ] 구현 완료하기
  - 12/2(목) 시연
  - 설계한 모든 사항을 구현하려 하기보다 페이지에 필수적인 항목들 위주로 구현하기
- [ ] 발표 ppt 제작
  - 11/29(월) 발표
- [ ] 보고서 작성
  - 아마 12/1(수) 자정까지 제출 (12/2(목) 수업시간 전까지 일수도)
  - 한컴 office web으로 작성할지 아니면 word로 작성할지 선택
    - 보고서 양식이 한글(.hwp) 포맷임

</div>
</details>

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

### mail
메일인증 위한 라이브러리
mail-1.4.7.jar와 activation-1.1.jar 다운 받아서 
두 jar파일 'StockIT/WebContent/WEB-INF/lib/' 경로에 위치시키기
(https://heodolf.tistory.com/99)에서 잘 실행되는 mail.jar, activation.jar 다운 가능

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
> 각자 테이블 생성에 사용한 쿼리문을 공유해주시면 좋을것 같습니다.
- 데이터베이스 명 : stockit
- 테이블 명 
- user --> userID(primary key, not null), userPassword(not null), userName, userEmail
- image --> userID(primary key, not null), filename, filerealname
- news --> NewsId(primary key, not null auto_increment), link(not null), title(not_null), imgPath

### 유저 정보 데이터베이스
```sql
create table user(
                     userId varchar(64) primary key not null,
                     userPassword varchar(64),
                     userName varchar(64),
                     userEmail varchar(64)
);
```
### 유저 프로필 이미지 데이터베이스
```sql
create table image(
                     userId varchar(64) primary key not null,
                     filename varchar(256),
                     filerealname varchar(256)
);
```

### 뉴스 데이터베이스
중복된 뉴스를 크롤링하는 것을 방지하기 위해 테이블 구조를 수정했습니다.  
이전에 뉴스 테이블을 생성한 경우 꼭 테이블을 다시 생성해주세요.  
- [x] ~~뉴스 크롤링하는 시스템 추가.~~ 뉴스 크롤링 시스템 추가 완료
```sql
create table news(
                     newsId int auto_increment primary key not null ,
                     link varchar(256) unique not null ,
                     title varchar(128) not null ,
                     imgPath varchar(128) null
);
```
