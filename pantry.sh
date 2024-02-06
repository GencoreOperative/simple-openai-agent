#!/bin/bash

. config.sh

# This script is a demonstration of using ChatGPT to answer a specific question
# that does not require a chat history. In this case, we are providing a fixed 
# amount of information in the system prompt and will then use ChatGPT to work
# with that fixed information to determine the answer.

call "You are pantry bot and will answer questions about what is stored in the pantry. We have eggs, ham, milk, and cheese." "$1"