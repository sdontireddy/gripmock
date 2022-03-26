#!/bin/sh
ALL_PROTO_FILES=$(find "$(pwd -P)" -name "*.proto")
ALL_PROTO_DIR=$(find . -type d | paste -d, -s)
echo $ALL_PROTO_FILES
echo $ALL_PROTO_DIR
gripmock -imports=/protos,/protobuf,$ALL_PROTO_DIR $ALL_PROTO_FILES
