In this lab, you will register an **external agent** in watsonx
Orchestrate. The agent is built using LangGraph and deployed on
watsonx.ai as an AI Service Endpoint.

The agent, named Traffic Agent, uses a REST API call to retrieve
real-time traffic information for a given location. It was created with
the watsonx.ai LangGraph template.

<img src="./3-LangGraph/attachments/media/image1.png"
style="width:6in;height:2.82569in"
alt="A diagram of a company Description automatically generated" />

# Part 0: Before You Begin

Before deploying the agent, ensure that you have a User API key in the
watsonx.ai Runtime instance where you intend to deploy.

1.  Go to your watsonx.ai Runtime instance in IBM Cloud. [IBM
    Cloud](https://cloud.ibm.com/). Click the hamburger menu (☰) in the
    top left corner, then select **Resource List**.

<img src="./3-LangGraph/attachments/media/image2.png"
style="width:6.15933in;height:1.87728in" />

1.  Click on the instance name listed under the watsonx.ai Studio
    product.

<img src="./3-LangGraph/attachments/media/image3.png"
style="width:6in;height:3.17708in" />

1.  Click the arrow next to **Launch in**, then select **IBM watsonx**
    (you may be prompted to sign in again).

<img src="./3-LangGraph/attachments/media/image4.png"
style="width:6in;height:2.8125in" />

1.  Click the user icon in the top right corner and select **Profile and
    settings**.

<img src="./3-LangGraph/attachments/media/image5.png"
style="width:6in;height:2.01042in" />

1.  Go to the **User API key** tab. If you don’t already have a key,
    click **Create**.

<img src="./3-LangGraph/attachments/media/image6.png"
style="width:6in;height:3.125in" />

1.  Click on the Create button to create a new key. The new key will be
    listed as shown below. If you already have a key listed, you are
    good to go and don't need to do anything.

<img src="./3-LangGraph/attachments/media/image7.png"
style="width:6in;height:1.65181in" />

# Part 1: Setup Deployment Space for LangGraph Agent

To deploy the agent, you will need the following information to update
in a config.toml file later:

- the API key for your watsonx.ai instance

- the Space GUID for the deployment space where the deployed agent will
  go

- the watsonx.ai URL: <https://us-south.ml.cloud.ibm.com>

1.  For API key, click the hamburger menu at the top left corner, then
    choose A**ccess (IAM)**.

<img src="./3-LangGraph/attachments/media/image8.png"
style="width:6in;height:2.84377in" />

1.  Click the **API Keys**.

<img src="./3-LangGraph/attachments/media/image9.png"
style="width:6in;height:2.60417in" />

1.  Click the blue **Create +** button, name your API key, then click
    **Create.**

<img src="./3-LangGraph/attachments/media/image10.png"
style="width:6in;height:3.82292in" />

1.  Copy and save the API key in a notepad or download the API key json
    file.

<img src="./3-LangGraph/attachments/media/image11.png"
style="width:6in;height:2.69792in" />

1.  For the Space GUID, go back to the **watsonx.ai instance** like what
    you did in step 1 – 3 (or use this link
    <https://dataplatform.cloud.ibm.com> ). Then click the hamburger
    menu button and choose **Deployments -&gt; View all deployment
    spaces**.

<img src="./3-LangGraph/attachments/media/image12.png"
style="width:6in;height:2.3125in" />

1.  Click **New deployment space +** .

<img src="./3-LangGraph/attachments/media/image13.png"
style="width:6in;height:2.41667in" />

1.  Give a name for the deployment space, in Watson Machine learning,
    select the only option (wml-itz-wxo.xxxx) , then click **Create.**

<img src="./3-LangGraph/attachments/media/image14.png"
style="width:5.75in;height:3.01042in" />

1.  Once created, click **View new space**, go to the **Manage** tab,
    copy and save the Space GUID.

<img src="./3-LangGraph/attachments/media/image15.png"
style="width:6in;height:3.28125in" />

# 

# Part 2: Prepare the agent 

Now we are going to download the source code for the LangGraph agent and
ready to deploy to watsonx.ai Runtime.

1.  In the material zip file, find the langgraph-react-agent.zip file
    and unzip the file.

2.  Open your VSCode, open the folder where you unzipped the
    langgraph-react-agent file, then use your terminal to run the
    command below:

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr>
<th>cp config.toml.example config.toml</th>
</tr>
</thead>
<tbody>
</tbody>
</table>

<img src="./3-LangGraph/attachments/media/image16.png"
style="width:6in;height:4.03125in" />

Copy and paste the command above and hit Enter.

1.  Edit the config.toml file with an editor of your choice and add the
    API key, Space ID and URL you collected earlier in the file as
    indicated.

- In \[deployment\]:

  - watsonx\_apikey (From Step 10)

  - watsonx\_url (as <https://us-south.ml.cloud.ibm.com>)

  - space\_id (From Step 14)

- In \[deployment.online.parameters\]:

  - url (as <https://us-south.ml.cloud.ibm.com>)

<!-- -->

- In \[deployment.software\_specification\], set overwrite = true

> \*Note that the URL appears in two places (as watsonx\_url and url),
> and you have to update both.
>
> A total of **five changes** should be made in the file.
>
> **Remember to Save** the file when done.

<img src="./3-LangGraph/attachments/media/image17.png"
style="width:6in;height:3.40625in" />

1.  Optionally explore the agent and tool source code under

src/langgraph\_react\_agent\_base.

- agent.py is the code for building the LangGraph agent.

- get\_traffic\_incident.py is the code base for the custom tool.

# Part 3: Deploy LangGraph Agent to watsonx.ai Runtime

We’ll now deploy the agent using the watsonx.ai CLI.

1.  Now we need to create a Python environment and download the
    watsonx.ai CLI. In the same terminal, run the following commands on
    your laptop

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr>
<th><p>python3.11 -m venv venv</p>
<p>source venv/bin/activate</p>
<p>pip install --upgrade pip</p>
<p>pip install ibm-watsonx-ai-cli</p>
<p>pip install poetry</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

<img src="./3-LangGraph/attachments/media/image18.png"
style="width:6in;height:2.19514in"
alt="A screenshot of a computer Description automatically generated" />

1.  You are ready to deploy it in watsonx.ai. Run the following command
    to create the new service. It will take the agent code, package it
    up and deploy it into the space.

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr>
<th>watsonx-ai service new</th>
</tr>
</thead>
<tbody>
</tbody>
</table>

On your screen, it should look like this:

<img src="./3-LangGraph/attachments/media/image19.png"
style="width:6in;height:2.75in" />

1.  After deployment, note the "**View the deployed AI service in the
    dashboard**" message. Open the provided URL in your browser.

2.  On the page, there is one important detail you need to capture,
    namely the **public streaming endpoint URL**. The picture above
    shows where you can find it and copy it to your clipboard. Save this
    URL.  
      
    **Make sure you are copying the bottom URL under Public endpoint!**

<img src="./3-LangGraph/attachments/media/image20.png"
style="width:5.89697in;height:2.60348in" />

1.  Now make sure the deployed service works as expected. Back on your
    command line terminal, first run the list subcommand again to see
    the deployment and then invoke the service:

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr>
<th><p>watsonx-ai service list</p>
<p>watsonx-ai service invoke "What is the traffic situation in downtown
Toronto?"</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

<img src="./3-LangGraph/attachments/media/image21.png"
style="width:6in;height:3.09375in" />

# Part 4: Connect the Agent to watsonx Orchestrate

Now we can integrate the LangGraph agent deployed on watsonx.ai to
watsonx Orchestrate. The LangGraph agent is completely opensource and
WXO can integrate agents deploy on different technology stack or even in
another vendor as long as the agent follow the output schema.

1.  Go back to [IBM Cloud](https://cloud.ibm.com/) Console, click the
    hamburger menu button (☰) on the top left corner. Then click
    **Resource list**. And click **watsonx Orchestrate** then click
    **Launch watsonx Orchestrate**.

<img src="./3-LangGraph/attachments/media/image22.png"
style="width:6in;height:2.53125in" />

1.  You will be navigated to watsonx Orchestrate main page. Before we
    integrate the LangGraph agent, you can try to interact with watsonx
    Orchestrate.

Since the system has no agents available to route any request to, it
might not be able to answer some of the questions. But you can still
interact with the Large Language Model (LLM) that works behind the
scenes, and ask general questions, like “How are you today?" or "How is
the traffic in Downtown Toronto?".

<img src="./3-LangGraph/attachments/media/image23.png"
style="width:6in;height:3.26042in" />

1.  Click the hamburger menu button on the top left corner, click
    **Build** and **Agent Builder.**

<img src="./3-LangGraph/attachments/media/image24.png"
style="width:6in;height:2.26044in" />

1.  Click **Create agent +** , keep it as **Create from scratch** give
    it the name **Traffic Agent**, copy and paste the below to
    description then click **Create**

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr>
<th>The Traffic Agent is responsible for providing real-time traffic
information and answering inquiries related to traffic conditions in
specific locations</th>
</tr>
</thead>
<tbody>
</tbody>
</table>

<img src="./3-LangGraph/attachments/media/image25.png"
style="width:6in;height:3.1875in" />

1.  Now scroll down until you see the **Agents** section under Toolset,
    then click **Add agent**

<img src="./3-LangGraph/attachments/media/image26.png"
style="width:6in;height:3.16667in" />

1.  Choose **Import** option, this will allow us to import the agent
    from watsonx.ai or external agent

<img src="./3-LangGraph/attachments/media/image27.png"
style="width:6in;height:3.125in" />

1.  Select the External agent option and click on Next.

<img src="./3-LangGraph/attachments/media/image28.png"
style="width:6in;height:3.08333in" />

1.  On the following screen, enter details about the imported agent:

- Agent details

  - Provider: watsonx.ai

  - Authentication type: leave as API key

  - API key: enter the key you collected at **STEP 10**

  - Service instance URL: enter the URL you collected at **STEP 22**

- Define new agent

  - Display name: **TrafficAgent** (the name cannot contain a space)

  - Description of agent capabilities: **The TrafficAgent agent provides
    information about traffic in any given location.**

<img src="./3-LangGraph/attachments/media/image29.png"
style="width:6in;height:3.07292in" />

1.  Then you should see the new connected agent appear in the **Agents**
    session.

<img src="./3-LangGraph/attachments/media/image30.png"
style="width:6in;height:2.98958in" />

1.  Scroll to the bottom and you will see a **Behavior** section.  
      
    Please try to draft the instruction by yourself so that the Traffic
    Agent can route the query to the external agent that you just
    imported! Such that it can answers questions like “Please tell me
    about traffic around Downtown Toronto”.  
      
    No worries! You can find our model answer at the end of this
    document — but please give it a try yourself before looking.

<img src="./3-LangGraph/attachments/media/image31.png"
style="width:6in;height:3in" />

1.  Let's test it before we publish the agent. Let's trigger the
    TrafficAgent agent by asking about traffic in a given location, say,
    Downtown Toronto. Enter the following into the **Preview** text
    input:  
      
    "Please tell me about traffic around Downtown Toronto." (You can
    obviously pick any other location too.)

<img src="./3-LangGraph/attachments/media/image32.png"
style="width:6in;height:3.01042in" />

1.  Note that the agent was "reasoning", in other words, determining how
    to answer this request.  
      
    Although there is only one collaborator agent in the Traffic Agent,
    it decided that routing the request to the TrafficAgent was the best
    option.  
      
    You can expand the Show reasoning section in the Preview and see
    which steps the agent took. It should list one step, which you can
    expand as well.

<img src="./3-LangGraph/attachments/media/image33.png"
style="width:6in;height:5.5625in" />

1.  Once you are satisfied with the answer, deploy this agent using the
    Deploy button as with the other agents before.

<img src="./3-LangGraph/attachments/media/image34.png"
style="width:6in;height:2.98958in" />

1.  We can now go back to the home screen to see it there. Simply click
    on **watsonx Orchestrate** at the very top of the window.

<img src="./3-LangGraph/attachments/media/image35.png"
style="width:6in;height:3.17708in" />

1.  Make sure you select the **Traffic Agent** under the Agents list on
    the left. Now you can enter your questions and requests in the main
    chat window.

You can ask for any other location too!

“How is the traffic around Downtown Toronto?”  
“What is the traffic situation in downtown San Francisco?”

<img src="./3-LangGraph/attachments/media/image36.png"
style="width:6in;height:3.15625in" />

🎉 Congratulations!

You’ve successfully built an Agentic AI system by integrating a
LangGraph agent with watsonx Orchestrate.

\*The model answer for the Behavior of Traffic agent:

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr>
<th><p>You are a agent responsible for providing real-time traffic
information and answering inquiries related to traffic conditions in
specific locations.</p>
<p>- Use the TrafficAgent to find traffic information about a
location.</p>
<p>DO NOT show anything that is not related to the traffic report. Stop
generating output after the list of traffic situation.</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>
