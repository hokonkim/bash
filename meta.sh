mapfile -t activities < activities.txt

mesh_path="inputs/*.inp"
mesh_files=($mesh_path)

output_path="outputs/test/"
for ((i=0;i<${#activities[@]};i++));
do

	mesh_fname="${mesh_files[i]}"
	tpb_act="${activities[i]}"
	fbasename="$(basename $mesh_fname)"
	output_fbase="${output_path}${fbasename%.*}"

#echo "${mesh_fname}"
#echo "${tpb_act}"
#echo "${output_fbase}"

export mesh_fname
export tpb_act
export output_fbase

sbatch ermine-job.sh
done
