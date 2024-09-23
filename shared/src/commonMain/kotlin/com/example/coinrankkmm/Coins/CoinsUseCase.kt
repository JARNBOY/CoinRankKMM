package com.example.coinrankkmm.Coins

class CoinsUseCase(private val service: CoinsService) {

    suspend fun getCoins(): List<Coin> {
        val coins = service.fetchCoins()
        return mapCoins(coins)
    }

    private fun mapCoins(coins: List<CoinDetail?>?): List<Coin> {
        return coins?.mapNotNull { coinDetail ->
            coinDetail?.let {
                Coin(
                    iconUrl = it.iconUrl ?: "",
                    name = it.name ?: "",
                    symbol = it.symbol ?: "",
                    price = it.price?.toDoubleOrNull() ?: 0.0,
                    change = it.change?.toDoubleOrNull() ?: 0.0,
                    uuid = it.uuid ?: "",
                    rank = it.rank ?: 0,
                    isChangePositive = it.change?.toDoubleOrNull() ?: 0.0 > 0
                )
            }
        } ?: emptyList()
    }
}