package com.example.coinrankkmm.Coins

import com.rickclephas.kmp.nativecoroutines.NativeCoroutines
import io.ktor.client.HttpClient
import io.ktor.client.call.body
import io.ktor.client.plugins.defaultRequest
import io.ktor.client.request.headers
import io.ktor.client.request.get

const val apiKey = "coinranking3f6c356c9d53d550ea8edbcf66a33cb3c0263af1db8754ad"


class CoinsService(private val httpClient: HttpClient) {
    private val baseURL: String = "https://"
    private val coinAPIUrl = "api.coinranking.com/v2"

    @NativeCoroutines
    suspend fun fetchCoins(): List<CoinDetail>? {
        val response = httpClient.get("$baseURL$coinAPIUrl/coins").body<CoinsResponse>() // https://api.coinranking.com/v2/coins
        return response.data?.coins
    }
}