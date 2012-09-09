$(document).ready(function() {
    if ($("body.home.index").length > 0) {
        setTimeout(updateMessageStatus, 1000);
    }
});

function updateMessageStatus() {

    // greatest of messages id to pass in
    var msg_count = $("table tr").length;

    $.ajax({
        type:"GET",
        url: "/home/check_status",
        async: true,
        dataType:"json",
        data: {msg_count: msg_count},
        success: function(data) {
            $("table").append("<tr><td>"+data.msg_content+"</td></tr>")
        }
    });

    setTimeout(updateMessageStatus, 1000);

}
