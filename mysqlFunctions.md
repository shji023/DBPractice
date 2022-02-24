## MySQL Functions
### ASCII
- 문자열 중에서 가장 왼쪽의 문자열에 대해 숫자값으로 바꿔준다.
### CHAR LENGTH, CHAR LENGTH
- 동의어
- 문자열의 길이를 나타내준다.
```
SELECT CHAR_LENGTH("SQL Tutorial") AS LengthOfString;
```
![image](https://user-images.githubusercontent.com/60960130/155433732-01fece85-7c68-40a9-9732-ba32e65dd917.png)

### CONCAT, CONCAT_WS
- 두개, 혹은 그 이상의 구문을 이어준다.
```
SELECT CONCAT("SQL ", "Tutorial ", "is ", "fun!") AS ConcatenatedString;
```
![image](https://user-images.githubusercontent.com/60960130/155433956-eec416b7-7c06-4532-918d-10214742a2bd.png)

*합치는 함수 안에 null이 들어가면 결과값도 null이 반환된다.

- CONCAT_WS는 CONCAT함수와 동일하지만 첫번째 인자는 구분값이다.
```
SELECT CONCAT_WS("-", "SQL", "Tutorial", "is", "fun!") AS ConcatenatedString;
```
![image](https://user-images.githubusercontent.com/60960130/155434109-7f288542-0856-4cb2-86de-4f01ea924507.png)

### FIELD
- 첫번째 인자의 값이 몇번째 인덱스에 있는지 나타내 준다.
```
SELECT FIELD("q", "s", "q", "l");
```
![image](https://user-images.githubusercontent.com/60960130/155434867-161183fb-a4d2-4105-842f-71063aa0a6fe.png)
- 일치하는 문자열이나 숫자가 없으면 0을 반환한다.
- 인덱스는 1 부터 시작한다.
### FIND_IN_SET
```
FIND_IN_SET(str, strlist)
```
- ','로 구분되어있는 strlist문자열에 매칭되는 str이 있는지 확인 -> 있으면 위치 리턴 없으면 0 리턴
```
SELECT FIND_IN_SET("q", "s,q,l");
```
![image](https://user-images.githubusercontent.com/60960130/155435203-17d541fd-76ab-43ce-ac2c-945c3c372c13.png)

### FORMAT
```
FORMAT(number, decimal_places)
```
- number를 세자리마다 콤마 찍기, decimal_places: 소숫점 자릿수 표현
### INSERT
```
SELECT INSERT("W3Schools.com", 1, 9, "Example");
```
- 첫번째 부터 아홉번째까지를 Example로 대체한다.
### INSTR
```
SELECT INSTR("study mysql", "y") AS MatchPosition;
```
- 두번째 인자와 일치하는 문자의 인덱스 표현
- 일치하는 문자가 없으면 0
### LCASE, UCASE, LOWER, UPPER
- 대/소문자로 다 바꿔준다.
### LEFT, RIGHT
```
SELECT LEFT("SQL Tutorial", 3) AS ExtractString;
```
- 오른쪽/왼쪽에서 두번째 인자 개수만큼 가져오기
### LENGTH
- 함수 인자 길이 측정
### LOCATE
```
SELECT LOCATE("a", "example.com") AS MatchPosition;
```
- 첫번째 인자의 위치 리턴
### LPAD, RPAD
```
SELECT LPAD("SQL Tutorial", 20, "ABC");
```
가운데 숫자 길이만큼의 길이가 되지 않으면 앞에 "ABC"추가
### TRIM, LTRIM, RTRIM
- 양쪽,오른쪽,왼쪽 공백 지워줌
### MID
```
SELECT MID("SQLTutorial", 5, 3) AS ExtractString;
```
![image](https://user-images.githubusercontent.com/60960130/155487014-2ae7c12a-3538-4f02-b9da-025fc242bc2a.png)
- 5부터 3개 자르기
### POSITION
```
SELECT POSITION("ple" IN "example.com") AS MatchPosition;
```
![image](https://user-images.githubusercontent.com/60960130/155487161-9f32568b-0d68-48be-b545-9c6bbff50a03.png)

### REPEAT
```
SELECT REPEAT("SQL Tutorial", 3);
```
![image](https://user-images.githubusercontent.com/60960130/155487263-da15da27-d2ab-408d-ba61-92ed2bdfd557.png)
- 반복하기
### REPLACE
```
SELECT REPLACE("SQL Tutorial", "SQL", "HTML");
```
![image](https://user-images.githubusercontent.com/60960130/155487341-faca130e-8e8e-438f-8b9b-775c4aabee6e.png)
- 대체하기
### REVERSE
```
SELECT REVERSE("SQL Tutorial");
```
![image](https://user-images.githubusercontent.com/60960130/155487446-8eb79ba6-1417-48a9-b16c-4120c6cd1779.png)
- 뒤집기
### STRCMP
```
SELECT STRCMP("SQL Tutorial", "SQL Tutorial");
```
- 비교하기 같으면 0
### SUBSTR, SUBSTRING, SUBSTRING_INDEX
```
SELECT SUBSTR("SQL Tutorial", 5, 3) AS ExtractString;
```
![image](https://user-images.githubusercontent.com/60960130/155487778-5fed93a4-a52d-4b39-9eac-57e5ca225c59.png)
- 5에서 3개 자르기
```
SELECT SUBSTRING_INDEX("www.example.com", ".", 2);
```
![image](https://user-images.githubusercontent.com/60960130/155487951-9eb1232d-29ef-4abc-b14a-e33adcc8aa25.png)
- .기준으로 두번째까지 리턴
