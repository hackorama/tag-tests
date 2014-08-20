# Rerun a set of failed rotated image sets

if [ $# -ne 3 ]
then
        echo "${0}: missing arguments"
        echo "Usage: ${0} test_binary test_images_directory result_file_from_failed_run"
        exit
fi

BINARY=$1
IMG="$2"
RESULTFILE=$3 

EXPECTED=`cat ${IMG}/expected.txt`
ANGLE=0
LIMIT=360
INCREMENT=1
FAILCOUNT=0
COUNT=0

date
for FAILED in `grep FAIL ${RESULTFILE} | awk '{ print $1 }'`
do
	# TEST="R${ANGLE}.jpg"
	# cp $BASE ${TEST}
	# convert -rotate ${ANGLE} ${TEST} ${TEST}

	TEST="${IMG}/${FAILED}.jpg"
	RESULT=`${BINARY} ${TEST}`
	COUNT=`expr $COUNT + 1`
	if [ $RESULT -eq $EXPECTED ] 
	then
        	echo "${FAILED} $RESULT PASS"
	else
		FAILCOUNT=`expr $FAILCOUNT + 1`
        	echo "${FAILED} $RESULT  $FAILCOUNT/$COUNT FAIL "
        fi
done
date

