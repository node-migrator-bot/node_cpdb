
.PHONY: all
all:

.PHONY: test
test: target/latest-dbTest.js target/latest-concurrencyTest.js

.PHONY: clean
clean:
	rm -rf target
	find '.' -name '*~' -type f -exec rm {} \;

.PHONY: publish
publish: test
	npm publish .

target:
	mkdir "$@"

target/latest-dbTest.js: target test/dbTest.js test/dbTestUtils.js lib/node_cpdb.js
	node test/dbTest.js
	touch "$@"

target/latest-concurrencyTest.js: target test/concurrencyTest.js test/dbTestUtils.js lib/node_cpdb.js
	node test/concurrencyTest.js
	touch "$@"
