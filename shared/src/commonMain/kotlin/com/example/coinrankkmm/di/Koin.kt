package com.example.coinrankkmm.di

import com.example.coinrankkmm.coins.CoinsRepository
import com.example.coinrankkmm.coins.CoinsRepositoryImpl
import com.example.coinrankkmm.coins.CoinsService
import com.example.coinrankkmm.coins.CoinsUseCase
import com.example.coinrankkmm.coins.CoinsViewModel
import com.example.coinrankkmm.coins.apiKey
import io.ktor.client.HttpClient
import io.ktor.client.plugins.contentnegotiation.ContentNegotiation
import io.ktor.client.plugins.defaultRequest
import io.ktor.client.request.headers
import io.ktor.serialization.kotlinx.json.json
import kotlinx.serialization.json.Json
import org.koin.core.context.startKoin
import org.koin.core.module.Module
import org.koin.dsl.module

val coinsModule = module {
    single<CoinsService> { CoinsService(get()) }
    factory { CoinsUseCase(get()) }
    single<CoinsViewModel> { CoinsViewModel(get()) }
}

val coinsRepositoryModule = module {
    single<HttpClient> {
        HttpClient {
            install(ContentNegotiation) {
                json(Json {
                    prettyPrint = true
                    isLenient = true
                    ignoreUnknownKeys = true
                })
            }
            defaultRequest {
                headers {
                    append("x-access-token", apiKey)
                }
            }
        }
    }
    single<CoinsRepository> { CoinsRepositoryImpl(get()) }
}

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
