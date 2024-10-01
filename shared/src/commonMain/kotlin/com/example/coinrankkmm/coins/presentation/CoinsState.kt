package com.example.coinrankkmm.coins.presentation

data class CoinsState (
    val coins: List<Coin> = listOf(),
    val topThreeCoins: List<Coin> = listOf(),
    var selectedCoin: Coin = Coin(),
    val loading: Boolean = false,
    val error: String? = null
)