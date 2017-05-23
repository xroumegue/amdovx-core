#! /bin/bash

function usage {
cat <<END
$0 PREFIX
	Build and install amdvox-core library
END
exit 1
}

if [ "$#" -ne 1 ]
	then usage
fi

INSTALLDIR="$1"


BUILDDIR="$(dirname "$0")/build"
mkdir -p "$BUILDDIR"

cd "$BUILDDIR" || exit 1;
cmake -DCMAKE_DISABLE_FIND_PACKAGE_OpenCL=TRUE  -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON -DCMAKE_INSTALL_PREFIX="$INSTALLDIR" ..
make -j12
make install

