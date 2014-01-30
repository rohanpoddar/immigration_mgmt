$ ->
  $(document).ready ->
    $("#from").datepicker
      changeMonth: true
      changeYear: true
      dateFormat: "M d, yy"
      onClose: (selectedDate) ->
        $("#to").datepicker "option", "minDate", selectedDate

    $("#to").datepicker
      changeMonth: true
      changeYear: true
      dateFormat: "M d, yy"
      onClose: (selectedDate) ->
        $("#from").datepicker "option", "maxDate", selectedDate

