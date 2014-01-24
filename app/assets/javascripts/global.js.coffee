$(document).on "focus", "[data-behaviour~='datepicker']", (e) ->
- $(this).datepicker
- 'data-date-format': "dd-mm-yyyy"
- autoclose: true
- weekStart: 1