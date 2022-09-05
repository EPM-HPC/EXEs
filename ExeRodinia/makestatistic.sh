SM1=(2002 1995 1987 1980 1972 1965 1957 1950 1942 1935 1927 1920 1912 1905 1897 1890 1882 1875 1867 1860 1852 1845 1837 1830 1822 1815 1807 1800)
SM2=(1792 1785 1777 1770 1762 1755 1747 1740 1732 1725 1717 1710 1702 1695 1687 1680 1672 1665 1657 1650 1642 1635 1627 1620 1612 1605)
SM3=(1597 1590 1582 1575 1567 1560 1552 1545 1537 1530 1522 1515 1507 1500 1492 1485 1477 1470 1462 1455 1447 1440 1432 1425 1417 1410 1402)
SM4=(1395 1387 1380 1372 1365 1357 1350 1342 1335 1327 1320 1312 1305 1297 1290 1282 1275 1267 1260 1252 1245 1237 1230 1222 1215 1207 1200)
SM5=(1192 1185 1177 1170 1162 1155 1147 1140 1132 1125 1117 1110 1102 1095 1087 1080 1072 1065 1057 1050 1042 1035 1027 1020 1012 1005)
SM6=(997 990 982 975 967 960 952 945 937 930 922 915 907 900 892 885 877 870 862 855 847 840 832 825 817 810 802)
SM7=(795 787 780 772 765 757 750 742 735 727 720 712 705 697 690 682 675 667 660 652 645 637 630 622 615 607 600)
SM8=(592 585 577 570 562 555 547 540 532 525 517 510 502 495 487 480 472 465 457 450 442 435 427 420 412)
SM=(2002 1995 1987 1980 1972 1965 1957 1950 1942 1935 1927 1920 1912 1905 1897 1890 1882 1875 1867 1860 1852 1845 1837 1830 1822 1815 1807 1800 1792 1785 1777 1770 1762 1755 1747 1740 1732 1725 1717 1710 1702 1695 1687 1680 1672 1665 1657 1650 1642 1635 1627 1620 1612 1605 795 787 780 772 765 757 750 742 735 727 720 712 705 697 690 682 675 667 660 652 645 637 630 622 615 607 600 592 585 577 570 562 555 547 540 532 525 517 510 502 495 487 480 472 465 457 450 442 435 427 420 412)


DATA_DIR=/home/wwr/Desktop/ExperimentDataProcess/Rodinia/data


PROGS=(backprop.out bfs.out euler3d.out dwt2d.out gaussian.out  heartwall.out  hotspot.out 3D.out pavle.out hybridsort.out  kmeans.out  lavaMD.out     leukocyte.out lud_cuda.out  mummergpu.out myocyte.out  nn.out needle.out   particlefilter_naive.out  particlefilter_float.out  pathfinder.out srad_v1.out srad_v2.out  sc_gpu.out )


CMDs=("./backprop.out 	209600" "./bfs.out 		$DATA_DIR/bfs/graph65536.txt" "./euler3d.out 	$DATA_DIR/cfd/missile.domn.0.2M  " "./dwt2d.out 	rgb.bmp -d 1024x1024 -f -5 -l 3" "./gaussian.out 	-f $DATA_DIR/gaussian/matrix4.txt" "./heartwall.out 	$DATA_DIR/heartwall/test.avi 20" "./hotspot.out 	512 2 2 $DATA_DIR/hotspot/temp_512 $DATA_DIR/hotspot/power_512 output.out" "./3D.out 		512 8 100 $DATA_DIR/hotspot3D/power_512x8 $DATA_DIR/hotspot3D/temp_512x8 output.out" "./pavle.out 	$DATA_DIR/huffman/test1024_H2.206587175259.in "
"./hybridsort.out 	r" "./kmeans.out 	-o -i $DATA_DIR/kmeans/kdd_cup " "./lavaMD.out 	-boxes1d 10" "./leukocyte.out 	../$DATA_DIR/leukocyte/testfile.avi 10" "./lud_cuda.out 	-s 256 -v" "./mummergpu.out 	$DATA_DIR/mummergpu/NC_003997.fna $DATA_DIR/mummergpu/NC_003997_q100bp.fna > NC_00399.out" "./myocyte.out 	100 1 0" "./nn.out 		filelist_4 -r 5 -lat 30 -lng 90"
"./needle.out 	2048 10" "./particlefilter_naive.out 		-x 128 -y 128 -z 10 -np 1000" "./particlefilter_float.out 		-x 128 -y 128 -z 10 -np 1000" "./pathfinder.out 			100000 100 20 > result.txt" "./srad_v1.out 			100 0.5 502 458					" "./srad_v2.out 			2048 2048 0 127 0 127 0.5 2			" "./sc_gpu.out 			10 20 256 65536 65536 1000 none output.txt 1 	")




# rodinia run data
DATA_DIR=/home/wwr/Desktop/ExperimentDataProcess/Rodinia/data



i=1

#================PTX & SASS
#PTX="/home/wwr/Desktop/EXEs/PTXs/ExeRodinia"
#SASS="/home/wwr/Desktop/EXEs/SASSs/ExeRodinia"


#for file in ${PROGS[@]};do
#	ptxfilename="ptx"_$file".ptx"
#	sassfilename="sass"_$file".sass"
#    	cuobjdump $file -ptx > $PTX/$ptxfilename
#	cuobjdump $file -sass > $SASS/$sassfilename
#done
#echo "<<<<<<<<<<dump source done>>>>>>>>>>"


#================PROFILE related
PROF="/home/wwr/Desktop/EXEs/PROFs/ExeRodinia/"
ncu_pre="sudo /usr/local/NVIDIA-Nsight-Compute/ncu --export "
ncu_param=" --force-overwrite --target-processes application-only --replay-mode kernel --kernel-name-base mangled --launch-skip-before-match 0 --section ComputeWorkloadAnalysis --section InstructionStats --section LaunchStats --section MemoryWorkloadAnalysis --section MemoryWorkloadAnalysis_Tables --section SpeedOfLight --sampling-interval auto --sampling-max-passes 5 --sampling-buffer-size 33554432 --profile-from-start 1 --cache-control all --clock-control none --apply-rules yes  --import-source yes  --check-exit-code yes"


for sm_freq in  ${SM[@]};do
    sudo nvidia-smi -lgc $sm_freq	
    for ((i=0;i<${#PROGS[@]};i++))do
	$ncu_pre $PROF"ncuprof_output_"${PROGS[$i]}"_freq_"$sm_freq $ncu_param ${CMDs[$i]} 
	echo "[*] profiling " ${PROGS[$i]} " at "$sm_freq "in level 1"
    done
done

echo "<<<<<<<<<<profile done>>>>>>>>>>"


#=================================================POWER related
PM="/home/wwr/Desktop/ExperimentDataProcess/GPU-Joule/nvml_power_monitor/example/power_monitor"
ENERGY="/home/wwr/Desktop/EXEs/ENERGYs/ExeRodinia/"

for sm_freq in  ${SM[@]};do	
        sudo nvidia-smi -lgc $sm_freq
        for ((i=0;i<${#PROGS[@]};i++))do
            efilename=$ENERGY"power_samples_"${PROGS[$i]}"_freq_"$sm_freq"_time_"$i".csv" 
            $PM 2 > $efilename &
            PM_PID=$!
            ${CMDs[$i]}  >/dev/null
            sleep 1
            kill -15 $PM_PID >/dev/null 
            sleep 1
            echo "[OK] power sampling "${PROGS[$i]}" at "$sm_freq " in level 1 for the "$i" times"
        done	
done
echo "<<<<<<<<<<power done>>>>>>>>>>"

