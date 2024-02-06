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