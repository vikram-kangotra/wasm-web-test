EMCC_CFLAGS=
RUST_TARGET=wasm32-unknown-unknown

ifeq ($(RUST_TARGET),wasm32-unknown-emscripten)
  EMCC_CFLAGS=--no-entry
endif

all: wasm_web_test.wasm

wasm_web_test.wasm: src/lib.rs Makefile
	EMCC_CFLAGS=${EMCC_CFLAGS} cargo build --target $(RUST_TARGET) --release
	cp target/${RUST_TARGET}/release/wasm_web_test.wasm .

.PHONY: clean
clean:
	rm wasm_web_test.wasm
