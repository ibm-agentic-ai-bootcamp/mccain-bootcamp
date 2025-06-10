In this lab, we will build an HR agent in watsonx Orchestrate,
leveraging tools and external knowledge to connect to a simulated Human
Capital Management System. This agent retrieves relevant information
from documents to answer user queries and allows users to view and
manage their profiles.

**This lab uses a simulator for a Human Capital Management system.
However, this could be easily changed to any real system running in
production such as Workday, SAP SuccessFactors, or others.**

## Table of Contents

- [Use case description](#use-case-description)
- [Architecture](#architecture)
- [Pre-requisites](#pre-requisites)
- [Step by step instructions to build the HR
  Agent](#step-by-step-instructions-to-build-the-hr-agent)

## Use Case Description

One of the main challenges faced by any big organization is their HR
operations management. As companies grow in size, it becomes
increasingly difficult to get information faster and execute tasks with
ease. With the advent of Agentic systems, and the power or reasoning
models, it becomes easier to have a single entry point for doing mostly
every HR operation.

This use case targets developing and deploying an AskHR agent leveraging
IBM watsonx Orchestrate, as depicted in the provided architecture
diagram. This agent will empower employees to interact with HR systems
and access information efficiently through conversational AI.

## Architecture

To streamline employee interactions with HR systems, we have designed an
AI-driven AskHR agent using IBM watsonx. This solution leverages a
multi-agent orchestration model that ensures intelligent reasoning,
seamless action execution, and a responsive experience for employees.
The architecture is built with watsonx Orchestrate enabling the HR agent
to manage a wide range of HR-related queries and requests efficiently.

#### *Key capabilities of the AskHR agent:*

1.  Automates routine HR tasks like checking leave balance, requesting
    time off, and updating employee details.

2.  Enables natural interaction between employees and backend HR systems
    through an intuitive app interface.

3.  Uses reasoning and tools to fetch or update information securely and
    reliably.

4.  Seamlessly integrates with internal systems using OpenAPI
    connectors.

5.  This system leverages watsonx Orchestrate for coordination and
    advanced reasoning and web-based tasks, offering a comprehensive
    AI-powered HR support experience.

<img
src="./Lab1 - Orchestrate Agent Builder/attachments/AskHR - Lab Instruction/9d276e6c9ad6492e1e136e394744fc15a6629f27.png"
style="width:6.5in;height:4.07292in" />Architecture Components

- **HR Agent and App (IBM watsonx Orchestrate)**: The HR agent acts as
  the central orchestrator, managing user interactions and delegating
  tasks to appropriate tools in the HR App.

It has a collection of reusable tools, RAG agent powered by OpenAPI and
metadata descriptions. Each tool is designed to perform a specific
HR-related task, such as: Checking time-off balances Submitting time-off
requests Updating personal details (business title, home address)

RAG Agent retrieves relevant information from documents to answer user
queries

- **Human Capital Management (HCM) System**: The HR app communicates
  with the underlying HCM system to fetch or update employee data,
  ensuring real-time synchronization and accuracy.

## Pre-requisites

- Check with your instructor to make sure **all systems** are up and
  running before you continue.
- Validate that you have access to the right techzone environment for
  this lab.
- Validate that you have access to a credentials file that you
  instructor will share with you before starting the labs.

## Step by step instructions to build the HR Agent:

1.  Go to IBM Cloud (<https://cloud.ibm.com>) and make sure you are in
    the right account which has been reserved for you at the top right
    of the screen. Once it’s checked, click on the Resource list icon
    shown on the left side bar.

<img
src="./Lab1 - Orchestrate Agent Builder/attachments/AskHR - Lab Instruction/7febfc20c2729d4c9c500c28cac9ef25a6e8a62b.png"
style="width:6.5in;height:2.91667in" />

<img
src="./Lab1 - Orchestrate Agent Builder/attachments/AskHR - Lab Instruction/f28c8916e604f41c42a0ad4d499bafcc751bb7ec.png"
style="width:6.5in;height:4.59375in" />

1.  Under AI / Machine Learning, find and click on the watsonx
    Orchestrate instance.

<img
src="./Lab1 - Orchestrate Agent Builder/attachments/AskHR - Lab Instruction/387dd6253429bac06e2e613f8da90f321cc17107.png"
style="width:6.5in;height:3.14583in" />

1.  Launch watsonx Orchestrate.

<img
src="./Lab1 - Orchestrate Agent Builder/attachments/AskHR - Lab Instruction/fdefb1c26b80783745d5ed32ddfad7a1b63ad75c.png"
style="width:6.5in;height:4.38542in" />

1.  When you launch watsonx Orchestrate, you’ll be directed to this
    page. Click on the hamburger menu in the top left corner:

<img
src="./Lab1 - Orchestrate Agent Builder/attachments/AskHR - Lab Instruction/7064a8e705597bd63747d0c2ec21701b112f6efb.png"
style="width:6.5in;height:4.4375in" />

1.  Click on the down arrow next to **Build**. Then click on **Agent
    Builder**:

<img
src="./Lab1 - Orchestrate Agent Builder/attachments/AskHR - Lab Instruction/939747f0a90d0324450ee1c4ea1268f2d7d4ab35.png"
style="width:6.5in;height:3.625in" />

1.  Click on **Create agent +**:

<img
src="./Lab1 - Orchestrate Agent Builder/attachments/AskHR - Lab Instruction/c1110321acd44b83554860e951764ce8975b276b.png"
style="width:6.5in;height:3.95833in" />

1.  Select “Create from scratch”, give your agent a name, e.g. “HR
    Agent”, and fill in the description as shown below:

<!-- -->

    You are an agent who handles employee HR queries.  You provide short and crisp responses, keeping the output to 200 words or less.  You can help users check their profile data, retrieve latest time off balance, update title or address, and request time off. You can also answer general questions about company benefits.

Click on **Create**:

<img
src="./Lab1 - Orchestrate Agent Builder/attachments/AskHR - Lab Instruction/780681e8120eefe859da3c1e7ab67a2edac034c0.png"
style="width:6.5in;height:3.70833in" />

1.  Scroll down the screen to the **Knowledge** section. Copy the
    following description into the **Knowledge Description** section:

<!-- -->

    This knowledge base addresses the company's employee benefits, including parental leaves, pet policy, flexible work arrangements, and student loan repayment.

Click on **Upload files**:

<img
src="./Lab1 - Orchestrate Agent Builder/attachments/AskHR - Lab Instruction/2851a3cf1c49197303310e905146b626de8c4988.png"
style="width:6.5in;height:6.05208in" />

1.  Drag and drop the Employee Benefits.pdf and click on **Upload**:

<img
src="./Lab1 - Orchestrate Agent Builder/attachments/AskHR - Lab Instruction/8dbf60cda99e7b7457274369f56ed0c7471d462d.png"
style="width:6.5in;height:2.38542in" />

1.  Wait until the file has been uploaded successfully and double check
    that it is now shown in the Knowledge section:

<img
src="./Lab1 - Orchestrate Agent Builder/attachments/AskHR - Lab Instruction/27850e436024ae7dd92744243a844a8714c691ed.png"
style="width:6.5in;height:5.57292in" />

1.  Scroll down to the **Toolset** section. Click on **Add tool +**:

<img
src="./Lab1 - Orchestrate Agent Builder/attachments/AskHR - Lab Instruction/1f040485d020017d2465a737d68dd05d82d7a5a9.png"
style="width:6.5in;height:3.76042in" />

1.  Select **Import**:

<img
src="./Lab1 - Orchestrate Agent Builder/attachments/AskHR - Lab Instruction/c35887ff2035706d2933d5bd5eb8e8a5bf488256.png"
style="width:6.5in;height:3.75in" />

1.  Drag and drop or click to upload the
    - **hr.yaml** file if you are using Mac device
    - **hr.json** file if you are using Window device

> (provided by your instructor)
>
> then click on **Next**:

<img
src="./Lab1 - Orchestrate Agent Builder/attachments/AskHR - Lab Instruction/456d39a795a56c39884c0248089249219f6bc302.png"
style="width:6.5in;height:3.46875in" />

1.  Select all the operations and click on **Done**:

<img
src="./Lab1 - Orchestrate Agent Builder/attachments/AskHR - Lab Instruction/21fd9c38d47d3c459f8bfe8560b0e746bc408db5.png"
style="width:6.5in;height:3.42708in" />

1.  Scroll down to the **Behavior** section. Insert the instructions
    below into the **Instructions** field:

<!-- -->

    Use your knowledge base to answer general questions about employee benefits. 

    Use the tools to get or update user specific information.

    When user asks to show profile data or check time off balance or update title/address or request time off for the very first time, first ask the user for their name, then invoke the tool and then use the same name in the whole session without asking for the name again.

    When the user requests time off, convert the dates to YYYY-MM-DD format, e.g. 5/22/2025 should be converted to 2025-05-22 before passing the date to the post_request_time_off tool.

<img
src="./Lab1 - Orchestrate Agent Builder/attachments/AskHR - Lab Instruction/4ee155e8263a68ea8cd342f22079653afb6b1894.png"
style="width:6.47916in;height:6.5in" />

1.  Test your agent in the preview chat on the right side by asking the
    following questions and validating the responses. They should look
    similar to what is shown in the screenshots below:  
      
    When you are asked for your name, you can only use the name below
    which exist in the database:
    - Daniel Anderson
    - William Frazier
    - Danielle Hall
    - Jacob Graham
    - Jessica West
    - Victoria Baker
    - Kathleen Fowler
    - Tracy Melton
    - Allison Stevens
    - Curtis Hunter
    - Frank Melendez
    - James Davies

> **Note**: Using names outside this will result in errors or
> exceptions.

    1. What is the pet policy? 

    2. Show me my profile data.

    3. I'd like to update my title. 

    4. Update my address

    5. What is my time off balance?

    6. Request time off

    7. Show my profile data.

<img
src="./Lab1 - Orchestrate Agent Builder/attachments/AskHR - Lab Instruction/718993c2abc04f184d82a8afa5a42dc625af60ba.png"
style="width:6.5in;height:3.09375in" />

<img
src="./Lab1 - Orchestrate Agent Builder/attachments/AskHR - Lab Instruction/e927af303eab4e1ea40ba2865ea6e21fdfe1a0b2.png"
style="width:6.60597in;height:8.98066in" />

<img
src="./Lab1 - Orchestrate Agent Builder/attachments/AskHR - Lab Instruction/145fbe06176bdc1d63196b0c749546d2f51a2a20.png"
style="width:6.5in;height:5.20834in" />

<img
src="./Lab1 - Orchestrate Agent Builder/attachments/AskHR - Lab Instruction/fe0de5b4cd014c11e50e3dca353d311de23dbd72.png"
style="width:6.6518in;height:8.47087in" />

1.  Once you have validated the answers, click on **Deploy** in the top
    right corner to deploy your agent:

<img
src="./Lab1 - Orchestrate Agent Builder/attachments/AskHR - Lab Instruction/1f7302211a53cd7a5a9d2335902d470335d6de30.png"
style="width:6.5in;height:4.125in" />

1.  Click on the hamburger menu in the top left corner and then click on
    **Chat**:

<img
src="./Lab1 - Orchestrate Agent Builder/attachments/AskHR - Lab Instruction/daf794950cc3669765ad5ac921d8a733fd4aa3a2.png"
style="width:6.5in;height:2.94792in" />

1.  Make sure **HR Agent** is selected. You can now test your agent:

<img
src="./Lab1 - Orchestrate Agent Builder/attachments/AskHR - Lab Instruction/14eaf9b0ea8479aee1fd9e91791398451178dde0.png"
style="width:6.5in;height:4.30208in" />

Congratulations! You now have completed the process of creating and
deploying your first agent!
