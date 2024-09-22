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
import kotlinx.coroutines.flow.SharingStarted
import kotlinx.coroutines.flow.flowOf
import kotlinx.coroutines.flow.stateIn

open class CoinsViewModel: ViewModel() {
    private val _coinsState: MutableStateFlow<CoinsState> = MutableStateFlow(viewModelScope, CoinsState())

    @NativeCoroutinesState
    val coinsState: StateFlow<CoinsState>  = _coinsState.stateIn(viewModelScope, SharingStarted.WhileSubscribed(), CoinsState())

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

    fun getCoins() {
        viewModelScope.coroutineScope.launch {
            val fetchedCoins = fetchCoins()
            delay(500)
            _coinsState.value = _coinsState.value.copy(coins = fetchedCoins) //CoinsState(coins = fetchedCoins)
        }
    }

    private suspend fun fetchCoins(): List<Coin> = mockCoins

    val mockCoins: List<Coin> = listOf(
        coinRankOne,
        coinRankTwo,
        coinRankThree
    )
}