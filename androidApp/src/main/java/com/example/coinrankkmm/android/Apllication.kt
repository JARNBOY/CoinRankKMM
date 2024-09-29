package com.example.coinrankkmm.android

import android.os.Bundle
import androidx.activity.ComponentActivity
import com.example.coinrankkmm.di.initKoin
import di.viewModelModule
import org.koin.androidx.viewmodel.dsl.viewModel

class Application: ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        initKoin(
            extraModules = listOf(viewModelModule)
        )
    }
}