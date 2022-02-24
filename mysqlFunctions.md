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
### LCASE, UCASE
### LEFT, RIGHT
### LENGTH
### LOCATE
### LOWER, UPPER
### LPAD, RPAD
### FORMAT
### TRIM, LTRIM, RTRIM
### MID
### POSITION
### REPEAT
### REPLACE
### REVERSE
### SPACE
### STRCMP
### SUBSTR, SUBSTRING, SUBSTRING_INDEX
### 
