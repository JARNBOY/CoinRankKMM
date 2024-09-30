package com.example.coinrankkmm.coins

data class Coin (
    val iconUrl: String,
    val name: String,
    val symbol: String,
    val price: Double,
    val change: Double,
    val uuid: String,
    val rank: Int,
    val isChangePositive: Boolean
)