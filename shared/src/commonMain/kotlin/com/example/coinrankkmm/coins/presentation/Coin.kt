package com.example.coinrankkmm.coins.presentation

data class Coin (
    val iconUrl: String = "",
    val name: String = "",
    val symbol: String = "",
    val price: Double = 0.0,
    val change: Double = 0.0,
    val uuid: String = "",
    val rank: Int = 0,
    val isChangePositive: Boolean = false,
    var websiteUrl: String = "https://bitcoin.org",
    var hexColor: String = "",
    val marketCap: String = ""
)