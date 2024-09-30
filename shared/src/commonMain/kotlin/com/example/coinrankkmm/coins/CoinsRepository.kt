package com.example.coinrankkmm.coins

import com.rickclephas.kmp.nativecoroutines.NativeCoroutines

interface CoinsRepository {
    @NativeCoroutines
    suspend fun getCoins(): List<CoinDetail>?
}
class CoinsRepositoryImpl(
    private val service: CoinsService
): CoinsRepository {

    @NativeCoroutines
    override suspend fun getCoins(): List<CoinDetail>? {
        return service.fetchCoins()
    }

}