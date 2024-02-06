#!/bin/bash

TOKEN=.token
[ ! -f "$TOKEN" ] && echo "Error: Please provide OpenAI Key in file $TOKEN" && exit 1

# The access token to perform operations on the account.
OPENAI_API_KEY=$(cat .token)

DEBUG=false

# Call OpenAI /chat/completions endpoint.
# This request makes use of our API key and provides a structured JSON
# payload to the endpoint that describes both system and user roles.
#
# $1 System role text explains to the AI how it should behave
# $2 User role text asks the question that the AI should respond to
call() {
	MESSAGE=$(jq -n --arg systemMsg "$1" --arg userMsg "$2" '{ "model": "gpt-3.5-turbo", "messages": [ { "role": "system", "content": $systemMsg }, { "role": "user", "content": $userMsg } ] }')
	RESPONSE=$(curl -s https://api.openai.com/v1/chat/completions \
		-H "Content-Type: application/json" \
		-H "Authorization: Bearer $OPENAI_API_KEY" \
  		-d "$MESSAGE")
  	if [ "$DEBUG" == "true" ]; then
  		echo "$RESPONSE"
  	fi
	echo $RESPONSE | jq -r .choices[0].message.content	
}