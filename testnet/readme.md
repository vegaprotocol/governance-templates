# Testnet Governance Templates

The proposals listed in this folder can be used to upgrade the validator testnet when ready.
Follow the instructions on the readme in the root folder for details of how to amend these scripts.
Note that 4 scripts are provided to create test settlement assets, and these assets have already been created on Sepolia by the team, therefore the contract addresses given can be used exactly as shown.

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
  
  
