package com.example.coinrankkmm.coins.domain.usecase

import com.example.coinrankkmm.coins.domain.repository.CoinsRepository
import com.example.coinrankkmm.coins.data.CoinDetail
import com.example.coinrankkmm.coins.presentation.Coin
import com.rickclephas.kmp.nativecoroutines.NativeCoroutines

class CoinsUseCase(private val repository: CoinsRepository) {

    @NativeCoroutines
    suspend fun getCoins(): List<Coin> {
        val coins = repository.getCoins()
        return mapCoins(coins)
    }

    private fun mapCoins(coins: List<CoinDetail>?): List<Coin> {
        return coins?.mapNotNull { coinDetail ->
            coinDetail.let {
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