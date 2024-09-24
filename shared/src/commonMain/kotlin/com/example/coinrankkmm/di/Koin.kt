package com.example.coinrankkmm.di

import com.example.coinrankkmm.Coins.CoinsService
import com.example.coinrankkmm.Coins.CoinsUseCase
import com.example.coinrankkmm.Coins.CoinsViewModel
import com.example.coinrankkmm.Coins.di.coinsModule
import com.example.coinrankkmm.Coins.di.coinsRepositoryModule
import org.koin.core.context.startKoin
import org.koin.core.module.Module
import org.koin.dsl.module

fun initKoin() = initKoin(emptyList())

fun initKoin(extraModules: List<Module>) {
    startKoin {
        modules(
            coinsRepositoryModule,
            coinsModule,
            *extraModules.toTypedArray()
        )
    }
}
