package com.example.coinrankkmm.di

import org.koin.core.context.startKoin
import org.koin.core.module.Module

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
