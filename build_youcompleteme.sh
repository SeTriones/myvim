#!/bin/bash
set -e
# install youcompleteme via vundle
# get libclang according to your system version
export EXTRA_CMAKE_ARGS="-DPATH_TO_LLVM_ROOT=${YOUTPATH}/clang+llvm-4.0.0-x86_64-linux-gnu-ubuntu-16.04"
python install.py --clang-completer --gocode-completer
