All the code can be found in ./src

- **preprocessing** : fetching the files, creating lmbds etc. Some of the generated files are also included in a subfolder
- **caffe_net/**, **caffe_net_2/**, **caffe_net_3/**, and **google_net/** : prototxts and shell scripts needed to train and deploy the respective model.
- **slurm_scripts/** : scripts to run the experiments on macerick GPUs.
- **logs/** : training logs
- **analysis/** : an ipython notebook used for testing trained models and generating confusion matrices