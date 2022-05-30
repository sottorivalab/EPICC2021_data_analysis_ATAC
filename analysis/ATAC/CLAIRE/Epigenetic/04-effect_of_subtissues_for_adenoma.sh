#!/bin/sh
#SBATCH -n 2
#SBATCH -N 1
#SBATCH --time=80:00:00
#SBATCH --job-name=fit_region
#SBATCH -o launch_scripts/cluster_logs/fit_region_%a_%j.log 
#SBATCH --mem-per-cpu=7900MB
#SBATCH --array=25-34

patient=`head -n ${SLURM_ARRAY_TASK_ID} analysis/ATAC/CLAIRE/Epigenetic/input_data/patients.txt | tail -1`

Rscript analysis/ATAC/CLAIRE/Epigenetic/04-ATAC_regional_recurrent_peaks_deseq_LRT.R \
  ${patient} \
  ~purity+sample_type+subtissue \
  ~purity+sample_type \
  effect_of_subtissue_nfreads_LRT
