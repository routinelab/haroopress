SOURCE_DIR=./source/public
DEPLOY_DIR=./_deploy

init:
	git submodule update --init
	rm -rf ./lib/bootstrap/bootstrap/
	cd ./lib/bootstrap/;make bootstrap
	cp -R ./lib/bootstrap/bootstrap/* ${SOURCE_DIR}
	cd ./lib/jquery/;make
	cp ./lib/jquery/dist/* ${SOURCE_DIR}/js
	cp ./lib/requirejs/require.js ${SOURCE_DIR}/js
	cp ./lib/requirejs/text.js ${SOURCE_DIR}/js

update:
	git submodule update --init
	cd ./lib/google-code-prettify/;make

copy:
	cp ./lib/google-code-prettify/*.js ./source/public/js/
	cp ./lib/google-code-prettify/*.css ./source/public/css/

gen:
	cp -R ${SOURCE_DIR}/* ${DEPLOY_DIR}
	cd ./bin/;./gen-index;./gen-main;./gen-rss
	cd ./bin/;./gen-category;./gen-tag

preview:
	node app.js

.PHONY: init update copy
