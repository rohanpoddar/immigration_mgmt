


function startOnClick(){
//    alert(document.body.className);
    controller_name=document.body.className;
    table=document.getElementById(controller_name);
    var rows=table.getElementsByTagName('tr');
//    alert(rows.length);
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