# Lab 2: Loyalty Specialist Agent (Built and Deployed with Watsonx.ai via Python SDK)

---

## Overview

This lab provides comprehensive guidelines for building and deploying a **Loyalty Specialist Agent**. The solution is designed to offer personalized credit card and membership recommendations based on customer conversation history. It leverages **IBM watsonx.ai** and **CrewAI** to develop, test, and deploy the AI agent as a scalable service.

The lab is divided into two parts:

1. **[Developing the Loyalty Specialist Agent](./README-Lab-2-1.md)** – This section covers how to build a multi-agent system using CrewAI to provide personalized loyalty offers.
2. **[Deploying the Loyalty Specialist Agent](./README-Lab-2-2.md)** – This section covers the process of deploying the CrewAI agent to Watsonx.ai.

Together, these steps will provide an end-to-end solution for creating and deploying an intelligent loyalty agent that tailors recommendations based on customer profiles, such as age, hobbies, spending habits, and existing memberships.

## Key Features

- **Multi-Agent Collaboration**: Utilizes CrewAI to build a team of specialized agents, generating engaging and context-aware conversations.
- **Scalable Deployment**: Deploys the agent as an AI service using IBM watsonx.ai, allowing seamless integration into enterprise systems.

## Usage

If you have not used Jupyter notebooks before, you can download the notebooks to your local machine and follow [these steps](https://github.ibm.com/skol-assets/watsonx-ai-agents-class/blob/main/lab2/README-Lab-2-1.md#step-1-load-the-notebook-to-watsonx-studio).

You will need to get these variables before you run the notebooks:

- `os.environ['WATSONX_APIKEY']  = "YOUR API KEY"`
  - Go here to generate your key https://cloud.ibm.com/iam/apikeys
- `os.environ['WATSONX_PROJECT_ID'] = "YOUR PROJECT ID"`
  - Go to your project -> Manage - > General
- `os.environ['WX_URL']  = "YOUR URL"`
  - "https://us-south.ml.cloud.ibm.com"
- `os.environ['WX_SPACE_ID']  = "YOUR SPACE ID"`
  - From Lab 1 open your deoplyment, click on it and get space id (we will use the same space id as in Lab 1)

For more info on how to get these values, click [here](https://github.ibm.com/skol-assets/watsonx-ai-agents-class/blob/main/lab2/README-Lab-2-FAQ.md).

Now you are ready to explore the notebooks:

  - Start with **[Loyalty Specialist Agent.ipynb](https://github.ibm.com/skol-assets/watsonx-ai-agents-class/blob/main/lab2/Loyalty%20Specialist%20Agent.ipynb)** to build and test the agent. To better understand the steps on this notebook, click [here](https://github.ibm.com/skol-assets/watsonx-ai-agents-class/blob/main/lab2/README-Lab-2-1.md).
  - Then proceed with **[Deploy Loyalty Specialist.ipynb](https://github.ibm.com/skol-assets/watsonx-ai-agents-class/blob/main/lab2/Deploy%20Loyalty%20Specialist.ipynb)** to deploy the agent as an AI service. To better understand the steps on this notebook, click [here](https://github.ibm.com/skol-assets/watsonx-ai-agents-class/blob/main/lab2/README-Lab-2-2.md).

