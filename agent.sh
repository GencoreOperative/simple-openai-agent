#!/bin/bash

. config.sh

# The agent is an AI actor that is provided with a suite of tools to help it
# complete a request from a user. The AI actor needs to be given a persona
# that provides the context in which it will operate. This personal 
# instruction should also define the operations it can perform.

# STOP <reason>: The agent has completed the task and has no further actions 
# to perform or when the agent encounters an error and cannot recover.

PERSONA=$(cat persona.txt)

# We will create a loop where we will interact with the AI. Each interaction
# will either be the first, and therefore includes the prompt from the user
# or it will be a subsequent iteration. In this case we will include the
# previous message log.

PANTRY_ACTION="PANTRY"
STOP_ACTION="STOP"

LOG=log.txt
[ -f "$LOG" ] && rm $LOG
touch $LOG;

# Populate the chat log with the initial question
echo "$1" >> $LOG

while ( true ); do

	RESPONSE=$(call "$PERSONA" "$(cat $LOG)")
	echo "$RESPONSE" >> $LOG
	
	# Pantry question
	if [[ $RESPONSE == "$PANTRY_ACTION"* ]]; then
		QUESTION="${RESPONSE#$PANTRY_ACTION}"
		echo RESPONSE $(bash pantry.sh "$QUESTION") >> $LOG
	fi
	
	if [[ $RESPONSE == "$STOP_ACTION"* ]]; then
		break
	fi

done