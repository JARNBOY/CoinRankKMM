package com.example.coinrankkmm.coins.presentation

import com.example.coinrankkmm.coins.domain.usecase.CoinsUseCase
import com.rickclephas.kmp.nativecoroutines.NativeCoroutinesState
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.launch
import com.rickclephas.kmp.observableviewmodel.coroutineScope
import com.rickclephas.kmp.observableviewmodel.ViewModel
import com.rickclephas.kmp.observableviewmodel.MutableStateFlow
import com.rickclephas.kmp.observableviewmodel.stateIn
import kotlinx.coroutines.flow.SharingStarted

open class CoinsViewModel(
    private val coinsUseCase: CoinsUseCase
): ViewModel() {
    private val _coinsState: MutableStateFlow<CoinsState> = MutableStateFlow(viewModelScope, CoinsState())

    @NativeCoroutinesState
    val coinsState: StateFlow<CoinsState>  = _coinsState.stateIn(viewModelScope, SharingStarted.WhileSubscribed(), CoinsState())

    fun getCoins() {
        viewModelScope.coroutineScope.launch {
            _coinsState.value = _coinsState.value.copy(loading = true)
            val fetchedCoinsResult = coinsUseCase.getCoins()
            fetchedCoinsResult.onSuccess { fetchedCoins ->
                _coinsState.value = _coinsState.value.copy(
                    coins = fetchedCoins,
                    topThreeCoins = fetchedCoins.take(3),
                    loading = false
                )
            }.onFailure { exception ->
                _coinsState.value = _coinsState.value.copy(
                    error = exception.message,
                    loading = false
                )
            }
        }
    }

    fun clearCoins() {
        viewModelScope.coroutineScope.launch {
            _coinsState.value = _coinsState.value.copy(
                coins = listOf(),
                topThreeCoins = listOf(),
                loading = false
            )
        }
    }
}