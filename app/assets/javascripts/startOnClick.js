function startTableClicker() {
    controller_name=document.body.className;
    table=document.getElementById(controller_name);
    if(table!=null)
    {
        var rows=table.getElementsByTagName('tr');
        var url_name;
        for (i = 1; i < rows.length; i++) {
            url_name = rows[i].getElementsByClassName('show_link')[0].getAttribute("href");
            rows[i].addEventListener('click', (function(url_name,i) {
                return function() {
                    window.location.assign(url_name);
                }
            })(url_name,i),false);
        }
    }
}
function startCalendar() {
    $(function() {
        $( ".datepicker" ).datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'M d, yy',
            minDate: '-30Y',
            maxDate: '+30Y'
        });
    });
}
function startOnLoad(){
    startTableClicker();
    startCalendar();
}