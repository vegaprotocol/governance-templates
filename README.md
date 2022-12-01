# Governance templates

The list of proposals below are the full list that will be required in order to enable trading on mainnet.
The same list will be run in order to initially conduct an internal dry run of the runbook for testing purposes w/c 5th Dec.
Following this, the validators are expected to conduct their own dry run on their validator testnet w/c 12th Dec.
Finally, the same set of scripts can be used by the community to enable trading on mainnet when desired.

## Values to be adjusted
Each of these scripts will be tested explicitly and should be re-used during each phase, but the following part of the script will need to be changed:

| Field      | Description |
| ----------- | ----------- |
| <your_walletname>      | To be replaced with the name of the wallet the proposer intends to use.|
| <your_public_key>   | To be replaced with the full vega key the proposer intends to use.|
| <network>   | to be replaced with the intended network as named in the network config on the user's vegawallet; can be found with command "vegawallet network list" on CLI.|
| <set_closing_time>|To be replaced with the epochtimestamp in SECONDS on which the vote is to close (voting ends).|
| <set_enactment_time>|To be replaced with the epochtimestamp in SECONDS on which the vote is to be enacted (changes are applied); must be greater than closing time|

NB. 
Timestamps must indicate a duration greater than the MinClose and the MinEnact for that type of governance proposal on the relevant network.
Websites such as https://www.epochconverter.com/ can be used to generate a suitable timestamp.

## Current Min duration values:
  
### Internal Dry Run Environment (to be included in Genesis file update prior to dry run)
| Proposal Type      | MinClose |MinEnact |
| ----------- | ----------- |----------- |
| Update Asset      | 30S       |30S       |
| Create Asset   | 30S        |30S       |
| Update Network Param   | 30S        |30S       |

  
### Validator Testnet (to be included in Genesis file update prior to dry run)
| Proposal Type      | MinClose |MinEnact |
| ----------- | ----------- |----------- |
| Update Asset      | 1H       |1H       |
| Create Asset   | 1H        |1H       |
| Update Network Param   | 1H        |1H       |

### Mainnet
| Proposal Type      | MinClose |MinEnact |
| ----------- | ----------- |----------- |
| Update Asset      | 5D       |5D       |
| Create Asset   | 5D        |5D       |
| Update Network Param   | 3D        |3D       |
  
  
## Specific script amendments
In addition, some scripts require some specific amendments.

### For the Update $VEGA Asset proposal:

<set_asset_id> will need to be set to the correct identifier for the $VEGA asset in that environment.
https://api.n06.testnet.vega.xyz/api/v2/assets can be used to find this identifier on the environment in question.
  
### For the removal of  restrictions on asset creation and market creation:

<set_asset_limit> to be set to the date on which assets can be created FROM, in format "2022-11-21T00:00:00Z"
<set_market_limit> to be set to the date on which markets can be created FROM, in format "2022-11-21T00:00:00Z"

## Full List of Proposals

  
  | #   | Type           | Name                        | Description |
  | --- | -------------- |---------------------------- |----------- |
  | 1   | Update Asset   |Update $VEGA Limits          |Propose governance vote to update the limits on the $VEGA asset|
  | 2   | Network Param  |Remove Asset Restriction     |Propose governance vote to remove restriction on asset creation       |
  | 3   | Network Param  |Remove Market Restriction    |Propose governance vote to remove restriction on market creation       |
  | 4   | Create Asset   |Create USDT Asset            |Propose governance vote to create USDT asset       |
  | 5   | Create Asset   |Create DAI Asset             |Propose governance vote to create DAI asset       |
  | 6   | Create Asset   |Create WETH Asset            |Propose governance vote to create WETH asset       |
  | 7   | Create Asset   |Create WBTC Asset            |Propose governance vote to create WBTC asset       |
  | 8   | Network Param  |Update Ersatz Multiple       |Propose governance vote to update Ersatz Multiple as per Network Param Config, thereby increasing list of standby validators       |
  | 9   | Network Param  |Update Ersatz Reward Factor  |Propose governance vote to update Reward Factor as per Network Param Config, thereby bringing the rewards for standby validators closer to that of consensus validators       |
  | 10  | Network Param  |Update Incumbent Bonus       |Propose governance vote to update Incumbent Bonus as per Network Param Config, thereby making it less prohibitively difficult for standby validators to replace a consensus validator       |
  | 11  | Network Param  |Update Tendermint Number     |Propose governance vote to update Tendermint Number as per Network Param Config, thereby increasing the number of consensus validators to 14       |
  | 12  | Network Param  |Update Multisig Num Signers  |Propose governance vote to update Multisig Num Signers as per Network Param config to align with increase in tendermint number       |
  
  
