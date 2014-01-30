root = window ? this

root.startTableClicker = ->
  controller_name = document.body.className
  table = document.getElementById(controller_name)
  if table?
    rows = table.getElementsByTagName("tr")
    url_name = undefined
    i = 1
    while i < rows.length
      url_name = rows[i].getElementsByClassName("show_link")[0].getAttribute("href")
      rows[i].addEventListener "click", ((url_name, i) ->
        ->
          window.location.assign url_name)(url_name, i), false
      i++

root.startCalendar = ->
  $ ->
    $(".datepicker").datepicker
      changeMonth: true
      changeYear: true
      dateFormat: "M d, yy"
      minDate: "-30Y"
      maxDate: "+30Y"

$(document).ready ->
  startTableClicker()
  startCalendar()
