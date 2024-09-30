package com.example.coinrankkmm.di

import com.example.coinrankkmm.coins.domain.repository.CoinsRepository
import com.example.coinrankkmm.coins.domain.repository.CoinsRepositoryImpl
import com.example.coinrankkmm.coins.domain.services.CoinsService
import com.example.coinrankkmm.coins.domain.usecase.CoinsUseCase
import com.example.coinrankkmm.coins.presentation.CoinsViewModel
import com.example.coinrankkmm.coins.domain.services.apiKey
import io.ktor.client.HttpClient
import io.ktor.client.plugins.contentnegotiation.ContentNegotiation
import io.ktor.client.plugins.defaultRequest
import io.ktor.client.request.headers
import io.ktor.serialization.kotlinx.json.json
import kotlinx.serialization.json.Json
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