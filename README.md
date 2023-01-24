# Governance templates

This repo contains the full list of governance proposals that that are required to enable trading on a network.
The proposal scripts have all been fully tested internally and used to enable trading on the mainnet mirror network.
The validators can use the same scrips to enable trading on their own testnet when they see fit.  Later when ready the community can use them to enable trading on mainnet.

# How to use this repo
The repo is split into two folders, one containing the full list of proposals required to enable trading on the validator testnet, including contract addresses to create test assets on Sepolia. The second contains templates for making simliar proposals in mainnet, which the community will need to adjust to create the desired assets when they are ready. 

## Values to be adjusted
Each of these scripts can be re-used, but the following part of the script will need to be changed:

| Field      | Description |
| ----------- | ----------- |
| <your_walletname>      | To be replaced with the name of the wallet the proposer intends to use.|
| <your_public_key>   | To be replaced with the full vega key the proposer intends to use.|
| <set_network> | To be replaced with the intended network as named in the network config on the user's vegawallet; can be found with command "vegawallet network list" on CLI. |
| <set_closing_time>|To be replaced with the epochtimestamp in SECONDS on which the vote is to close (voting ends).|
| <set_enactment_time>|To be replaced with the epochtimestamp in SECONDS on which the vote is to be enacted (changes are applied); must be greater than closing time|


## Min duration values:
 
Closing and enactment timestamps must indicate a duration greater than the MinClose and the MinEnact for that type of governance proposal on the relevant network.  Websites such as https://www.epochconverter.com/ can be used to generate a suitable timestamp.  Note this timestamp must be given in **seconds**.  The minimum close and enactment times for each environment are shown below.
  
### Validator Testnet
| Proposal Type      | MinClose |MinEnact |
| ----------- | ----------- |----------- |
| Update Asset      | 10m       |10m       |
| Create Asset   | 10m        |10m       |
| Update Network Param   | 10m        |10m       |

### Mainnet
| Proposal Type      | MinClose |MinEnact |
| ----------- | ----------- |----------- |
| Update Asset      | 5D       |5D       |
| Create Asset   | 5D        |5D       |
| Update Network Param   | 3D        |3D       |
  
  
## Specific script amendments
In addition, some scripts require some specific amendments.

### For the Update $VEGA Asset proposal:

- <set_asset_id> will need to be set to the correct identifier for the $VEGA asset in that environment.
- https://api.n06.testnet.vega.xyz/api/v2/assets can be used to find this identifier on the environment in question, you will need to substitute the datanode address for a datanode on the relevant network
  
### For the removal of  restrictions on asset creation and market creation:

- <set_asset_limit> to be set to the date on which assets can be created FROM, in format "2022-11-21T00:00:00Z". NOTE: This value MUST be in the future or the update will FAIL.
- <set_market_limit> to be set to the date on which markets can be created FROM, in format "2022-11-21T00:00:00Z". NOTE: This value MUST be in the future or the update will FAIL.

## Full list of proposals
The complete list of proposals differs slightly by environment, so these can be found in the relevant folder.
