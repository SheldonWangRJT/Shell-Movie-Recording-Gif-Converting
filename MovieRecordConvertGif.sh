#/bin/sh
rv () {
	if [ -z "$1" ]
	then
	  	echo "No video name is given, will store video as ~/Desktop/in.mov"
	  	xcrun simctl io booted recordVideo ~/Desktop/in.mov
	else
	 	NAME=$1
		echo "Got video name, no file extension is needed. Will store video as ~/Desktop/${NAME}.mov"
		xcrun simctl io booted recordVideo ~/Desktop/${NAME}.mov
	fi
}

cg () {
	usage() { 
		echo "Usage: $0"
		echo "[-s start time, default 00:00:00, watch format]"
		echo "[-t end time, default null, watch format]"
		echo "[-n input video name, default in.mov]"
		echo "[-st <1|2>], 1, for iPhone7, 2 for iPhoneX, default 1]"
		echo "[-r frame rate, default 8, use frame rate to adjust output file size]"
	}

	s="00:00:00"
	n="in.mov"
	st="1"
	r="10"
	while getopts ":s:t:n:sy:r:h" o; do
		case "${o}" in
			s)
				s=${OPTARG}
				;;
			n)
				n=${OPTARG}
				;;
			st)
				st=${OPTARG}
				((st == 1 || st == 2)) || usage
				;;
			r)
				r=${OPTARG}
				;;
			t)
				t=${OPTARG}
				;;				
			h)
				usage
				;;
		esac
	done
	shift $((OPTIND-1))

	if (( st == 1 )); then
		echo "Choosing regular screen scale as 512:909"
		ratio="512:909"
	else
		echo "Chossing iPhoneX screen scale as 512:1024"
		ratio="512:1024"
	fi
	
	if [ -z "${t}" ]; then
		ffmpeg -ss "${s}" -i ~/desktop/"${n}" -pix_fmt rgb8 -r "${r}" -vf scale="${ratio}"  output.gif && gifsicle -O3 output.gif -o output.gif && mv output.gif ~/desktop/
	else
		ffmpeg -ss "${s}" -t ${t} -i ~/desktop/"${n}" -pix_fmt rgb8 -r "${r}" -vf scale="${ratio}"  output.gif && gifsicle -O3 output.gif -o output.gif && mv output.gif ~/desktop/
	fi
	
	echo "Used paprams:"
	echo "starting time = ${s}"
	echo "end time = ${t}"
	echo "input file name = ${n}"
	echo "screen type = ${st}"
	echo "frame rate = ${r}"
	echo "ratio = ${ratio}"
	
	echo "Gif is stored as ~/Desktop/output.gif 🤡 🤡 🤡 "
}
