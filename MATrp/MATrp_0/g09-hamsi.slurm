#!/bin/bash
#SBATCH -p hamsi
#SBATCH -A eraksoy
#SBATCH -J gauss09-test
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=28
#SBATCH --time=3-00:00:00
#SBATCH --workdir=/truba_scratch/eraksoy/students/toxic/OPT/MATrp/
#SBATCH --output=slurm-%j.out
#SBATCH --error=slurm-%j.err

export g09root=/truba/home/eraksoy/apps
export GAUSS_SCRDIR=/tmp/$SLURM_JOB_USER/g09.$SLURM_JOB_ID
. $g09root/g09/bsd/g09.profile

if [ -d "$GAUSS_SCRDIR" ]
then
rm -rf $GAUSS_SCRDIR
else
mkdir -p $GAUSS_SCRDIR
fi

$g09root/g09/g09 < /truba_scratch/eraksoy/students/toxic/OPT/MATrp/MATrp_OptFreq.gjf

rm -rf $GAUSS_SCRDIR

exit
