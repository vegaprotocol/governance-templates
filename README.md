# Governance templates

The list of proposals below are the full list that are  required to enable trading on a network.
The proposal scripts have all been fully tested internally and used to enable trading on the mainnet mirror network.
The validators can used the same scrips to enable trading on their own testnet when they see fit.

## Values to be adjusted
Each of these scripts can be re-used, but the following part of the script will need to be changed:

| Field      | Description |
| ----------- | ----------- |
| <your_walletname>      | To be replaced with the name of the wallet the proposer intends to use.|
| <your_public_key>   | To be replaced with the full vega key the proposer intends to use.|
| <set_network> | To be replaced with the intended network as named in the network config on the user's vegawallet; can be found with command "vegawallet network list" on CLI. |
| <set_closing_time>|To be replaced with the epochtimestamp in SECONDS on which the vote is to close (voting ends).|
| <set_enactment_time>|To be replaced with the epochtimestamp in SECONDS on which the vote is to be enacted (changes are applied); must be greater than closing time|

NB. 
Timestamps must indicate a duration greater than the MinClose and the MinEnact for that type of governance proposal on the relevant network.
Websites such as https://www.epochconverter.com/ can be used to generate a suitable timestamp.  Note this timestamp must be given in **seconds**. 

## Min duration values:
  
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

## Full List of Proposals

  
  | #   | Type           | Name                        | Description |
  | --- | -------------- |---------------------------- |----------- |
  | 1   | Network Param  |Remove Asset Restriction     |Propose governance vote to remove restriction on asset creation       |
  | 2   | Network Param  |Remove Market Restriction    |Propose governance vote to remove restriction on market creation       |
  | 3   | Network Param  |Update Ersatz Multiple       |Propose governance vote to update Ersatz Multiple to 0.25, thereby creating the list of standby validators (previous value 0)       |
  | 4   | Network Param  |Update Ersatz Reward Factor  |Propose governance vote to update Reward Factor to 0.9, thereby bringing the rewards for standby validators closer to that of consensus validators to ensure it is desirable to become a standby validator (previous value 0.5)|
  | 5  | Network Param  |Update Incumbent Bonus       |Propose governance vote to update Incumbent Bonus to 0.05, thereby making it less prohibitively difficult for standby validators to replace a consensus validator (previous value 1)      |
  | 6   | Update Asset   |Update $VEGA Limits          |Propose governance vote to update the limits on the test $VEGA asset|
  | 7   | Create Asset   |Create USDT Asset            |Propose governance vote to create a test version of USDT asset       |
  | 8   | Create Asset   |Create DAI Asset             |Propose governance vote to create a test version of DAI asset       |
  | 9   | Create Asset   |Create WETH Asset            |Propose governance vote to create a test version of WETH asset       |
  | 10   | Create Asset   |Create WBTC Asset            |Propose governance vote to create a test version of WBTC asset       |
  | 11  | Network Param  |Update Tendermint Number     |Propose governance vote to update Tendermint Number to 14, thereby increasing the number of consensus validators to 14 (previous value 13)       |
  | 12  | Network Param  |Update Multisig Num Signers  |Propose governance vote to update Multisig Num Signers to 14 to align with increase in tendermint number (previous value 13)       |
  
  
