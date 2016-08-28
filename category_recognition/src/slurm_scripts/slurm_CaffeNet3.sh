#!/bin/bash

#SBATCH -A CS381V-Visual-Recogn
#SBATCH -n 20
#SBATCH -N 1
#SBATCH -p gpu
#SBATCH -t 12:00:00 
#SBATCH -e /work/04001/ashishb/maverick/logs/CaffeNet3.err 
#SBATCH -o /work/04001/ashishb/maverick/logs/CaffeNet3.out
#SBATCH -J hw2_CaffeNet3
#SBATCH --mail-user=ashish.bora@utexas.edu
#SBATCH --mail-type=all

echo job $JOB_ID execution at: `date`
NODE_HOSTNAME=`hostname -s`
echo "running on node $NODE_HOSTNAME"

# echo "Starting to tune the last layer"
echo -e "\n\nTraining CaffeNet3\n\n"
cd /work/04001/ashishb/maverick/caffe
./examples/CaffeNet3/train_hw2.sh
