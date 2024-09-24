package com.example.coinrankkmm.Coins

import com.rickclephas.kmp.nativecoroutines.NativeCoroutinesState
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.launch
import kotlinx.coroutines.delay
import com.rickclephas.kmp.observableviewmodel.coroutineScope
import com.rickclephas.kmp.observableviewmodel.ViewModel
import com.rickclephas.kmp.observableviewmodel.MutableStateFlow
import com.rickclephas.kmp.observableviewmodel.stateIn
import io.ktor.client.HttpClient
import io.ktor.client.plugins.contentnegotiation.ContentNegotiation
import io.ktor.client.plugins.defaultRequest
import io.ktor.client.request.headers
import io.ktor.serialization.kotlinx.json.json
import kotlinx.coroutines.flow.SharingStarted
import kotlinx.coroutines.flow.flowOf
import kotlinx.coroutines.flow.stateIn
import kotlinx.serialization.json.Json

open class CoinsViewModel(
    private val coinsUseCase: CoinsUseCase
): ViewModel() {
    private val _coinsState: MutableStateFlow<CoinsState> = MutableStateFlow(viewModelScope, CoinsState())

    @NativeCoroutinesState
    val coinsState: StateFlow<CoinsState>  = _coinsState.stateIn(viewModelScope, SharingStarted.WhileSubscribed(), CoinsState())

    fun getCoins() {
        viewModelScope.coroutineScope.launch {
            val fetchedCoins = coinsUseCase.getCoins()
            _coinsState.value = _coinsState.value.copy(coins = fetchedCoins)
        }
    }

    // Mock
    private suspend fun fetchCoins(): List<Coin> = mockCoins

    val coinRankOne: Coin = Coin(
        "https://cdn.coinranking.com/bOabBYkcX/bitcoin_btc.svg",
        "Bitcoin",
        "BTC",
        68179.45102665898,
        1.54,
        "Qwsogvtv82FCd",
        1,
        1.54 > 0
    )

    var coinRankTwo: Coin = Coin(
        "https://cdn.coinranking.com/bOabBYkcX/bitcoin_btc.svg",
        "Etherium",
        "ETH",
        30000.00,
        -2.0,
        "Qwsogvtv82FCe",
        2,
        -2 > 0
    )

    var coinRankThree: Coin = Coin(
        "https://cdn.coinranking.com/bOabBYkcX/bitcoin_btc.svg",
        "United State Dollar",
        "USDT",
        1.02,
        -0.5,
        "Qwsogvtv82FCf",
        3,
        -0.5 > 0
    )

    val mockCoins: List<Coin> = listOf(
        coinRankOne,
        coinRankTwo,
        coinRankThree
    )
}