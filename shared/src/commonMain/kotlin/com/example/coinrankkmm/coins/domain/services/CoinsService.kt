package com.example.coinrankkmm.coins.domain.services

import com.example.coinrankkmm.coins.data.CoinDetail
import com.example.coinrankkmm.coins.data.CoinsResponse
import com.rickclephas.kmp.nativecoroutines.NativeCoroutines
import io.ktor.client.HttpClient
import io.ktor.client.call.body
import io.ktor.client.request.get
import io.ktor.utils.io.errors.IOException

const val apiKey = "coinranking3f6c356c9d53d550ea8edbcf66a33cb3c0263af1db8754ad"


class CoinsService(private val httpClient: HttpClient) {
    private val baseURL: String = "https://"
    private val coinAPIUrl = "api.coinranking.com/v2"

    @NativeCoroutines
    suspend fun fetchCoins(): Result<List<CoinDetail>?> {
        try {
            val response = httpClient.get("$baseURL$coinAPIUrl/coins").body<CoinsResponse>()
            // Check for successful HTTP response code
            if (response.error != null) {
                throw IOException("API request failed with status code: ${response.error.message}")
            }
            return Result.success(response.data?.coins ?: emptyList())
        } catch (e: Exception) {
            // Handle other potential exceptions like network errors, parsing errors etc.
            throw Exception("Error fetching coins: ${e.message}", e)
        }

    }
}