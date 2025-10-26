#!/bin/bash
set -e

rm -f /apps/tmp/pids/server.pid

exec "$@"
