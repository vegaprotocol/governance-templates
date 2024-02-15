# Mainnet Governance Templates

The proposals listed in this folder can be used to create proposals in mainnet if and when the community decides to do so. The proposal templates have been created to work in mainnet after the Palazzo release (0.74.x), however, any community member intending to use these should carefully check the parameter values and ensure that they are as desired.

## Full List of Proposals

  | #   | Type           | Name                        | Description |
  | --- | -------------- |---------------------------- |----------- |
  | 1   | Network parameters  | Update-tau-scaling.json     | Propose governance vote to update the tau scaling parameters      |
  | 2   | Market update | Update-markets.json    | Propose governance vote to update existing markets with the new mark price configuration  |



### Update tau scaling

This proposal changes the `market.liquidity.probabilityOfTrading.tau.scaling` from a value of `1` to a value of `0.1`. The network parameter value range restrictions were changed as a result of this [specification change](https://github.com/vegaprotocol/specs/pull/2134/files) allowing values lower than `0`. In addition to this an associated change of the `market.liquidity.minimum.probabilityOfTrading.lpOrders` parameter is proposed taking the value from `0.000001` to `0.001`.

**Rationale**

The rationale for these changes is...

**Impact**

The impact from the currrent state is...


### Update-markets

The Palazzo release (0.74.x) has introducted changes to the [liquidity provider fee settings](https://github.com/vegaprotocol/roadmap/issues/81), [liquidation mechanism](https://github.com/vegaprotocol/roadmap/issues/85) and the [mark price and perps funding TWAP updates](https://github.com/vegaprotocol/roadmap/issues/89). Due to these changes it is now possible to set paramters for the `liquidityFeeSettings` method, `liquidationStrategy` configuration and the ` markPriceConfiguration` parameters respectively. This proposal is to update the current mainnet markets in order for the current markets to benefit from the implemented code changes.

**Rationale**

The rationale for these changes is...

**Impact**

The impact from the currrent state is...
