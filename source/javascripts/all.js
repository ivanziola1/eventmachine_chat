// This is where it all goes :)
$(document).ready(function() {
    var client = new WebSocket('ws://localhost:8080');
    client.onopen = function() {
        console.log('Connected');
    };
    client.onmessage = function(message){
      add_message_to_log(message.data);
    };
    $('#message').keypress(function(event) {

        var keycode = (event.keyCode ? event.keyCode : event.which);
        if (keycode == '13') {
            var msg = $('#message').val();
            client.send(msg);
            $('#message').val('');
        }
    });
    var chatLog = $('#log');
    var add_message_to_log = function(message) {
      chatLog.append('<div>'+message+'</div>')
    };
});
