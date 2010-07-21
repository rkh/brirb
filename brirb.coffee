$(document).ready ->
  input: $("#input")
  output: (str) ->
    $("#log").append "$str<br>"
    input.attr {scrollTop: input.attr("scrollHeight") }

  ws: new WebSocket("ws://127.0.0.1:8080")
  #ws.onopen: -> output "onopen"
  ws.onmessage: (e) -> output e.data
  ws.onclose: -> output "!!! CLOSED !!!"
  ws.onerror: -> output "!!! ERROR !!!"
  input.focus()

  $("form").submit ->
    value: input.val()
    ws.send value
    output "&gt;&gt; $value"
    input.val ""
    input.focus()
    false
