#!/usr/bin/env sh

./build/tools/caffe train --solver=examples/CaffeNet3/solver.prototxt -weights models/bvlc_reference_caffenet/bvlc_reference_caffenet.caffemodel
