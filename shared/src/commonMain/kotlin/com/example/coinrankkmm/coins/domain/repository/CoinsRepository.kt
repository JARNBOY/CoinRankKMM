package com.example.coinrankkmm.coins.domain.repository

import com.example.coinrankkmm.coins.domain.services.CoinsService
import com.example.coinrankkmm.coins.data.CoinDetail
import com.rickclephas.kmp.nativecoroutines.NativeCoroutines

interface CoinsRepository {
    @NativeCoroutines
    suspend fun getCoins(): Result<List<CoinDetail>?>
}
class CoinsRepositoryImpl(
    private val service: CoinsService
): CoinsRepository {

    @NativeCoroutines
    override suspend fun getCoins(): Result<List<CoinDetail>?> {
        return service.fetchCoins()
    }
}