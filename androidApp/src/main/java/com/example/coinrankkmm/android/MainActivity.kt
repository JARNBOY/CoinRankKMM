package com.example.coinrankkmm.android

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.collectAsState
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import com.example.coinrankkmm.coins.CoinsViewModel
import com.example.coinrankkmm.di.initKoin
import di.viewModelModule
import org.koin.androidx.viewmodel.ext.android.viewModel


class MainActivity : ComponentActivity() {
    private val coinsViewModel: CoinsViewModel by viewModel()
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        initKoin(
            extraModules = listOf(viewModelModule)
        )

        setContent {
            MyApplicationTheme {
                LaunchedEffect(Unit) {
                    coinsViewModel.getCoins()
                }
                val coinsState = coinsViewModel.coinsState.collectAsState()
                Column(modifier = Modifier.fillMaxSize()) {
                    coinsState.value.coins.forEach {
                        Text(text = it.name)
                    }
                }
//                Surface(
//                    modifier = Modifier.fillMaxSize(),
//                    color = MaterialTheme.colorScheme.background
//                ) {
//                    AboutScreen()
//                }
            }
        }
    }
}

@Preview
@Composable
fun DefaultPreview() {
    MyApplicationTheme {
        AboutScreen()
    }
}
