#!/bin/bash
set -e

./setup.sh
ament_${LINTER} src/
