# Deploy the TFC Agent
The policy as code workflow for Terraform Cloud is executed as a component of the Terraform Cloud Agent. You can deploy a agent locally by completing the following:

1. Ensure your system meets the following [requirements](https://www.terraform.io/cloud-docs/agents/requirements)
1. [Create](https://www.terraform.io/cloud-docs/agents/agent-pools#create-an-agent-pool) a new agent pool being sure to save the automatically generated token value
1. [Scope](https://www.terraform.io/cloud-docs/agents/agent-pools#scope-an-agent-pool-to-specific-workspaces) the agent pool to a specific workspace
1. [Configure](https://www.terraform.io/cloud-docs/agents/agent-pools#configure-workspaces-to-use-the-agent) the workspace to use the agent
1. Setup your environment by running the following:

    ```bash
    export TFC_ADDRESS="https://app.terraform.io"
    export TFC_AGENT_TOKEN="<TOKEN>"
    export TFC_AGENT_LOG_LEVEL=debug
    export _TFC_AGENT_POLICY_COMPONENT_ENABLED=true
    ```
2. Start the agent using docker:

    ```bash
    docker run \
        -e TFC_AGENT_TOKEN \
        -e TFC_AGENT_NAME \
        -e TFC_ADDRESS \
        -e TFC_AGENT_LOG_LEVEL=debug \
        -e _TFC_AGENT_POLICY_COMPONENT_ENABLED=true \
        hashicorp/tfc-agent:latest
    ```

3. Congratulations, you have now deployed the agent!

You can verify that your agent has successfully been deployed by navigating to the organization’s **Settings**, selecting **Agents** in the left-hand nav and confirming that you have a newly registered agent that is in an **idle** state.

---