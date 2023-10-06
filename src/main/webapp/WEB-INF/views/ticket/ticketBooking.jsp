<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
	#seats ul {
		display: flex; /* Flexbox 레이아웃을 사용하여 자식 요소들을 가로로 나열 */
    	list-style: none;
	}
	#seats ul:last-child {
    margin-right: 0;
	}
	#seats li {
		list-style-type: none;
	}
    .seat {
        width: 50px !important;
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
<title>영화 예매</title>
<!-- jQuery UI의 스타일과 스크립트를 추가합니다. -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script>
    $(document).ready(function() {
        // datepicker를 적용할 input 필드의 id를 지정하고 datepicker를 호출합니다.
        $('#dateTime').datepicker({
            dateFormat: 'yy/mm/dd', // 날짜 형식을 'yyyymmdd'로 지정합니다.
            minDate: 0, // 오늘 이전 날짜를 선택할 수 없도록 설정합니다.
            showAnim: 'slideDown', // 애니메이션 효과를 적용합니다.
            changeYear: true, // 년도를 선택할 수 있도록 설정합니다.
            changeMonth: true, // 월을 선택할 수 있도록 설정합니다.
        });
		// 예매 정보
        $('#m_title').change(function() {
        	var selectedMovieTitle = $(this).val();
        	var selectDate = $('#dateTime').val();
        	if(selectDate){
        		$.ajax({
                    type: 'GET',
                    url: './timeChk',
                    data: {m_title: selectedMovieTitle},
                    success: function(response) {
                        // JSON 호출
                        var movieInfo = JSON.parse(response);
                        // 영화 시간 호출
                        if(movieInfo == 1){
                        	$('#m_time').val("10:00");
                        }
                        if(movieInfo == 2){
                        	$('#m_time').val("12:00");
                        }
                        if(movieInfo ==3){
                        	$('#m_time').val("14:00");
                        }
                        if(movieInfo == 4){
                        	$('#m_time').val("16:00");
                        }
                        if(movieInfo ==5){
                        	$('#m_time').val("18:00");
                        }
                        var ticketBooking = selectDate + "/" + $('#m_time').val();
                		console.log(ticketBooking);
                		
                		$('.seat').click(function() {
                            var sno = $(this).attr('id');
                			$(this).css('background', 'red');
                			alert('선택한 좌석 번호: ' + sno);
                            console.log(sno);
                			// 예매된 좌석인지 확인
                            $.ajax({
                            	type: 'GET',
                            	url: './ticketChk',
                            	data: {
                            		t_time: ticketBooking,
                            		sno: sno
                            	},
                            	success: function(response){
                            		// JSON 호출
                            		var ticketInfo = JSON.parse(response);
                            		console.log(ticketInfo);
                            		
                            		// 예매된 좌석인지 확인 후 서버에 데이터 전송
                            	    $.ajax({
                            	        type: 'POST', // POST 요청 사용
                            	        url: './ticketSave', // 요청을 보낼 서버의 URL
                            	        contentType: 'application/json', // 전송할 데이터의 형식을 JSON으로 지정
                            	        data: JSON.stringify({ // JSON 형식으로 데이터를 만들어 전송
                            	            t_time: ticketBooking,
                            	            sno: sno,
                            	            m_title: selectedMovieTitle
                            	        }),
                            	        success: function(response) {
                            	            // 서버에서 받은 응답 처리
                            	            console.log(response);
                            	        },
                            	        error: function(error) {
                            	            // 오류 처리
                            	            console.log("예매 정보 전송 오류");
                            	            console.log(error);
                            	        }
                            	    });
                            	},
                            	error: function(error){
                            		console.log("예매 정보 조회 오류");
                            		console.log(error);
                            	}
                            });
                            // 선택된 좌석 번호를 서버로 전송하거나 필요한 작업을 수행합니다.
                            
                        });
                    },
                    error: function(error) {
                    	console.log("영화 시간 조회 오류");
                        console.log(error);
                    }
                });
        	} else {
        		alert("날짜를 선택해 주세요.");
        		$('#m_title').val('null');
        	}
        });
    });
</script>
</head>
<body>
    <h1>영화 예매</h1>
    <form action="./ticketSave" method="post">
        <label for="dateTime">날짜</label>
        <!-- 달력 형식의 날짜 선택을 위한 입력 필드 -->
        <input type="text" id="dateTime" name="dateTime" required><br>
        <label for="movieName">영화</label>
        <select id="m_title" name="m_title">
        	<option value="null">--영화를 선택해 주세요.--</option>
	        	<c:forEach var="movie" items="${movies}">
        			<option value="${movie.m_title}">${movie.m_title}</option>
        		</c:forEach>
        </select>
        <label for="m_time">시간</label>
        <input type="text" id="m_time" name="m_time" readonly><br>
        <div id="seats">
	        <%-- 좌석을 나타내는 엘리먼트를 생성합니다. --%>
	        <c:forEach var="row" begin="1" end="5">
	        	<ul>
	            <c:forEach var="col" begin="1" end="10">
	            	<c:set var="sno" value="${10*(row-1)+col}" />
	            	<li><div class="seat" id="<c:out value='${sno}' />">${sno}</div></li>
	                
	            </c:forEach>
	            </ul>
	        </c:forEach>
	    </div>
        <button type="submit">예매</button>
    </form>
</body>
</html>