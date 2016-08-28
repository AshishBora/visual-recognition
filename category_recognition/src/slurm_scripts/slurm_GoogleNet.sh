#!/bin/bash

#SBATCH -A CS381V-Visual-Recogn
#SBATCH -n 20
#SBATCH -N 1
#SBATCH -p gpu
#SBATCH -t 12:00:00 
#SBATCH -e /work/04001/ashishb/maverick/logs/GoogleNet.err 
#SBATCH -o /work/04001/ashishb/maverick/logs/GoogleNet.out
#SBATCH -J hw2_GoogleNet
#SBATCH --mail-user=ashish.bora@utexas.edu
#SBATCH --mail-type=all

echo job $JOB_ID execution at: `date`
NODE_HOSTNAME=`hostname -s`
echo "running on node $NODE_HOSTNAME"

# echo "Starting to tune the last layer"
echo -e "\n\nTraining last layer of GoogleNet\n\n"
cd /work/04001/ashishb/maverick/caffe
./examples/hw2_GoogleNet/train_hw2_GoogleNet.sh
