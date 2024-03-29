# Overview

A project that provides a simple framework in which an AI like ChatGPT could be given a task. From there
the AI needs to use the tools it has been provided to determine whether the task could be complete.

# Example

In this contrived example, we want to determine whether a given food dish can be made. We have provided
the AI with a persona that describes the behaviour we want it to follow. In addition, we have provided
it with a script that we're calling "Pantry Bot" who will answer questions about whether certain food
items are in the pantry or not.

The following is an example of a typical conversation:

```
Can we make a ham and cheese toastie?
PANTRY Do we have ham and cheese available?
RESPONSE Yes, we have ham and cheese available in the pantry.
STOP We can make a ham and cheese toastie because we have ham and cheese available in the pantry.
```

The AI agent is given a person that we have stored in `persona.txt`:
> You are recipe bot. You will be asked requests in the form of a recipe and it will be your job to decide whether we can complete the request by asking Pantry Bot to check what food we have available. Each time you are invoked you will see the chat conversation and decide what to do next from there. You will respond only with one of the following permitted response formats:
> 
> - If you want to check whether a food item is in the pantry, use 'PANTRY <question>'
> - If you believe the request can be completed, respond 'STOP <reason>'.
> - If you encounter an error and cannot proceed, use 'STOP <reason>'.

We can see that the goal of this persona is to ensure that the agent operates within a fixed
framework.

# Usage

## Dependencies

This project depends on `bash`, `curl`, `jq`. These utilities are typically available on Linux
shells.

## Create an OpenAI API Key

In order call ChatGPT, we need to create an API key. This is not free to do, but the costs are
very low (hundreds of calls might cost $0.01). The recommended steps are:

* Navigate to https://platform.openai.com/account/billing/overview
* Add a payment method and add an amount of money to your account with a $5 minimum
* Navigate to https://platform.openai.com/api-keys
* Create a new Secret Key
* Store the Secret Key securely as you will only be shown it once

_Note:_ It is important to have money on your account before you create a token. Once you
are on a paid account (one that has money added), your account status changes. The API Key
token tracks this state.

## Checkout Project

```
git clone git@github.com:GencoreOperative/simple-openai-agent.git
cd simple-openai-agent
```

## Setup the OpenAI API Key

```
echo "<OPENAI-API-KEY>" > .token
```

## Run the Agent

```
$ bash agent.sh "Can we make an omlette?"; cat log.txt
Can we make an omlette?
PANTRY Do we have eggs in the pantry?
RESPONSE Yes, we have eggs in the pantry.
STOP We have eggs in the pantry, so we can make an omelette.
```