#!/bin/sh -l
#SBATCH -J test
#SBATCH -p bigmem
#SBATCH -N 8
#SBATCH -o logs/%j_%x.out
#SBATCH -e logs/%j_%x.err
#SBATCH --time 1:00:00

module load gnu/8.2.0 openmpi/3.1.3_gnu8.2 anaconda/2.7

echo "START"; date

mpirun --n 120 ./ermine-opt -i 191120_input_rev.i \
		   Mesh/file/file="${mesh_fname}" \
		   GlobalParams/s0="${tpb_act}" \
		   Outputs/file_base="${output_fbase}"

#echo "${mesh_fname}"
#echo "${tpb_act}"
#echo "${output_fbase}"

echo "END"; date
