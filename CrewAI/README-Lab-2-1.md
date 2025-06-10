
# Lab 2: Part 1: Develop the Loyalty Specialist in WX with CrewAI
---

In this session, you'll learn how to create an agent using **CrewAI** and **IBM Watsonx** to develop a custom loyalty program recommendations based on customer conversations.

## Prerequisites

- An API key for WX.
- A Project ID for WX.
- Watsonx URL

Check the [Lab-2-FAQ](./README-Lab-2-FAQ.md) for detailed steps on how to obtain these credentials.

## Steps to Develop

1. **Load Notebook**  
	- Load the notebook [Loyalty Specialist Agent](https://github.ibm.com/skol-assets/watsonx-ai-agents-class/blob/main/lab2/Loyalty%20Specialist%20Agent.ipynb) into your project.


2. **Define the AI Model** 


	- Set up an AI model from **IBM Watsonx**. For this starter notebook, we will use `Llama-3` to process customer history and generate responses. Feel free to experiment with the model and adjust its parameters as needed.


3. **Create AI Agents** 

	- Create two agents, each with a specific task:

		1. **Loyalty Specialist**: This agent analyzes customer conversation history and recommends the best loyalty programs based on the data provided. Its task is to identify the most suitable loyalty program for the customer.
  
		2. **Writer**: This agent generates friendly, conversational responses while promoting benefits from Lynder Bank. It will use the output from the **Loyalty Specialist** agent to craft a conversational response that highlights the recommended loyalty programs in an engaging way.


4. **Create the Crew and Run the Workflow** 


	- Once the agents and tasks are defined, we will combine them into a `Crew` and run the workflow to generate AI-driven responses based on customer conversations.

	- Experiment with Different Inputs  

		- Test how the Agnet response by inputting different customer conversation histories. Experiment with various user preferences, spending habits, and interests to see how the system responds.




## Next Steps  

- **Enhance the Crew for a Conversational Output**: Improve the output furhter to sound more human-like, natural, and engaging. Consider updating the Writer agent or adding additional agents to ensure the final output has a relaxed tone, making the interactions feel more authentic and engaging.


- **Wrap the Code into a Callable Python Function**: Organize the code into a reusable, callable Python function so that it can be easily invoked for different customer profiles or scenarios.




### Congratulations on completing the 1st part of lab-2! 👏👏👏


