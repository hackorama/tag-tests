# cycles through a set of rotated test images named (R|L)0-360.jpg

if [ $# -ne 2 ]
then
	echo "${0}: missing arguments"
	echo "Usage: ${0} test_binary test_images_directory"
	exit
fi

BINARY="$1"
IMG="$2"

date
for TEST in `ls ${IMG}`
do
	echo "${TEST}"
	${BINARY} ${IMG}/${TEST}
	echo " "
done
date
