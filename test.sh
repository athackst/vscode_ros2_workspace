#!/bin/bash
set -e

if [ -f install/setup.bash ]; then source install/setup.bash; fi
colcon test --merge-install
colcon test-result
