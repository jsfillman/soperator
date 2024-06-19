#!/bin/bash

#SBATCH --output=/home/bob/outputs/job.out
#SBATCH --nodes 2
#SBATCH --gres=gpu:nvidia_h100_80gb_hbm3:8
#SBATCH --ntasks=2
#SBATCH --cpus-per-task=4
#SBATCH --mem=8G

srun -N 2 hostname

srun --ntasks=2 --cpus-per-task=4 --gpus=8 nvidia-smi

srun -N 2 --mem=8G --gres=gpu:nvidia_h100_80gb_hbm3:8 --container-image="nvidia/cuda:12.2.2-base-ubuntu20.04" nvidia-smi
