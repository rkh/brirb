IRB in your browser, via WebSockets.
Proof of concept.

# Installation

    gem install haml em-websockets monkey-lib capture_stdout escape_utils
    git clone git://github.com/rkh/brirb
    cd brirb
    make
    ruby brirb.rb

Now, open `brirb.html`.

# What's the point?

* Embed this in your Rails/Rack app, so you have a console in the process serving your page
* Embed this in your ShowOff presentations to really show off
* WebSockets are fun, play with the code!
* Combine IRB with HTML output/interaction...
* Output is fully async! Try this (in brirb): `Thread.new { loop { sleep 2; ws.send('foo') } }` (stop it with `_.kill`)

# Want to hack on it?

Feel free! Especially my javascript-fu sucks a lot. It is not very shell like at the moment.
