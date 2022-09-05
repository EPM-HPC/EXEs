all: Profile

Profile:
	cd ExeGM-akhi-DM1;echo "ExeGM-akhi-DM1"; /bin/bash makestatistic.sh
	cd ExeGM-akhi-DM4;echo "ExeGM-akhi-DM4"; /bin/bash makestatistic.sh
	cd ExeGM; echo "ExeGM";	   /bin/bash makestatistic.sh
	cd ExeGM-akhi-DM2;echo "ExeGM-akhi-DM2"; /bin/bash makestatistic.sh
	cd ExeGM-akhi-stall;echo "ExeGM-akhi-stall"; /bin/bash  makestatistic.sh
	cd ExeGM-akhi-CE;echo "ExeGM-akhi-CE"; 	/bin/bash makestatistic.sh
	cd ExeGM-akhi-DM3;echo "ExeGM-akhi-DM3"; /bin/bash makestatistic.sh
	cd ExeGM-joao;echo "ExeGM-joao"; 		/bin/bash makestatistic.sh