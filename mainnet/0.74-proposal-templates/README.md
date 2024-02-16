# Mainnet Governance Templates

The proposals listed in this folder can be used to create proposals in mainnet if and when the community decides to do so. The proposal templates have been created to work in mainnet after the Palazzo release (0.74.x), however, any community member intending to use these should carefully check the parameter values and ensure that they are as desired.

> [!IMPORTANT]
> A number of fields have been left with *TO_UPDATE*, members of the community will need to complete these with relevant values as required.


## Full list of proposals

  | #   | Type           | Name                        | Description |
  | --- | -------------- |---------------------------- |----------- |
  | 1   | Network parameters  | [update_network_parameters.json](./update_network_parameters.json)     | Propose governance vote to update the tau scaling parameters      |
  | 2   | Market update | [update_markets.json](./update_markets.json)   | Propose governance vote to update existing markets with the new mark price configuration  |



### Update network parameters

This proposal changes the `market.liquidity.probabilityOfTrading.tau.scaling` from a value of `1` to a value of `0.1`. The network parameter value range restrictions were changed as a result of this [specification change](https://github.com/vegaprotocol/specs/pull/2134/files) allowing values lower than `1`. In addition to this an associated change of the `market.liquidity.minimum.probabilityOfTrading.lpOrders` parameter is proposed taking the value from `0.000001` to `0.001`.

**Rationale**

The rationale for these changes is...

**Impact**

The impact from the currrent state is...


### Update markets

The Palazzo release (0.74.x) has introducted changes to the [liquidity provider fee settings](https://github.com/vegaprotocol/roadmap/issues/81), [liquidation mechanism](https://github.com/vegaprotocol/roadmap/issues/85) and the [mark price and perps funding TWAP updates](https://github.com/vegaprotocol/roadmap/issues/89). Due to these changes it is now possible to set market paramters for the `liquidityFeeSettings` method, `liquidationStrategy` configuration and the `markPriceConfiguration` parameters respectively. This proposal is to update the current mainnet BTC/USD and ETH/USD markets in order for the these markets to benefit from the implemented code changes.

**Rationale**

The rationale for these changes is...

**Impact**

The impact from the currrent state is...
