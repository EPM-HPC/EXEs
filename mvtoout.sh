# for name in ExeGM-akhi-DM2    ExeGM-joao  ExeGM  ExeGM-akhi-DM3 ExePolybench ExeGM-akhi-CE   ExeGM-akhi-DM4    ExeRodinia    ExeGM-akhi-DM1  ExeGM-akhi-stall  ExeTango;
# do
# 	mkdir /home/wwr/Desktop/EXEs/PROFs/$name/CSV
# done

#	/usr/local/NVIDIA-Nsight-Compute/ncu --csv --page raw -i $file > CSV/$file.csv

#for file in ExeRodinia/*;do
#	mv $file $file.out
#done



# All Rodinia Run Command

DATA_DIR=/home/wwr/Desktop/ExperimentDataProcess/Rodinia/data


PROGS=(b+tree.out backprop.out bfs.out euler3d.out dwt2d.out gaussian.out  heartwall.out  hotspot.out 3D.out pavle.out hybridsort.out  kmeans.out  lavaMD.out     leukocyte.out lud_cuda.out  mummergpu.out myocyte.out  nn.out needle.out   particlefilter_naive.out  particlefilter_float.out  pathfinder.out srad_v1.out srad_v2.out  sc_gpu.out )


CMDs=("./b+tree.out 	file $DATA_DIR/b+tree/mil.txt command $DATA_DIR/b+tree/command.txt"  "./backprop.out 	2097152" "./bfs.out 		$DATA_DIR/bfs/graph65536.txt" "./euler3d.out 	$DATA_DIR/cfd/missile.domn.0.2M  " "./dwt2d.out 	rgb.bmp -d 1024x1024 -f -5 -l 3" "./gaussian.out 	-f $DATA_DIR/gaussian/matrix4.txt" "./heartwall.out 	$DATA_DIR/heartwall/test.avi 20" "./hotspot.out 	512 2 2 $DATA_DIR/hotspot/temp_512 $DATA_DIR/hotspot/power_512 output.out" "./3D.out 		512 8 100 $DATA_DIR/hotspot3D/power_512x8 $DATA_DIR/hotspot3D/temp_512x8 output.out" "./pavle.out 	$DATA_DIR/huffman/test1024_H2.206587175259.in "
"./hybridsort.out 	r" "./kmeans.out 	-o -i $DATA_DIR/kmeans/kdd_cup " "./lavaMD.out 	-boxes1d 10" "./leukocyte.out 	../$DATA_DIR/leukocyte/testfile.avi 10" "./lud_cuda.out 	-s 256 -v" "./mummergpu.out 	$DATA_DIR/mummergpu/NC_003997.fna $DATA_DIR/mummergpu/NC_003997_q100bp.fna > NC_00399.out" "./myocyte.out 	100 1 0" "./nn.out 		filelist_4 -r 5 -lat 30 -lng 90"
"./needle.out 	2048 10" "./particlefilter_naive.out 		-x 128 -y 128 -z 10 -np 1000" "./particlefilter_float.out 		-x 128 -y 128 -z 10 -np 1000" "./pathfinder.out 			100000 100 20 > result.txt" "./srad_v1.out 			100 0.5 502 458					" "./srad_v2.out 			2048 2048 0 127 0 127 0.5 2			" "./sc_gpu.out 			10 20 256 65536 65536 1000 none output.txt 1 	")


for ((i=0;i<${#PROGS[@]};i++))do
	echo ${CMDs[$i]}
done
