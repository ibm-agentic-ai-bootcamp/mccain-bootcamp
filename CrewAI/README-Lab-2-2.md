# Lab 2: Part 2: Deploy the Loyalty Specialist in WX
---

In this session, you'll learn how to deploy the **Loyalty Specialist** that you developed in [Lab-2-1](./README-Lab-2-1.md).

## Prerequisites

- An API key for WX.
- A Deployment space ID for WX.

Check the [Lab-2-FAQ](./README-Lab-2-FAQ.md) for detailed steps on how to obtain these credentials.

## Steps to Deploy

1. **Load Notebook**  
    - Load the notebook [Deploy Loyalty Specialist](https://github.ibm.com/skol-assets/watsonx-ai-agents-class/blob/main/lab2/Deploy%20Loyalty%20Specialist.ipynb) into your project.

3. **Setting Up Environment Variables**  
    - Set up your environment variables for the API keys, project credentials, and deployment space ID.

4. **Creating a Deployable AI Service**  
   - Insall and import the necessary libraries.
   - Incorporate the developed agent from [Lab-2-1](./README-Lab-2-1.md) for the **Loyalty Specialist** as deoployable service.

5. **Testing the Deployment Function**  
    - Use the `RuntimeContext` to test the deployment function with a sample conversation history.

6. **Deploy the Function**  
   - Set up a YAML configuration for deployment.
   - Deploy the service to WX using your deployment configuration.

7. **Testing the Deployment**  
    - After succesfull deployment, you can test the deployed AI service with different conversation history to ensure the agent is working as expected.


### Congratulations on completing the full lab 2! 👏👏👏
