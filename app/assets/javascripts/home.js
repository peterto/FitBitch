$(document).ready(function() {
    if ($("body.home.index").length > 0) {
        updateMessageStatus()
        setTimeout(updateMessageStatus, 5000);
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
            if(data.type === 'text') {
                $("div.messages").prepend('<div class="message new" style="display:none;"><p>You got a text msg:</p><p class="content">'+data.msg_content+'</p><p class="timestamp">'+data.created_at+'</p></div>');
                $("div.message.new").show("slow");
            } else {
                $("div.messages").prepend('<div class="message new" style="display:none;"><p>You got an email:</p><p class="content">Subject: '+data.subject+'</p><img src="'+data.meme_image_url+'"/><p class="timestamp">'+data.created_at+'</p></div>');
                $("div.message.new").show("slow");
            }
        }
    });

    setTimeout(updateMessageStatus, 2000);
}
