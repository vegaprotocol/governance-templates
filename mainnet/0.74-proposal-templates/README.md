# Mainnet Governance Templates

The proposals listed in this folder can be used to create proposals in mainnet if and when the community decides to do so. The proposal templates have been created to work in mainnet after the Palazzo release (0.74.x), however, any community member intending to use these should carefully check the parameter values and ensure that they are as desired.

> [!IMPORTANT]
> A number of fields have been left with "TO_UPDATE"; members of the community will need to complete these with relevant values as required.


## Full list of proposals

  | #   | Type           | Name                        | Description |
  | --- | -------------- |---------------------------- |----------- |
  | 1   | Network parameters  | [update_network_parameters.json](./update_network_parameters.json)     | Propose governance vote to update the tau scaling parameters      |
  | 2   | Market update | [update_markets.json](./update_markets.json)   | Propose governance vote to update the existing BTC/USDT and ETH/USDT markets with the new 0.74.x configurations  |


## Update network parameters

This proposal changes the `market.liquidity.probabilityOfTrading.tau.scaling` from a value of `1` to a value of `0.1`. The network parameter value range restrictions were changed as a result of this [specification change](https://github.com/vegaprotocol/specs/pull/2134/files) allowing values lower than `1`. In addition to this an associated change of the `market.liquidity.minimum.probabilityOfTrading.lpOrders` parameter is proposed taking the value from `0.000001` to `0.001`.

### Rationale

Currently when calculating a liquidity providers (LP) liquidity score, the network calculates the cumulative notional volume of their orders weighted by each orders probability of trading.

To incentivise a tighter spread by rewarding competitive liquidity providers with a larger proportion of the liquidity fees; an update to tau scaling could be suggested to reduce the probability of trading given by the risk model for orders placed further from the best-bid / ask.


### Impact

The figure below demonstrates how the normalised liquidity scores for each existing LP would change after updating tau scaling from `1` to `0.1`. liquidity providers providing volume close to the best-bid / ask would see the greatest increase in their normalised liquidity scores.

![normalised liquidity scores](./btcusd_liquidity_scores_1.png)

The figure below demonstrates how a new LP willing to meet the minimum commitment by providing volume with a tight spread would now receive a greater liquidity score. This also demonstrates the incentive for existing liquidity providers to compete on the best-bid / ask as doing so reduces the weighted volume of their competitors orders.

![minimum commitment](./btcusd_liquidity_scores_2.png)

## Update markets

The Palazzo release (0.74.x) has introduced changes to the [liquidity provider fee settings](https://github.com/vegaprotocol/roadmap/issues/81), [liquidation mechanism](https://github.com/vegaprotocol/roadmap/issues/85) and the [mark price and perpetual funding TWAP updates](https://github.com/vegaprotocol/roadmap/issues/89). Due to these changes it is now possible to set market parameters for the `liquidityFeeSettings` method, `liquidationStrategy` configuration and the `markPriceConfiguration` parameters respectively. This proposal is to update the current mainnet BTC/USDT and ETH/USDT markets in order for the these markets to benefit from the implemented code changes.

### Liquidity provider fee setting

#### Proposed value(s)

No change for now, and its for the market makers propose to change later once the [liquidity provider fee settings](https://github.com/vegaprotocol/roadmap/issues/81) specifications have been understood.

#### Rationale

With additional flexibility in setting the liquidity fee, two new methods have been introduced as options for liquidity fee setting: the [Stake Weighted Average](https://github.com/vegaprotocol/specs/blob/palazzo/protocol/0042-LIQF-setting_fees_and_rewarding_lps.md#stake-weighted-average-method-for-setting-the-liquidity-fee-factor) method and the [Constant Liquidity Fee](https://github.com/vegaprotocol/specs/blob/palazzo/protocol/0042-LIQF-setting_fees_and_rewarding_lps.md#constant-liquidity-fee-method) method. No change has been proposed as liquidity providers should review these methods and make governance proposals to change the method if and as desired.

### Funding rate configuration

To ensure across all markets during adverse market conditions the funding rate remains sensible, the `fundingRateLowerBound` and `fundingRateUpperBound` could be set to `-0.01` and `0.01` respectively. This cap would ensure the funding rate will always be greater than `-10%` and less than `10%`.

### Mark price configuration

To reduce the probability of market or oracle manipulation causing "unfair" mark-to-market settlements or liquidations, markets can be configured to calculate a composite mark price using multiple sources.

Across all markets, use of a single pyth oracle in the markPriceConfiguration is recommended initially. 

For detailed information on mark price configurations refer to the [vega docs site](https://docs.vega.xyz/testnet/tutorials/proposals/new-perpetuals-market#mark-price-configuration).

#### BTC/USDT, ETH/USDT markets

For markets with higher liquidity and a greater number of LPs, a mark price configuration which takes the median value of the trade price, order book price, and prices given by any number of oracles set in the `dataSourcesSpec` is recommended. This would be achieved by setting the `compositePriceType` to `COMPOSITE_PRICE_TYPE_MEDIAN`.

To ensure stale data does not skew the mark price, it is recommended the `sourceStaleTolerance` fields are set to `["1m", "1m", "1m", "1m"]`. This means any price will be considered stale and no longer be used in the median calculation if it is not updated for `1m`.

To increase the difficulty of manipulating the trade price, setting the `decayWeight` to `1.0` and the `decayPower` to `1` is recommended. This will ensure all trades in the update period are considered when calculating the trade price rather than just the most recent trade. Setting these values to 1 will linearly weight more recent and larger trades.

Additionally, to increase the difficulty of manipulating the order book price, the `cashAmount` field could be set to `50000000` (50 USDT). This cash amount requires a sufficient volume of orders to be provided on both sides of the book for a fresh book price to be calculated.

#### INJ/USDT, LDO/USDT, SNX/USDT markets

For less liquid markets which are more easily manipulated (see the [report](https://vega.xyz/reports/VMAR-20240214_LDOUSDT.pdf) for the manipulation of the LDO market), a mark price configuration which does not rely on internal price sources is recommended initially.

This would be achieved by setting the `compositePriceType` to `COMPOSITE_PRICE_TYPE_WEIGHTED` and the `sourceWeights` to `[0, 0, 1, 0]` (values correspond to the weighting for the trade price, book price, oracle price and median price respectively). With this configuration the pyth oracle price will be the **only** factor in calculating the mark price. 

Whilst with the above configuration the trade price and book price are not needed, for completeness the following parameters could be set.
- `decayWeight` set to `1.0`
- `decayPower` set to `1`
- `cashAmount` set to `50000000`

### Liquidation strategy improvements

#### Proposed value(s)

Liquidation strategy is a new section which can be set in `liquidationStrategy`. Initially the following parameter values are recommended, `disposalTimeStep` is set to `1`, `disposalFraction` is set to `1`, `fullDisposalSize` is set to `1000000`, and `maxFractionConsumed` is set to `0.1`

#### Rationale

Improvements have been made to how distressed parties are liquidated. This configuration is used to allow the network to hold an active position on the market. Parties that are distressed, but previously couldn't be liquidated because there was insufficient volume on the book, will now be liquidated. In this process the party's position is transferred to the network party, and rather than dumping the distressed volume on the market, an inventory management strategy carries this out over time.

The values proposed above result in an aggressive disposal strategy where the network will attempt to dispose it's full position every `1s` but never consuming more than `10%` of the volume on one side of the book.


### Price Monitoring Bounds

In the recent market manipulation of the LDO market (see the [report](https://vega.xyz/reports/VMAR-20240214_LDOUSDT.pdf)) it was shown price monitoring auctions, although triggered, were not long enough to give market makers sufficient time to react to the manipulation attempts.

Therefore it is recommended a new trigger which results in a long auction for large price movements is added, and the auction period of all other triggers is increased. The recommended triggers are:


- `horizon` set to `360`, `probability` set to `0.9999999`, and `auctionExtension` set to `300` (increased from `120`).
- `horizon` set to `1440`, `probability` set to `0.9999999`, and `auctionExtension` set to `1800` (increased from `180`).
- `horizon` set to `4320`, `probability` set to `0.9999999`, and `auctionExtension` set to `3600` (increased from `300`).
- `horizon` set to `21600`, `probability` set to `0.9999999`, and `auctionExtension` set to `86400` (increased from `120`).

Note: For the ETHUSDT-PERP market in particular, this means the addition of two new price monitoring triggers as it currently only uses the single trigger.
