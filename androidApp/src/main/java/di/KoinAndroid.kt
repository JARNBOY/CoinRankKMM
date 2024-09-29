package di

import com.example.coinrankkmm.Coins.CoinsViewModel
import org.koin.androidx.viewmodel.dsl.viewModel
import org.koin.dsl.module

val viewModelModule = module {
    viewModel<CoinsViewModel> { CoinsViewModel(get()) }
}