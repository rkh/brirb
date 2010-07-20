require 'em-websocket'
require 'monkey/engine'
require 'capture_stdout'
require 'escape_utils'

EventMachine.run do
  EventMachine::WebSocket.start(:host => '127.0.0.1', :port => 8080) do |ws|
    @binding = binding
    @line = 1
    ws.onopen    { ws.send RUBY_DESCRIPTION }
    ws.onmessage do |msg|
      response = ""
      begin
        result = nil
        stdout = capture_stdout do
          result = eval(msg, @binding, '(brirb session)', @line)
        end
        @line += 1
        response << stdout << "=> #{result.inspect}"
      rescue Exception => e
        response << e.to_s << "\n" << e.backtrace.map { |l| "\t#{l}" }.join("\n")
      end  
      ws.send EscapeUtils.escape_html(response).gsub("\n", "<br>").gsub("\t", "    ").gsub(" ", "&nbsp;")
    end
  end
end
