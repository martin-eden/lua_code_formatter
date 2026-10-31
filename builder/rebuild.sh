#!/bin/sh

# Pack program into one executable file with Lua code

#
# Author: Martin Eden
# Last mod.: 2026-10-31
#

#
# Results are placed in "deploy/"
#
# Toolchain uses my "lua code melder" tool to combine files into one:
#
#   https://github.com/martin-eden/lua_code_melder
#

set -e -u

#
# src/
#

cd ../src

# ( Get dependencies from [workshop]
rm -r -f workshop/

lua ../builder/deploy.lua

mv deploy/workshop/ .
rm -r deploy/
# )

#
# builder/
#

cd ../builder

# Combine all Lua code
./meld ../src/ reformat > ../deploy/reformat_lua.melded.lua

# Using that half-baked program to reformat and strip comments from itself
lua ../deploy/reformat_lua.melded.lua \
  ../deploy/reformat_lua.melded.lua \
  ../deploy/reformat_lua.melded.stripped.lua \
  --right-margin=64
rm ../deploy/reformat_lua.melded.lua

# Add shebang
echo '#!/usr/local/bin/lua'"\n" > ../deploy/reformat_lua.melded.stripped.shebanged.lua
cat ../deploy/reformat_lua.melded.stripped.lua >> ../deploy/reformat_lua.melded.stripped.shebanged.lua
rm ../deploy/reformat_lua.melded.stripped.lua

mv \
  ../deploy/reformat_lua.melded.stripped.shebanged.lua \
  ../deploy/reformat_lua

chmod +x ../deploy/reformat_lua

#
# deploy/
#

cd ../deploy

# Do test run
./reformat_lua \
  ../test/input.lua \
  ../test/output.lua \
  --indent='  ' \
  --right-margin=64

# 2026 # # # # #
