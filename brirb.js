(function(){
  $(document).ready(function() {
    var input, output, ws;
    input = $("#input");
    output = function(str) {
      $("#log").append("" + str + "<br>");
      return input.attr({
        scrollTop: input.attr("scrollHeight")
      });
    };
    ws = new WebSocket("ws://127.0.0.1:8080");
    ws.onmessage = function(e) {
      return output(e.data);
    };
    ws.onclose = function() {
      return output("!!! CLOSED !!!");
    };
    ws.onerror = function() {
      return output("!!! ERROR !!!");
    };
    input.focus();
    return $("form").submit(function() {
      var value;
      value = input.val();
      ws.send(value);
      output("&gt;&gt; " + value);
      input.val("");
      input.focus();
      return false;
    });
  });
})();
