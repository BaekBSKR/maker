jQuery(document).ready(function($) {
    $('#seats').hide();
    $('#sbmBtn').hide();
    var selectedSno = null;
    var selectedSeat;
    function resetSeats() {
        $('.seat').removeClass('selected reserved-seat');
        $('#seats').hide();
        location.replace(location.href);
    }
    function updateSelectedSeat(seatNum) {
    	if (!selectedSeat.hasClass('reserved-seat')) {
    		$('.seat').not(selectedSeat).css('background', 'white');
    	}
        selectedSeat.css('background', 'red');
        $('#sno').val(seatNum);
        selectedSno = seatNum;
    }

    function checkReservationAvailability(response) {
    	if(response === "false" && selectedSno !== null){
    		$('#sbmBtn').show();
    	}
        if (response === "false") {
            console.log("예매 가능");
        } else {
            alert("예약된 좌석입니다.");
            if (!selectedSeat.hasClass('reserved-seat')) {
                selectedSeat.removeClass('selected').css('background', 'white');
            }
            $('#sno').val('');
            $('#sbmBtn').hide();
        }
    }

    function fetchMovieInfo(selectedMovieTitle, selectDate) {
        return $.ajax({
            type: 'GET',
            url: './timeChk',
            data: { m_title: selectedMovieTitle }
        }).then(function(response) {
            var movieInfo = JSON.parse(response);
            var movieTimes = ["10:00", "12:00", "14:00", "16:00", "18:00"];
            $('#m_time').val(movieTimes[movieInfo - 1]);
            var ticketBooking = selectDate + "/" + movieTimes[movieInfo - 1];
            $('#t_time').val(ticketBooking);
            setupSeatSelection(ticketBooking, selectedMovieTitle);
            console.log(ticketBooking);
        }).fail(function(error) {
            console.log("영화 시간 조회 오류");
            console.log(error);
        });
    }

    function setupSeatSelection(ticketBooking, selectedMovieTitle) {
        $('.seat').off('click').on('click', function() {
            if ($(this).hasClass('reserved-seat')) {
            	return;
            }

            selectedSeat = $(this);
            var sno = selectedSeat.attr('id').substring(4);
            var seatNum = parseInt(sno);
            
            if (selectedSno === seatNum) {
                selectedSeat.removeClass('selected').css('background', 'white');
                $('#sno').val('');
                selectedSno = null;
                $('#sbmBtn').hide();
            } else {
                $('.seat').removeClass('selected');
                selectedSeat.addClass('selected');
                updateSelectedSeat(seatNum);
            }

            $.ajax({
                type: 'GET',
                url: './ticketChk',
                data: {
                    t_time: ticketBooking,
                    sno: seatNum,
                    m_title: selectedMovieTitle
                }
            }).then(function(response) {
                console.log("예매 체크");
                checkReservationAvailability(response);
                return $.ajax({
                    type: 'GET',
                    url: '/ticket/seatChk',
                    dataType: 'xml',
                    data: {
                        t_time: $('#t_time').val(),
                        m_title: selectedMovieTitle
                    }
                });
            }).then(function(response) {
                var items = $(response).find('item');
                items.each(function() {
                    var itemValue = $(this).text();
                    console.log(itemValue);
                    if (itemValue) {
                        $('#seat' + itemValue).addClass('reserved-seat');
                        $('#seat' + itemValue).css('background', '#808080');
                    } else {
                        console.log("응답이 유효하지 않습니다.");
                        resetSeats();
                    }
                });
            }).fail(function(error) {
                console.log("예매 정보 조회 오류");
                console.log(error);
            });
        });
    }

    function attachEventHandlers() {
        $('#resetBtn').on("click", resetSeats);
        $('#dateTime').datepicker({
            dateFormat: 'yy/mm/dd',
            minDate: 0,
            showAnim: 'slideDown',
            changeYear: true,
            changeMonth: true,
        });
        $('#m_title').off('change').on('change', function() {
            $('#seats').show();
            var selectedMovieTitle = $(this).val();
            var selectDate = $('#dateTime').val();
            $('.seat').removeClass('selected');
        	$('.seat').removeClass('reserved-seat');
            
            if (selectDate) {
                fetchMovieInfo(selectedMovieTitle, selectDate);
            } else {
                alert("날짜를 선택해 주세요.");
                $('#m_title').val('null');
            }
        });
    }

    attachEventHandlers();
});