/**
 * 
 */
 jQuery(document).ready(function($) {
 	
	// 초기에 #seats를 숨깁니다.
    $('#seats').hide();
	$('#sbmBtn').hide();
	
    $('#resetBtn').on("click", function() {
        $('.seat').removeClass('selected');
        $('#seats').hide();
    });

    $('#dateTime').datepicker({
        dateFormat: 'yy/mm/dd',
        minDate: 0,
        showAnim: 'slideDown',
        changeYear: true,
        changeMonth: true,
    });

    function fetchMovieInfo(selectedMovieTitle, selectDate) {
        $.ajax({
            type: 'GET',
            url: './timeChk',
            data: { m_title: selectedMovieTitle },
            success: function(response) {
                var movieInfo = JSON.parse(response);
                var movieTimes = ["10:00", "12:00", "14:00", "16:00", "18:00"];
                $('#m_time').val(movieTimes[movieInfo - 1]);
                var ticketBooking = selectDate + "/" + movieTimes[movieInfo - 1];
                $('#t_time').val(ticketBooking);
                setupSeatSelection(ticketBooking, selectedMovieTitle);
            },
            error: function(error) {
                console.log("영화 시간 조회 오류");
                console.log(error);
            }
        });
    }

    function setupSeatSelection(ticketBooking, selectedMovieTitle) {
        var selectedSno = null;
        $('.seat').off('click').on('click', function() {
            var selectedSeat = $(this);
            var sno = selectedSeat.attr('id');
            
            if (selectedSno === sno) {
            selectedSeat.removeClass('selected');
            selectedSeat.css('background', 'white');
            $('#sno').val('');
            selectedSno = null;
            $('#sbmBtn').hide();
        } else {
            // 다른 좌석이 선택된 경우 이전에 선택된 좌석의 선택을 해제하고 현재 선택된 좌석을 저장
            $('.seat').removeClass('selected');
            selectedSeat.addClass('selected');
            selectedSeat.css('background', 'red');
            $('#sno').val(sno);
            selectedSno = sno;
            $('#sbmBtn').show();
        }
		
		// 예약된 좌석 비활성화
            $.ajax({
                type: 'GET',
                url: './ticketChk',
                data: {
                    t_time: ticketBooking,
                    sno: sno,
                    m_title: selectedMovieTitle
                },
                success: function(response) {
                    var ticketInfo = JSON.parse(response);
                    console.log("예매체크");
                    if(response === "false"){
                    	alert("예매 가능합니다.");
                    } else {
                    	alert("예약된 좌석입니다.");
                    }
                },
                error: function(error) {
                    console.log("예매 정보 조회 오류");
                    console.log(error);
                }
            });
        });
		
		
        // 나머지 좌석의 배경을 흰색으로 변경
        $('.seat').not(selectedSeat).css('background', 'white');
            console.log("예매체크");
            $.ajax({
                type: 'GET',
                url: './ticketChk',
                data: {
                    t_time: ticketBooking,
                    sno: sno,
                    m_title: selectedMovieTitle
                },
                success: function(response) {
                    var ticketInfo = JSON.parse(response);
                    console.log("예매체크");
                    if(response === "false"){
                    	alert("예매 가능합니다.")
                    } else {
                    	alert("예약된 좌석입니다.")
                    }
                },
                error: function(error) {
                    console.log("예매 정보 조회 오류");
                    console.log(error);
                }
            });
        }

    $('#m_title').off('change').on('change', function() {
    	checkMovieAndDateSelection();
        var selectedMovieTitle = $(this).val();
        var selectDate = $('#dateTime').val();
        if (selectDate) {
            fetchMovieInfo(selectedMovieTitle, selectDate);
        } else {
            alert("날짜를 선택해 주세요.");
            $('#m_title').val('null');
        }
    });
    
    function checkMovieAndDateSelection() {
        var selectedMovieTitle = $('#m_title').val();
        var selectDate = $('#dateTime').val();

        if (selectedMovieTitle !== 'null' && selectDate) {
            // 영화와 날짜가 선택되었을 때 #seats를 보여줍니다.
            fetchMovieInfo(selectedMovieTitle, selectDate);
            $('#seats').show();
            
        } else {
            // 영화나 날짜가 선택되지 않았을 때 #seats를 숨깁니다.
            $('#seats').hide();
        }
    }
});