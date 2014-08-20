# create right and left 360 degree rotations named (R|L)0-360.jpg
#

if [ $# -ne 2 ]
then
        echo "${0}: missing arguments"
        echo "Usage: ${0} the_base_image  test_images_directory"
        exit
fi

BASE="$1"
IMG="$2"

ANGLE=0
LIMIT=360
INCREMENT=1

date
while [ $ANGLE -lt $LIMIT ]
do
	TEST="$IMG/R${ANGLE}.jpg"
	cp $BASE ${TEST}
	convert -rotate ${ANGLE} ${TEST} ${TEST}

        echo "$TEST"

        TEST="$IMG/L${ANGLE}.jpg"
        cp $BASE ${TEST}
        convert -rotate -${ANGLE} ${TEST} ${TEST}

        echo "$TEST"

	ANGLE=`expr $ANGLE + $INCREMENT`
done
date

