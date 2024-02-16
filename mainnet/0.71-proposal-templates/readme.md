# Mainnet Governance Templates

The proposals listed in this folder can be used to upgrade mainnet if and when the community decides to do so.
Follow the instructions on the readme in the root folder for details of how to amend these scripts.
Unlike the testnet folder, the community will need to decide which assets they wish to create and find the relevant details from the ethereum network to finalise these proposals.
Therefore unlike in the testnet folder, one single asset creation template is provided here, which must be updated by whomever wishes to propose an asset.

## Full List of Proposals


  | #   | Type           | Name                        | Description |
  | --- | -------------- |---------------------------- |----------- |
  | 1   | Network Parameter |Remove Asset Restriction     |Propose governance vote to remove restriction on asset creation       |
  | 2   | Network Parameter |Remove Market Restriction    |Propose governance vote to remove restriction on market creation       |
  | 3   | Network Parameter |Update Ersatz Multiple       |Propose governance vote to update Ersatz Multiple to 0.25, thereby creating the list of standby validators (previous value 0)       |
  | 4   | Network Parameter |Update Ersatz Reward Factor  |Propose governance vote to update Reward Factor to 0.9, thereby bringing the rewards for standby validators closer to that of consensus validators to ensure it is desirable to become a standby validator (previous value 0.5)|
  | 5  | Network Parameter |Update Incumbent Bonus       |Propose governance vote to update Incumbent Bonus to 0.05, thereby making it less prohibitively difficult for standby validators to replace a consensus validator (previous value 1)      |
  | 6   | Update Asset   |Update $VEGA Limits          |Propose governance vote to update the limits on the test $VEGA asset|
  | 7   | Create Asset   |Create Asset Template            |Propose governance vote to create the required mainnet assets.  Note that you will need to set the value for Quantum, the Lifetime withdrawal limit, and the Withdrawal delay threshold.  See Docs for more details       |
  | 8 | Network Parameter |Update Tendermint Number     |Propose governance vote to update Tendermint Number to 14, thereby increasing the number of consensus validators to 14 (previous value 13)       |
  | 9  | Network Parameter |Update `Multisig Num Signers`  |Propose governance vote to update `Multisig Num Signers` to 14 to align with increase in tendermint number (previous value 13)       |

## Asset Creation

When creating mainnet assets, the following information will be required.  Full information is available on the [docs site](https://docs.vega.xyz/testnet/tutorials/proposals/new-asset-proposal).

| Name           | Description                        |
| -------------- |---------------------------- |
| `name`  |The name of the asset on Ethereum network    |
| `symbol`  | The symbol of the asset on Ethereum network   |
| `decimals` | The number of decimal places / precision handled by this asset   |
| `quantum`  | The lowest meaningful amount of this asset.  Approx the amount equal to 1 USD.  Does not need to be accurate, just the correct order of magnitude.   |
| `contractAddress` |   The contract address from Ethereum  |
| `withdrawThreshold` |   The amount of the asset that can be withdrawn from the Vega network without triggering the withdrawal delay, advised to be set to zero during Alpha mainnet, can be raised later  |
| `lifetimeLimit` | The amount of the asset that can be deposited by a single Ethereum address, advised to be set fairly low during Alpha mainnet (an amount equivalent to few thousand USD), can be raised later and participants can whitelist themselves to avoid this if needed   |
