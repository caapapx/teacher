#!/usr/bin/env bash
# Wrapper: install teacher skill from repo root
exec "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../teacher/scripts/install-global.sh"
