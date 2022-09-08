#================PTX & SASS
PTX="/home/wwr/Desktop/EXEs/PTXs/ExeGM-accelwattch"
SASS="/home/wwr/Desktop/EXEs/SASSs/ExeGM-accelwattch"


for file in *.out;do
	ptxfilename="ptx"_$file".ptx"
	sassfilename="sass"_$file".sass"
    	cuobjdump $file -ptx > $PTX/$ptxfilename
	cuobjdump $file -sass > $SASS/$sassfilename
done
echo "<<<<<<<<<<dump source done>>>>>>>>>>"

