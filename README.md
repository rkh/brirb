IRB in your browser, via WebSockets.
Prove of concept.

= Installation

    gem install haml em-websockets monkey-lib capture_stdout escape_utils
    git clone git://github.com/rkh/brirb
    cd brirb
    make
    ruby brirb.rb

Now, open `brirb.html`.

= What's the point?

* Embed this in your Rails/Rack app, so you have a console in the process serving your page
* Embed this in your ShowOff presentations to really show of
* WebSockets are fun, play with the code!
* Combine IRB with HTML output/interaction...
