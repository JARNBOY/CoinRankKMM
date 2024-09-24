package com.example.coinrankkmm.Coins.di

import com.example.coinrankkmm.Coins.CoinsService
import com.example.coinrankkmm.Coins.CoinsUseCase
import com.example.coinrankkmm.Coins.CoinsViewModel
import com.example.coinrankkmm.Coins.apiKey
import io.ktor.client.HttpClient
import io.ktor.client.plugins.contentnegotiation.ContentNegotiation
import io.ktor.client.plugins.defaultRequest
import io.ktor.client.request.headers
import io.ktor.serialization.kotlinx.json.json
import kotlinx.serialization.json.Json
import org.koin.dsl.module

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
}