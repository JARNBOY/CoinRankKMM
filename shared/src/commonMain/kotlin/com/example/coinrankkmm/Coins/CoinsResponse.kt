package com.example.coinrankkmm.Coins

import kotlinx.serialization.Serializable

@Serializable
data class CoinsResponse(
    val status: String,
    val data: CoinsData
)

@Serializable
data class CoinsData(
    val stats: CoinStats?,
    val coins: List<CoinDetail?>?
)

@Serializable
data class CoinStats(
    val total: Int?,
    val totalCoins: Int?,
    val totalMarkets: Int?,
    val totalExchanges: Int?,
    val totalMarketCap: String?,
    val total24hVolume: String?
)

@Serializable
data class CoinDetail(
    val uuid: String?,
    val symbol: String?,
    val name: String?,
    val description: String?,
    val color: String?,
    val iconUrl: String?,
    val websiteUrl: String?,
    val links: List<Link?>?,
    val supply: Supply?,
    val numberOfMarkets: Int?,
    val numberOfExchanges: Int?,
    val marketCap: String?,
    val fullyDilutedMarketCap: String?,
    val price: String?,
    val priceAt: Int?,
    val listedAt: Int?,
    val tier: Int?,
    val change: String?,
    val rank: Int?,
    val sparkline: List<String?>?,
    val allTimeHigh: AllTimeHigh?,
    val lowVolume: Boolean?,
    val coinrankingUrl: String?,
    val volume24h: String?,
    val btcPrice: String?,
    val contractAddresses: List<String?>?,
    val hasContent: Boolean?,
    val notices: String?,
    val tags: List<String?>?
)

@Serializable
data class Link(
    val name: String?,
    val type: String?,
    val url: String?
)

@Serializable
data class Supply(
    val confirmed: Boolean?,
    val supplyAt: Int?,
    val max: String?,
    val total: String?,
    val circulating: String?
)

@Serializable
data class AllTimeHigh(
    val price: String?,
    val timestamp: Int?
)