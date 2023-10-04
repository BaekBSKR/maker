<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매 페이지</title>
    <style>
        .seat {
            width: 50px;
            height: 50px;
            border: 1px solid black;
            margin: 5px;
            text-align: center;
            line-height: 50px;
            cursor: pointer;
        }

        .booked {
            background-color: #ccc;
            pointer-events: none;
        }
    </style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
		$(document).ready(function() {
		    $('#bookingForm').submit(function(event) {
		        event.preventDefault(); // 폼 제출 방지
		        var date = $('#date').val();
		        var time = $('#time').val();
		        // 예매 정보를 "yyyy-mm-dd/hh:mm" 형태의 문자열로 합침
		        var mTime = date + time;
		
		        // 여기에서 bookingInfo를 서버로 보내거나 필요한 로직을 수행할 수 있습니다.
		        // 이 예제에서는 결과를 화면에 표시합니다.
		        $('#result').text('예매 정보: ' + mTime);
		        
		        // 서버로 예매 정보를 보내는 코드는 이 부분에 추가해야 합니다.
		        // $.ajax 또는 $.post 등의 함수를 사용하여 서버와 통신할 수 있습니다.
		    });
		    
		 // 예매된 좌석 정보 (예: 서버에서 받아온 정보)
            var bookedSeats = ["11", "22", "33"]; // 예매된 좌석 번호 목록

            // 좌석 클릭 이벤트 핸들러
            $('.seat').click(function() {
                var sno = $(this).attr('id');
                
                // 예매된 좌석인지 확인
                if (bookedSeats.includes(sno)) {
                    alert('이미 예매된 좌석입니다. 다른 좌석을 선택해주세요.');
                } else {
                    // 선택된 좌석 번호를 서버로 전송하거나 필요한 작업을 수행합니다.
                    alert('선택한 좌석 번호: ' + sno);
                }
            });

            // 예매된 좌석을 비활성화합니다.
            bookedSeats.forEach(function(seatNumber) {
                $('#' + seatNumber).addClass('booked');
            });
		});
	</script>
</head>
<body>
    <h1>예매 페이지</h1>
	<form method="post">
        <label for="date">날짜:</label>
        <input type="date" id="date" name="date" required><br>

        <label for="time">시간:</label>
        <input type="time" id="time" name="time" required><br>

        <div id="seats">
	        <%-- 좌석을 나타내는 엘리먼트를 생성합니다. --%>
	        <c:forEach var="row" begin="1" end="5">
	            <c:forEach var="col" begin="1" end="10">
	                <div class="seat" id="<c:out value='10*(${row}-1)+${col}' />"></div>
	            </c:forEach>
	            <br>
	        </c:forEach>
	    </div>
        <input type="text" id="sno" name="sno" required><br>
		
        <button type="submit">예매하기</button>
    </form>
</body>
</html>