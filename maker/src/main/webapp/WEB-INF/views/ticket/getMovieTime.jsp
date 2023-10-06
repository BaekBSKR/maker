<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movie Info</title>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script>
if(){
	$.ajax({
		 type: 'GET',
         url: './/ticketChk',
         data: {
        	 t_time: ticketBooking,
             sno : 	 
         },
         success: function(response) {
        	 
         },
         error: function(error) {
             console.log(error);
         }
	});
}  
    ///////////////////////////////////////////////////////////////
     // Check if a movie is selected
                if (selectedMovieTitle !== "null") {
                    // Make an AJAX request to get movie information and booked seats
                    $.ajax({
                        type: 'GET',
                        url: './getMovieInfo',
                        data: { 
                        	m_title: selectedMovieTitle,
                        	date : selectDate
                        	},
                        success: function(response) {
                            // Parse the JSON response
                            var movieInfo = JSON.parse(response);

                            // Update mTime field with the selected movie's time
                            $('#m_time').val(movieInfo.m_time);

                            // Disable booked seats
                            var bookedSeats = movieInfo.bookedSeats;
                            $('.seat').removeClass('booked');

                            $.each(bookedSeats, function(index, seatNumber) {
                                $('#' + seatNumber).addClass('booked');
                            });
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
                        },
                        error: function(error) {
                            console.log(error);
                        }
                    });
                } else {
                    // Reset mTime field and enable all seats if no movie is selected
                    $('#mTime').val('');
                    $('.seat').removeClass('booked');
                }
    
    //////////////////////////////////////////////////////////////////////
    //티켓 예매 체크
        function ticketCheck(boxElem, pElem, name) {
            var boxE = $(boxElem);
            var pE = $(pElem);

            if (boxE.val() == "") {
                //공백일 경우
            } else {
                $.get("userInfoCheck", { value : boxE.val(), name : name }, function(isExist) {
                    if (isExist == false) {
                        //기존 예약 데이터와 겹치지 않는 경우

                    } else {
                        //예약된 경우
                        if (name == "nickName") { pE.html('이미 존재하는 닉네임입니다.'); }
                        else if (name == "email") { pE.html('이미 존재하는 이메일입니다.'); }
                    }
                });
            }
        }
		
		// 예매 확인
                if (selectedMovieTitle !== "null") {
                    // Make an AJAX request to get movie information and booked seats
                    $.ajax({
                        type: 'GET',
                        url: './getMovieInfo',
                        data: {m_title: selectedMovieTitle},
                        success: function(response) {
                            // Parse the JSON response
                            var movieInfo = JSON.parse(response);

                            // Update mTime field with the selected movie's time
                            $('#m_time').val(movieInfo.m_time);

                            // Disable booked seats
                            var bookedSeats = movieInfo.bookedSeats;
                            $('.seat').removeClass('booked');

                            $.each(bookedSeats, function(index, seatNumber) {
                                $('#' + seatNumber).addClass('booked');
                            });
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
                        },
                        error: function(error) {
                            console.log(error);
                        }
                    });
                } else {
                    // Reset mTime field and enable all seats if no movie is selected
                    $('#mTime').val('');
                    $('.seat').removeClass('booked');
                }
</script>
</head>
<body>
</body>
</html>
