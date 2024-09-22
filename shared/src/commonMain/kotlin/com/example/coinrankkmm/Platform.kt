package com.example.coinrankkmm

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform