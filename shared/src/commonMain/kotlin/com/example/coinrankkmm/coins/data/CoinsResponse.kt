package com.example.coinrankkmm.coins.data

import kotlinx.serialization.Serializable
import kotlinx.serialization.SerialName

@Serializable
data class CoinsResponse(
    @SerialName("status")
    val status: String?,
    @SerialName("data")
    val data: CoinsData?,
    @SerialName("error")
    val error: ErrorResponse? = null
)

@Serializable
data class ErrorResponse(
    @SerialName("message")
    val message: String?
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
    val uuid: String? = null,
    @SerialName("symbol")
    val symbol: String? = null,
    @SerialName("name")
    val name: String? = null,
    @SerialName("color")
    val color: String? = null,
    @SerialName("iconUrl")
    val iconUrl: String? = null,
    @SerialName("marketCap")
    val marketCap: String? = null,
    @SerialName("price")
    val price: String? = null,
    @SerialName("listedAt")
    val listedAt: Int? = null,
    @SerialName("tier")
    val tier: Int? = null,
    @SerialName("change")
    val change: String? = null,
    @SerialName("rank")
    val rank: Int? = null,
    @SerialName("sparkline")
    val sparkline: List<String?>? = null,
    @SerialName("lowVolume")
    val lowVolume: Boolean? = null,
    @SerialName("coinrankingUrl")
    val coinrankingUrl: String? = null,
    @SerialName("volume24h")
    val volume24h: String? = null,
    @SerialName("btcPrice")
    val btcPrice: String? = null,
    @SerialName("contractAddresses")
    val contractAddresses: List<String?>? = null,
    @SerialName("hasContent")
    val hasContent: Boolean? = null,
    @SerialName("notices")
    val notices: String? = null,
    @SerialName("tags")
    val tags: List<String?>? = null,
    @SerialName("websiteUrl")
    val websiteUrl: String? = null
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