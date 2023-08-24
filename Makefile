EMCC_CFLAGS=--no-entry
RUST_TARGET=wasm32-unknown-unknown

.PHONY: main.html
main.html: main.cpp libwasm_web_test.a
	emcc $(LDFLAGS) -o main.html $^
	wasm2wat main.wasm -o main.wat
main.html: LDFLAGS = \
	-sERROR_ON_UNDEFINED_SYMBOLS=0

libwasm_web_test.a: ./src/lib.rs
	EMCC_CFLAGS=${EMCC_CFLAGS} cargo build \
		-Zbuild-std=std,panic_abort \
		--target $(RUST_TARGET) --release
	cp ./target/$(RUST_TARGET)/release/libwasm_web_test.a .
	cp ./target/$(RUST_TARGET)/release/wasm_web_test.wasm .
	wasm2wat wasm_web_test.wasm -o wasm_web_test.wat

.PHONY: clean
clean:
	cargo clean
	rm libwasm_web_test.a main.html main.js *.wasm *.wat
