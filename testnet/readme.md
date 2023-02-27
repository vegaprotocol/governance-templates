# Testnet Governance Templates

The proposals listed in this folder can be used to upgrade the validator testnet when ready.
Follow the instructions on the readme in the root folder for details of how to amend these scripts.

## Asset Creation Templates
2 scripts are provided to create test settlement assets, and these assets have already been created on the Sepolia network by the team, therefore the contract addresses given can be used exactly as shown.  These assets have been created specifically for use in the "Mainnet Sims" which are part of testing ahead enabling trading.  If the validators wish to create more assets for ongoing use on their testnet they can amend and re-use the templates.

## Network Parameter Changes
These fall broadly into two categories:

### Removal of Restrictions
These remove the alpha mainnet restrictions and in testing will be set to a date during the test deployment.  Later in mainnet they will be set by the community based on whenever they believe the system is ready to support trading.

### Changes to validator set and standby validators 
These relate to expanding the validator set, expanding the standby validator set, and adjusting certain bonuses and reward multiples for those validators.  Each value has been proposed by the project team based on findings in testing and what feels approximately correct at this stage for the network.  Since Vega is a community run project all these values can be changed by the validators in their testnet proposal if they see fit, and similarly could be changed in the eventual mainnet proposals too.


# Full List of Proposals

  
  | #   | Type           | Name                        | Description |
  | --- | -------------- |---------------------------- |----------- |
  | 1   | Network Param  |Remove Asset Restriction     |Propose governance vote to remove restriction on asset creation on a given date      |
  | 2   | Network Param  |Remove Market Restriction    |Propose governance vote to remove restriction on market creation on a give date      |
  | 3   | Network Param  |Update Ersatz Multiple       |Propose governance vote to update Ersatz Multiple to 0.25 (previous value 0), thereby creating the list of standby validators.  The project team has proposed 0.25 for this, which given the protocol rounds down will lead to 3 Standby Validators at the current number of Consensus validators         |
  | 4   | Network Param  |Update Ersatz Reward Factor  |Propose governance vote to update Reward Factor to 0.9, thereby bringing the rewards for standby validators closer to that of consensus validators to ensure it is desirable to become a standby validator (previous value 0.5)|
  | 5  | Network Param  |Update Incumbent Bonus       |Propose governance vote to update Incumbent Bonus to 0.05, thereby making it less prohibitively difficult for standby validators to replace a consensus validator (previous value 1)      |
  | 6   | Update Asset   |Update $VEGA Limits          |Propose governance vote to update the limits on the test $VEGA asset|
  | 7   | Create Asset   |Create USDT Asset            |Propose governance vote to create a test version of USDT asset to be used in Sim 2      |
  | 8   | Create Asset   |Create DAI Asset             |Propose governance vote to create a test version of DAI asset to be used in Sim 4       |
  | 9  | Network Param  |Update Tendermint Number     |Propose governance vote to update Tendermint Number to 14, thereby increasing the number of consensus validators to 14 (previous value 13)       |
  | 10  | Network Param  |Update Multisig Num Signers  |Propose governance vote to update Multisig Num Signers to 14 to align with increase in tendermint number (previous value 13)       |
  
  
