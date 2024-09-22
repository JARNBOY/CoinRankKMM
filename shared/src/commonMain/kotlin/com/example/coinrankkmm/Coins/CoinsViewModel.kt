package com.example.coinrankkmm.Coins

import com.example.coinrankkmm.BaseViewModel
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.MutableStateFlow

class CoinsViewModel: BaseViewModel() {
    val _coinsState: MutableStateFlow<CoinsState> = MutableStateFlow(CoinsState())

    val coinsState: StateFlow<CoinsState> get() = _coinsState
}