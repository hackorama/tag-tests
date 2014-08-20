# cycles through a set of rotated test images named (R|L)0-360.jpg

if [ $# -lt 2 ]
then
	echo "${0}: missing arguments"
	echo "Usage: ${0} test_binary test_images_directory"
	exit
fi

BINARY="$1"
IMG="$2"
ARGS="$3 $4 $5 $6"
BASE="${IMG}/123456789013.jpg"
EXPECTED=`cat ${IMG}/expected.txt`

ANGLE=0
LIMIT=360
INCREMENT=1

PASSCOUNT=0
FAILCOUNT=0
COUNT=0

date
while [ $ANGLE -lt $LIMIT ]
do
	# TEST="R${ANGLE}.jpg"
	# cp $BASE ${TEST}
	# convert -rotate ${ANGLE} ${TEST} ${TEST}

	TEST="${IMG}/R${ANGLE}.jpg"
	RESULT=`${BINARY} ${TEST} ${ARGS}`
	COUNT=`expr $COUNT + 1`
	if [ $RESULT -eq $EXPECTED ] 
	then
		PASSCOUNT=`expr $PASSCOUNT + 1`
        	echo "R${ANGLE} $RESULT PASS $PASSCOUNT/$COUNT"
	else
		FAILCOUNT=`expr $FAILCOUNT + 1`
        	echo "R${ANGLE} $RESULT FAIL $FAILCOUNT/$COUNT"
        fi

        # TEST="L${ANGLE}.jpg"
        # cp $BASE ${TEST}
        # convert -rotate -${ANGLE} ${TEST} ${TEST}

        TEST="${IMG}/L${ANGLE}.jpg"
        RESULT=`${BINARY} ${TEST} ${ARGS}`
	COUNT=`expr $COUNT + 1`
        if [ $RESULT -eq $EXPECTED ]
        then
		PASSCOUNT=`expr $PASSCOUNT + 1`
        	echo "L${ANGLE} $RESULT PASS $PASSCOUNT/$COUNT"
	else
		FAILCOUNT=`expr $FAILCOUNT + 1`
        	echo "L${ANGLE} $RESULT FAIL $FAILCOUNT/$COUNT"
        fi

	ANGLE=`expr $ANGLE + $INCREMENT`
done
date
