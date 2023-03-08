#!/bin/bash
#SBATCH --job-name=vira_training
#SBATCH --open-mode=append
#SBATCH --output=./%j_%x.out
#SBATCH --error=./%j_%x.err
#SBATCH --export=ALL
#SBATCH --time=01:00:00
#SBATCH --gres=gpu:1
#SBATCH --mem=64G
#SBATCH -c 4

singularity exec --nv --overlay /scratch/js11531/VIRA/overlay-5GB-3.2M.ext3:ro /scratch/work/public/singularity/cuda11.6.124-cudnn8.4.0.27-devel-ubuntu20.04.4.sif  /bin/bash -c "

source /ext3/env.sh
conda activate vira

cd $SCRATCH/VIRA/vira-intent-discovery/

sh ./train.sh
"
