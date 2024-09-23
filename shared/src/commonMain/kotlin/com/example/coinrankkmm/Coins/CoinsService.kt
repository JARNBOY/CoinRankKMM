package com.example.coinrankkmm.Coins

import io.ktor.client.HttpClient
import io.ktor.client.call.body
import io.ktor.client.plugins.defaultRequest
import io.ktor.client.request.headers
import io.ktor.client.request.get

class CoinsService() {
    private val baseURL: String = "https://"
    private val coinAPIUrl = "api.coinranking.com/v2"
    private val apiKey = "coinranking3f6c356c9d53d550ea8edbcf66a33cb3c0263af1db8754ad"
    private val httpClient = HttpClient {
        defaultRequest {
            headers {
                append("x-access-token", apiKey)
            }
        }
    }

    suspend fun fetchCoins(): List<CoinDetail?>? {
        val response: CoinsResponse = httpClient.get("$baseURL$coinAPIUrl/coins").body()
        return response.data.coins  // Assuming CoinsResponse has an 'articles' property
    }

}