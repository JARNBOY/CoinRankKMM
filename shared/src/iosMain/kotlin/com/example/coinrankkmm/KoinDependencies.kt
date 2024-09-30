package com.example.coinrankkmm

import com.example.coinrankkmm.coins.CoinsUseCase
import org.koin.core.component.KoinComponent
import org.koin.core.component.inject

class KoinDependencies: KoinComponent {
    val coinsUseCase: CoinsUseCase by inject()
}