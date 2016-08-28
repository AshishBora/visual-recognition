#!/usr/bin/env sh

./build/tools/caffe train --solver=examples/hw2_GoogleNet/quick_solver_GoogleNet.prototxt -weights models/bvlc_googlenet/bvlc_googlenet.caffemodel
