package com.example.coinrankkmm.Coins.di

import com.example.coinrankkmm.Coins.CoinsService
import com.example.coinrankkmm.Coins.CoinsUseCase
import com.example.coinrankkmm.Coins.CoinsViewModel
import org.koin.dsl.module

val coinsModule = module {
    single<CoinsService> { CoinsService(get()) }
    single<CoinsUseCase> { CoinsUseCase(get()) }
    single<CoinsViewModel> { CoinsViewModel(get()) }
}