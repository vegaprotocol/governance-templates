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


## Full List of Proposals


  | #   | Type           | Name                        | Description |
  | --- | -------------- |---------------------------- |----------- |
  | 1   | Network Parameter  |Remove Asset Restriction     |Propose governance vote to remove restriction on asset creation on a given date      |
  | 2   | Network Parameter  |Remove Market Restriction    |Propose governance vote to remove restriction on market creation on a give date      |
  | 3   | Network Parameter  |Update Ersatz Multiple       |Propose governance vote to update Ersatz Multiple to 0.25 (previous value 0), thereby creating the list of standby validators.  The project team has proposed 0.25 for this, which given the protocol rounds down will lead to 3 standby validators at the current number of consensus validators         |
  | 4   | Network Parameter  |Update Ersatz Reward Factor  |Propose governance vote to update Reward Factor to 0.9 (previous value 0.5). The project team has proposed this value to bring the rewards for standby validators closer to that of consensus validators to ensure it is desirable to become a standby validator.  This figure is delicate to set because the value must be high enough to incentivise running a standby node, potentially when the node may not become a consensus node quickly, or at all.  However clearly also there should be a material reason to become full fledged consensus too. This value is the project team's initial best estimate at a balanced value, but feedback is welcome.|
  | 5  | Network Parameter  |Update Incumbent Bonus       |Propose governance vote to update Incumbent Bonus to 0.05 (previous value 1).  This Parameter effectively makes it more difficult for a standby validator to enter the consensus set, the idea being it is not desirable to have validators entering / leaving on a epoch by epoch basis because of small fluctuations in stake.  However the current value of 1 would require a standby validator to have twice the stake of the lowest scoring consensus validator in order to enter the set, which seems overly prohibitive.  The project team has proposed an initial level of 0.05 for this so a standby validator would need to be at least 5% higher scoring than the lowest scoring consensus validator to enter the set.          |
  | 6   | Update Asset   |Update $VEGA Limits          |Propose governance vote to update the limits on the test $VEGA asset|
  | 7   | Create Asset   |Create USDT Asset            |Propose governance vote to create a test version of USDT asset to be used in Sim 2      |
  | 8   | Create Asset   |Create DAI Asset             |Propose governance vote to create a test version of DAI asset to be used in Sim 4       |
  | 9  | Network Parameter  |Update Tendermint Number     |Propose governance vote to update Tendermint Number to 14, thereby increasing the number of consensus validators to 14 (previous value 13).  This initial move to 14 is a proof of concept to show we can add a validator, and further additions are expected soon after.       |
  | 10  | Network Parameter  |Update `Multisig Num Signers`  |Propose governance vote to update `Multisig Num Signers` to 14 to align with increase in tendermint number (previous value 13).  THis value must always match the value of the tendermint number.       |
