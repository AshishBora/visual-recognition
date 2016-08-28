#!/usr/bin/env sh

./build/tools/caffe train --solver=examples/CaffeNet2/solver.prototxt -weights models/bvlc_reference_caffenet/bvlc_reference_caffenet.caffemodel
