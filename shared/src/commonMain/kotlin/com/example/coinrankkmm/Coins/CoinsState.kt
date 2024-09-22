package com.example.coinrankkmm.Coins

data class CoinsState (
    val coins: List<Coin> = listOf(),
    val loading: Boolean = false,
    val error: String? = null
)
