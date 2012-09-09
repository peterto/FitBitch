$(document).ready(function() {
    if ($("body.home.index").length > 0) {
        setTimeout(updateMessageStatus, 1000);
    }
});

function updateMessageStatus() {

    var msg_count = $("div.messages .message").length;

    $.ajax({
        type:"GET",
        url: "/home/check_status",
        async: true,
        dataType:"json",
        data: {msg_count: msg_count},
        success: function(data) {
            $("div.messages").prepend('<div class="message"><p class="content">'+data.msg_content+'</p><p class="timestamp">'+data.created_at+'</p></div>')
        }
    });

    setTimeout(updateMessageStatus, 1000);
}
