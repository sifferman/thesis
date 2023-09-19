
all: clean verify

verify: build/cache.svh
	diff cache.svh build/cache.svh

build/cache.svh:
	mkdir -p build
	curl -s "https://raw.githubusercontent.com/sifferman/labs-with-cva6/2b788a9511ce8e0282f4ee5a8cbae2135eb0c540/labs/caching/part2/starter/ucsbece154b_victim_cache.sv" | sed -n "148,168p" > $@

clean:
	rm -rf build
