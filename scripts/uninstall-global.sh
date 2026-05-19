#!/usr/bin/env bash
# Wrapper: uninstall teacher skill from repo root
exec "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../teacher/scripts/uninstall-global.sh"
