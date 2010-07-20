default:
	curl -O http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js
	coffee -c brirb.coffee
	compass compile --sass-dir . --css-dir . --images-dir . --javascripts-dir .
	haml --format html5 brirb.haml brirb.html