package com.example.coinrankkmm.coins

import kotlinx.serialization.Serializable
import kotlinx.serialization.SerialName

@Serializable
data class CoinsResponse(
    @SerialName("status")
    val status: String?,
    @SerialName("data")
    val data: CoinsData?
)

@Serializable
data class CoinsData(
    @SerialName("stats")
    val stats: CoinStats?,
    @SerialName("coins")
    val coins: List<CoinDetail>?
)

@Serializable
data class CoinStats(
    @SerialName("total")
    val total: Int?,
    @SerialName("totalCoins")
    val totalCoins: Int?,
    @SerialName("totalMarkets")
    val totalMarkets: Int?,
    @SerialName("totalExchanges")
    val totalExchanges: Int?,
    @SerialName("totalMarketCap")
    val totalMarketCap: String?,
    @SerialName("total24hVolume")
    val total24hVolume: String?
)

@Serializable
data class CoinDetail(
    @SerialName("uuid")
    val uuid: String?,
    @SerialName("symbol")
    val symbol: String?,
    @SerialName("name")
    val name: String?,
    @SerialName("color")
    val color: String?,
    @SerialName("iconUrl")
    val iconUrl: String?,
    @SerialName("marketCap")
    val marketCap: String?,
    @SerialName("price")
    val price: String?,
    @SerialName("listedAt")
    val listedAt: Int?,
    @SerialName("tier")
    val tier: Int?,
    @SerialName("change")
    val change: String?,
    @SerialName("rank")
    val rank: Int?,
    @SerialName("sparkline")
    val sparkline: List<String?>?,
    @SerialName("lowVolume")
    val lowVolume: Boolean?,
    @SerialName("coinrankingUrl")
    val coinrankingUrl: String?,
//    @SerialName("volume24h")
//    val volume24h: String?,
    @SerialName("btcPrice")
    val btcPrice: String?,
    @SerialName("contractAddresses")
    val contractAddresses: List<String?>?,
//    @SerialName("hasContent")
//    val hasContent: Boolean?,
//    @SerialName("notices")
//    val notices: String?,
//    @SerialName("tags")
//    val tags: List<String?>?
)

@Serializable
data class Link(
    @SerialName("name")
    val name: String?,
    @SerialName("type")
    val type: String?,
    @SerialName("url")
    val url: String?
)

@Serializable
data class Supply(
    @SerialName("confirmed")
    val confirmed: Boolean?,
    @SerialName("supplyAt")
    val supplyAt: Int?,
    @SerialName("max")
    val max: String?,
    @SerialName("total")
    val total: String?,
    @SerialName("circulating")
    val circulating: String?
)

@Serializable
data class AllTimeHigh(
    @SerialName("price")
    val price: String?,
    @SerialName("timestamp")
    val timestamp: Int?
)