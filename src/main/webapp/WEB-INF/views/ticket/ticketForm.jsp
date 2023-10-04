<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- jQuery UI -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<title>영화 예매</title>
<!-- jQuery UI의 스타일과 스크립트를 추가합니다. -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script>
    $(document).ready(function() {
        // datepicker를 적용할 input 필드의 id를 지정하고 datepicker를 호출합니다.
        $('#dateTime').datepicker({
            dateFormat: 'yyMMdd', // 날짜 형식을 'yyyyMMdd'로 지정합니다.
            minDate: 0, // 오늘 이전 날짜를 선택할 수 없도록 설정합니다.
            showAnim: 'slideDown', // 애니메이션 효과를 적용합니다.
            changeYear: true, // 년도를 선택할 수 있도록 설정합니다.
            changeMonth: true, // 월을 선택할 수 있도록 설정합니다.
        });
    });
</script>
</head>
<body>
    <h1>영화 예매</h1>
    <form action="/ticket/save" method="post">
        <label for="movieName">영화</label>
        <select id="mTitle" name="movieTitle">
        	<c:forEach var="movie" items="${movies }">
        		<option value="${movie.mTitle}">${movie.mTitle}</option>
        	</c:forEach>
        </select>
        <!-- 달력 형식의 날짜 선택을 위한 입력 필드 -->
        <input type="text" id="dateTime" name="dateTime" required><br>
        <select id="mTime">
        	<option value="1">10:00</option>
        	<option value="2">12:00</option>
        	<option value="3">14:00</option>
        	<option value="4">16:00</option>
        	<option value="5">18:00</option>
        </select>
        <button type="submit">예매</button>
    </form>
</body>
</html>