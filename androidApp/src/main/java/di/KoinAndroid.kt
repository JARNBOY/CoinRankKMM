package di

import com.example.coinrankkmm.coins.CoinsViewModel
import org.koin.androidx.viewmodel.dsl.viewModel
import org.koin.dsl.module

val viewModelModule = module {
    viewModel<CoinsViewModel> { CoinsViewModel(get()) }
}