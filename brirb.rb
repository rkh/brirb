require 'em-websocket'
require 'monkey/engine'
require 'capture_stdout'
require 'escape_utils'

EventMachine.run do
  EventMachine::WebSocket.start(:host => '127.0.0.1', :port => 8080) do |ws|
    @binding = binding
    @line = 1
    @cmd = ""
    _ = nil
    ws.onopen    { ws.send RUBY_DESCRIPTION }
    ws.onmessage do |msg|
      @cmd << msg << "\n"
      response = ""
      begin
        stdout = capture_stdout do
          _ = eval(@cmd, @binding, '(brirb session)', @line)
        end
        @line += 1
        response << stdout << "=> #{_.inspect}"
        @cmd = ""
      rescue Exception => e
        unless e.class == SyntaxError
          response << e.to_s << " (" << e.class.to_s << ") \n" << e.backtrace.map { |l| "\t#{l}" }.join("\n")
        else
          response = ""
        end
      end  
      ws.send EscapeUtils.escape_html(response).gsub("\n", "<br>").gsub("\t", "    ").gsub(" ", "&nbsp;")
    end
  end
end
