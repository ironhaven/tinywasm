#!/bin/sh

set -eu pipefail

TARGET=wasm32-unknown-unknown
BINARY=target/$TARGET/release/tinywasm.wasm

cargo build --target $TARGET --release
wasm-strip $BINARY
mkdir -p www
wasm-opt -o www/bare_metal_wasm.wasm -Oz $BINARY
ls -lh www/tinywasm.wasm

