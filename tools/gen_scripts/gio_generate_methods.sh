#!/bin/bash

# Note that 
# JHBUILD_SOURCES should be defined to contain the path to the root of the
# jhbuild sources. The defs files will be placed in glib/src.

if [ -z "$JHBUILD_SOURCES" ]; then
  echo -e "JHBUILD_SOURCES must contain the path to the jhbuild sources."
  exit 1;
fi

PREFIX="$JHBUILD_SOURCES/glib"
ROOT_DIR="$(dirname "$0")/../.."
OUT_DIR="$ROOT_DIR/gio/src"

H2DEF_PY="$JHBUILD_SOURCES/glibmm/tools/defs_gen/h2def.py"
$H2DEF_PY "$PREFIX"/gio/*.h > "$OUT_DIR"/gio_methods.defs
#patch "$OUT_DIR"/gio_methods.defs "$OUT_DIR"/gio_methods.defs.patch