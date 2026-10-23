#!/bin/bash

PERSON1=Ramesh
PERSON2=Suresh

echo "$PERSON1:: Hello $PERSON2, How are you ?"
echo "$PERSON2:: Hey $PERSON1, Im good. How are you ?"

START_TIME=$(date +%s)
echo "Activity is started.."
sleep 3
echo "Activity is in progress.."
sleep 3
echo "Activity is complete!"
END_TIME=$(date +%s)

TOTAL_TIME=$(($END_TIME-$START_TIME))

echo "Time taken for the activity in sec is: ${TOTAL_TIME}"
