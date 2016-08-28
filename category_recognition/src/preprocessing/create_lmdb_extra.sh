TOOLS=/Users/ashish/caffe/build/tools
RESIZE_HEIGHT=256
RESIZE_WIDTH=256

# Create train lmdb
# GLOG_logtostderr=1 $TOOLS/convert_imageset \
#     --resize_height=$RESIZE_HEIGHT \
#     --resize_width=$RESIZE_WIDTH \
#     --shuffle \
#     ./train_images/ \
#     ./train_listfile.txt \
#     train_lmdb

# Create test lmdb
# GLOG_logtostderr=1 $TOOLS/convert_imageset \
#     --resize_height=$RESIZE_HEIGHT \
#     --resize_width=$RESIZE_WIDTH \
#     ./test_images/ \
#     ./test_listfile.txt \
#     test_lmdb

GLOG_logtostderr=1 $TOOLS/convert_imageset \
    --resize_height=$RESIZE_HEIGHT \
    --resize_width=$RESIZE_WIDTH \
    --shuffle \
    ./extra_train_images/ \
    ./extra_train_listfile.txt \
    extra_train_lmdb

# Compute training set mean file
$TOOLS/compute_image_mean ./extra_train_lmdb ./extra_train_mean.binaryproto